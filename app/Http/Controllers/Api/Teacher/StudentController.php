<?php

namespace App\Http\Controllers\Api\Teacher;

use App\Http\Controllers\Controller;
use App\Http\Resources\Teacher\StudentResource;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class StudentController extends Controller
{
    public function requests(Request $request)
    {
        $status = $request->query('status', 'pending');

        $allowedStatuses = ['pending', 'approved', 'rejected'];
        if (!in_array($status, $allowedStatuses)) {
            return response()->json([
                'status'  => false,
                'message' => 'Invalid status value',
            ], 422);
        }

        $teacher = Auth::user();
        $stage  = $request->query('stage');

        $students = $teacher->students()
            ->with(['city:id,city_name_ar', 'admin:id,name'])
            ->wherePivot('status', $status)
            ->when($stage, fn($q) => $q->where('stage', $stage))
            ->get();

        return response()->json([
            'status'  => true,
            'message' => 'Requests fetched successfully',
            'data'    => StudentResource::collection($students),
        ]);
    }

    public function approveRequest($studentId)
    {
        $teacher = Auth::user();

        $teacher->students()->updateExistingPivot($studentId, [
            'status'      => 'approved',
            'approved_at' => now(),
        ]);

        return response()->json([
            'status'  => true,
            'message' => 'تمت الموافقة على الطلب'
        ]);
    }

    public function rejectRequest($studentId)
    {
        $teacher = Auth::user();

        $teacher->students()->updateExistingPivot($studentId, [
            'status'      => 'rejected',
            'rejected_at' => now(),
        ]);

        return response()->json([
            'status'  => true,
            'message' => 'تم رفض الطلب'
        ]);
    }

    public function numbering()
    {
        $teacher = Auth::user();

        $pendingRequests = $teacher->students()
            ->wherePivot('status', 'pending')
            ->count();

        return response()->json([
            'status'  => true,
            'message' => 'Number of pending requests',
            'data'    => [
                'pending_requests' => $pendingRequests
            ]
        ]);
    }
}
