<?php

namespace App\Http\Controllers\Api\Admin;

use App\Models\Barcode;
use App\Http\Controllers\Controller;
use App\Http\Resources\Admin\BarcodeResource;
use App\Models\Teacher;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Validator;
use Intervention\Image\ImageManager;
use Intervention\Image\Drivers\Gd\Driver;
use Intervention\Image\Encoders\PngEncoder;
use Picqer\Barcode\BarcodeGeneratorPNG;
use Mpdf\Mpdf;
use Exception;
use Illuminate\Support\Facades\File;

class BarcodeController extends Controller
{
    private $manager;
    private $generator;
    private $cardTemplate;
    private $cardPositions = [
        ['x' => 10,  'y' => 15],
        ['x' => 110, 'y' => 15],
        ['x' => 10,  'y' => 85],
        ['x' => 110, 'y' => 85],
        ['x' => 10,  'y' => 155],
        ['x' => 110, 'y' => 155],
        ['x' => 10,  'y' => 225],
        ['x' => 110, 'y' => 225],
    ];

    public function barcodes(Request $request)
    {
        $validator = $this->validateRequest($request);
        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->errors()->first(),
                'status'  => 400,
            ], 400);
        }

        $tempDir = $this->createTempDirectory();

        try {
            $totalCards = $request->count;
            $teacherId = $request->teacher_id;

            $this->initializeComponents($teacherId);
            // Generate unique codes in batch
            $barcodeCodes = $this->generateUniqueCodes($totalCards);

            return response()->streamDownload(
                fn() => $this->generatePDF($barcodeCodes, $teacherId, $tempDir),
                'barcode_cards_' . date('Y-m-d_H-i-s') . '.pdf'
            );
        } catch (Exception $e) {
            $this->cleanup($tempDir);
            return response()->json([
                'error' => 'حدث خطأ في توليد البطاقات: ' . $e->getMessage()
            ], 500);
        }
    }

    private function validateRequest(Request $request)
    {
        return Validator::make($request->all(), [
            'count'      => 'required|integer|min:1|max:1000',
            'teacher_id' => 'required|exists:teachers,id',
        ]);
    }

    private function createTempDirectory(): string
    {
        $tempDir = storage_path('app/tmp/' . uniqid('barcodes_', true));
        if (!is_dir($tempDir)) {
            mkdir($tempDir, 0777, true);
        }
        return $tempDir;
    }

    private function initializeComponents(int $teacherId = 0): void
    {
        $this->manager = new ImageManager(new Driver());
        $this->generator = new BarcodeGeneratorPNG();

        $cardPath = $this->getTeacherCoverPath($teacherId);
        $this->cardTemplate = $this->manager->read($cardPath);
    }

    private function generateUniqueCodes(int $count): array
    {
        // Get existing codes once
        $existingCodes = Barcode::pluck('code')->toArray();
        $existingCodesSet = array_flip($existingCodes); // Convert to hash for O(1) lookup

        $codes = [];
        $attempts = 0;
        $maxAttempts = $count * 10; // Prevent infinite loop

        while (count($codes) < $count && $attempts < $maxAttempts) {
            $code = strtoupper(Str::random(10));

            if (!isset($existingCodesSet[$code]) && !in_array($code, $codes)) {
                $codes[] = $code;
                $existingCodesSet[$code] = true; // Add to set for future checks
            }

            $attempts++;
        }

        if (count($codes) < $count) {
            throw new Exception('غير قادر على توليد ما يكفي من الرموز الفريدة');
        }

        return $codes;
    }

    private function generatePDF(array $barcodeCodes, int $teacherId, string $tempDir): void
    {
        $mpdf = new Mpdf([
            'format'        => 'A4',
            'orientation'   => 'P',
            'margin_left'   => 5,
            'margin_right'  => 5,
            'margin_top'    => 5,
            'margin_bottom' => 5
        ]);

        $barcodeData = [];
        $cardsPerPage = count($this->cardPositions);
        $totalCards = count($barcodeCodes);
        $cardCount = 0;

        // Add first page
        $mpdf->AddPage();

        foreach ($barcodeCodes as $i => $barcodeValue) {
            // Add to database batch
            $barcodeData[] = [
                'code'       => $barcodeValue,
                'teacher_id' => $teacherId,
                'created_at' => now(),
                'updated_at' => now()
            ];

            // Generate and save card image
            $filePath = $this->generateCardImage($barcodeValue, $tempDir, $i + 1);

            // Add to PDF
            $position = $this->cardPositions[$cardCount % $cardsPerPage];
            $mpdf->Image($filePath, $position['x'], $position['y'], 90, 55, 'png');

            $cardCount++;

            // Add new page if we've filled current page and there are more cards
            if ($cardCount % $cardsPerPage === 0 && $cardCount < $totalCards) {
                $mpdf->AddPage();
            }

            // Clean up individual card file to save space
            if (file_exists($filePath)) {
                unlink($filePath);
            }

            // Memory cleanup every 25 cards
            if ($cardCount % 25 === 0) {
                gc_collect_cycles();
            }
        }

        // Insert all barcodes in one batch
        if (!empty($barcodeData)) {
            Barcode::insert($barcodeData);
        }

        $mpdf->Output('', 'I');
        $this->cleanup($tempDir);
    }

    private function generateCardImage(string $barcodeValue, string $tempDir, int $cardNumber): string
    {
        // Generate barcode image
        $barcodeData = $this->generator->getBarcode($barcodeValue, $this->generator::TYPE_CODE_128, 2, 60);
        $barcodeImg = $this->manager->read($barcodeData);

        // Create card
        $card = clone $this->cardTemplate;
        $card->place($barcodeImg, 'center', 0, 0);
        $card->text($barcodeValue, $card->width() / 2, $card->height() / 2 + 44, function ($font) {
            $font->file(public_path('fonts/arial.ttf'));
            $font->size(18);
            $font->color('#000000');
            $font->align('center');
            $font->valign('center');
        });

        $filePath = $tempDir . "/card_$cardNumber.png";
        $card->encode(new PngEncoder())->save($filePath);

        return $filePath;
    }

    private function cleanup(string $tempDir): void
    {
        if (is_dir($tempDir)) {
            File::deleteDirectory($tempDir);
        }
    }

    /**
     * Get stored barcodes with pagination
     */
    public function getStoredBarcodes(Request $request)
    {
        try {
            $perPage = $request->get('per_page', 20);
            $teacherId = $request->get('teacher_id');

            $query = Barcode::with(['student']);

            if ($teacherId) {
                $query->where('teacher_id', $teacherId);
            }

            $barcodes = $query->orderBy('created_at', 'desc')
                ->paginate($perPage);

            return response()->json([
                'status'  => true,
                'message' => 'تم جلب البيانات بنجاح',
                'data'    => BarcodeResource::collection($barcodes)
            ]);
        } catch (Exception $e) {
            return response()->json([
                'error' => 'حدث خطأ في جلب البيانات: ' . $e->getMessage()
            ], 500);
        }
    }

    /**
     * Generate PDF from stored barcodes - Fixed version
     */
    public function generateFromStored(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'barcode_ids' => 'required|array|max:200',
            'barcode_ids.*' => 'exists:barcodes,id'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->errors()->first(),
                'status' => 400,
            ], 400);
        }

        $tempDir = $this->createTempDirectory();

        try {
            // Get teacher_id from first barcode to determine cover
            $barcodeIds = $request->barcode_ids;
            $firstBarcode = Barcode::select('teacher_id')
                ->whereIn('id', $barcodeIds)
                ->first();

            $teacherId = $firstBarcode ? $firstBarcode->teacher_id : null;
            $this->initializeStoredComponents($teacherId);

            $barcodes = $this->getBarcodesData($barcodeIds);

            if ($barcodes->isEmpty()) {
                throw new Exception('لم يتم العثور على باركود صالح');
            }

            return response()->streamDownload(
                fn() => $this->generateStoredPDF($barcodes, $tempDir),
                'stored_barcode_cards_' . date('Y-m-d_H-i-s') . '.pdf'
            );
        } catch (Exception $e) {
            $this->cleanup($tempDir);
            return response()->json([
                'error' => 'حدث خطأ في توليد البطاقات: ' . $e->getMessage()
            ], 500);
        }
    }

    private function initializeStoredComponents(int $teacherId = 0): void
    {
        $this->manager = new ImageManager(new Driver());
        $this->generator = new BarcodeGeneratorPNG();

        $cardPath = $this->getTeacherCoverPath($teacherId);
        $this->cardTemplate = $this->manager->read($cardPath);
    }

    private function getBarcodesData(array $barcodeIds)
    {
        return Barcode::select(['id', 'code', 'teacher_id'])
            ->whereIn('id', $barcodeIds)
            ->get();
    }

    private function generateStoredPDF($barcodes, string $tempDir): void
    {
        $mpdf = new Mpdf([
            'format'        => 'A4',
            'orientation'   => 'P',
            'margin_left'   => 5,
            'margin_right'  => 5,
            'margin_top'    => 5,
            'margin_bottom' => 5
        ]);

        $cardsPerPage = count($this->cardPositions);
        $totalCards = $barcodes->count();
        $cardCount = 0;

        // Add first page
        $mpdf->AddPage();

        foreach ($barcodes as $index => $barcode) {
            $filePath = $this->generateStoredCardImage($barcode, $tempDir, $index + 1);

            $position = $this->cardPositions[$cardCount % $cardsPerPage];
            $mpdf->Image($filePath, $position['x'], $position['y'], 90, 55, 'png');

            $cardCount++;

            // Add new page if we've filled current page and there are more cards
            if ($cardCount % $cardsPerPage === 0 && $cardCount < $totalCards) {
                $mpdf->AddPage();
            }

            // Clean up individual file
            if (file_exists($filePath)) {
                unlink($filePath);
            }

            // Memory cleanup every 25 cards
            if ($cardCount % 25 === 0) {
                gc_collect_cycles();
            }
        }

        $mpdf->Output('', 'I');
        $this->cleanup($tempDir);
    }

    private function generateStoredCardImage($barcode, string $tempDir, int $cardNumber): string
    {
        $barcodeData = $this->generator->getBarcode($barcode->code, $this->generator::TYPE_CODE_128, 2, 60);
        $barcodeImg = $this->manager->read($barcodeData);

        $card = clone $this->cardTemplate;
        $card->place($barcodeImg, 'center', 0, 0); // Place the barcode image x, y

        // Add text downward from the center of the image and 44 pixels from the bottom
        $card->text($barcode->code, $card->width() / 2, $card->height() / 2 + 44, function ($font) {
            $font->file(public_path('fonts/arial.ttf'));
            $font->size(18);
            $font->color('#000000');
            $font->align('center');
            $font->valign('center');
        });

        $filePath = $tempDir . "/stored_card_$cardNumber.png";
        $card->encode(new PngEncoder())->save($filePath);

        return $filePath;
    }

    /**
     * Search barcodes by code or teacher
     */
    public function searchBarcodes(Request $request)
    {
        try {
            $search = $request->get('search');
            $teacherId = $request->get('teacher_id');
            $perPage = $request->get('per_page', 20);

            $query = Barcode::orderBy('created_at', 'desc');

            if ($search) {
                $query->where('code', 'like', "%{$search}%");
            }

            if ($teacherId) {
                $query->where('teacher_id', $teacherId);
            }

            $barcodes = $query->orderBy('created_at', 'desc')
                ->paginate($perPage);

            return response()->json($barcodes);
        } catch (Exception $e) {
            return response()->json([
                'error' => 'حدث خطأ في البحث: ' . $e->getMessage()
            ], 500);
        }
    }

    /**
     * Delete selected barcodes
     */
    public function deleteBarcodes(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'barcode_ids' => 'required|array',
            'barcode_ids.*' => 'exists:barcodes,id'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->errors()->first(),
                'status' => 400,
            ], 400);
        }

        try {
            $deletedCount = Barcode::whereIn('id', $request->barcode_ids)
                ->delete();

            return response()->json([
                'message' => "تم حذف {$deletedCount} باركود بنجاح",
                'deleted_count' => $deletedCount
            ]);
        } catch (Exception $e) {
            return response()->json([
                'error' => 'حدث خطأ في الحذف: ' . $e->getMessage()
            ], 500);
        }
    }

    /**
     * Get teacher cover path based on teacher_id
     */
    private function getTeacherCoverPath(int $teacherId = 0): string
    {
        if ($teacherId) {
            $teacher = Teacher::select('cover_path')
                ->where('id', $teacherId)
                ->first();

            if (!$teacher || !$teacher->cover_path) {
                throw new Exception("من فضلك قم برفع صورة الغلاف (cover) أولاً");
            }

            $coverPath = $teacher->cover_path;

            if (!str_starts_with($coverPath, '/')) {
                $coverPath = public_path($coverPath);
            }

            if (file_exists($coverPath)) {
                return $coverPath;
            }

            throw new Exception("ملف الغلاف غير موجود، من فضلك ارفع صورة الغلاف أولاً");
        }

        throw new Exception("لم يتم تحديد المدرس أو لا يوجد له صورة غلاف");
    }

    /**
     * Get teacher cover for multiple teachers (for mixed barcode generation)
     */
    private function getTeacherCovers(array $teacherIds): array
    {
        $covers = [];

        $teachers = Teacher::select('id', 'cover_path')
            ->whereIn('id', $teacherIds)
            ->get()
            ->keyBy('id');

        foreach ($teacherIds as $teacherId) {
            $teacher = $teachers->get($teacherId);
            $coverPath = null;

            if ($teacher && $teacher->cover_path) {
                $coverPath = $teacher->cover_path;

                // If it's a relative path, make it absolute
                if (!str_starts_with($coverPath, '/')) {
                    $coverPath = public_path($coverPath);
                }

                if (file_exists($coverPath)) {
                    $covers[$teacherId] = $coverPath;
                    continue;
                }
            }

            // Fallback to default
            $covers[$teacherId] = public_path('uploads/covers/defualt.jpg');
        }

        return $covers;
    }

    /**
     * Generate cards with different covers for different teachers
     */
    private function generateMixedCardImage($barcode, string $tempDir, int $cardNumber, array $teacherCovers): string
    {
        $teacherId = $barcode->teacher_id;
        $coverPath = $teacherCovers[$teacherId] ?? public_path('uploads/covers/defualt.jpg');

        // Create manager and template for this specific teacher
        $manager = new ImageManager(new Driver());
        $cardTemplate = $manager->read($coverPath);

        $barcodeData = $this->generator->getBarcode($barcode->code, $this->generator::TYPE_CODE_128, 2, 60);
        $barcodeImg = $manager->read($barcodeData);

        $card = clone $cardTemplate;
        $card->place($barcodeImg, 'center', 0, 0);
        $card->text($barcode->code, $card->width() / 2, $card->height() / 2 + 44, function ($font) {
            $font->file(public_path('fonts/arial.ttf'));
            $font->size(18);
            $font->color('#000000');
            $font->align('center');
            $font->valign('center');
        });

        $filePath = $tempDir . "/mixed_card_$cardNumber.png";
        $card->encode(new PngEncoder())->save($filePath);

        return $filePath;
    }

    /**
     * Generate PDF from stored barcodes with mixed teachers/covers - Fixed version
     */
    public function generateMixedFromStored(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'barcode_ids' => 'required|array|max:200',
            'barcode_ids.*' => 'exists:barcodes,id'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->errors()->first(),
                'status' => 400,
            ], 400);
        }

        $tempDir = $this->createTempDirectory();

        try {
            $this->manager = new ImageManager(new Driver());
            $this->generator = new BarcodeGeneratorPNG();

            $barcodeIds = $request->barcode_ids;
            $barcodes = $this->getBarcodesData($barcodeIds);

            if ($barcodes->isEmpty()) {
                throw new Exception('لم يتم العثور على باركود صالح');
            }

            // Get all unique teacher IDs and their covers
            $teacherIds = $barcodes->pluck('teacher_id')->unique()->toArray();
            $teacherCovers = $this->getTeacherCovers($teacherIds);

            return response()->streamDownload(
                fn() => $this->generateMixedPDF($barcodes, $teacherCovers, $tempDir),
                'mixed_barcode_cards_' . date('Y-m-d_H-i-s') . '.pdf'
            );
        } catch (Exception $e) {
            $this->cleanup($tempDir);
            return response()->json([
                'error' => 'حدث خطأ في توليد البطاقات: ' . $e->getMessage()
            ], 500);
        }
    }

    private function generateMixedPDF($barcodes, array $teacherCovers, string $tempDir): void
    {
        $mpdf = new Mpdf([
            'format'        => 'A4',
            'orientation'   => 'P',
            'margin_left'   => 5,
            'margin_right'  => 5,
            'margin_top'    => 5,
            'margin_bottom' => 5
        ]);

        $cardsPerPage = count($this->cardPositions);
        $totalCards = $barcodes->count();
        $cardCount = 0;

        // Add first page
        $mpdf->AddPage();

        foreach ($barcodes as $index => $barcode) {
            $filePath = $this->generateMixedCardImage($barcode, $tempDir, $index + 1, $teacherCovers);

            $position = $this->cardPositions[$cardCount % $cardsPerPage];
            $mpdf->Image($filePath, $position['x'], $position['y'], 90, 55, 'png');

            $cardCount++;

            // Add new page if we've filled current page and there are more cards
            if ($cardCount % $cardsPerPage === 0 && $cardCount < $totalCards) {
                $mpdf->AddPage();
            }

            if (file_exists($filePath)) {
                unlink($filePath);
            }

            // Memory cleanup every 25 cards
            if ($cardCount % 25 === 0) {
                gc_collect_cycles();
            }
        }

        $mpdf->Output('', 'I');
        $this->cleanup($tempDir);
    }
}
