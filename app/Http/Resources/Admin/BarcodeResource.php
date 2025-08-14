<?php

namespace App\Http\Resources\Admin;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class BarcodeResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id'            => $this->id,
            'code'          => $this->code,
            'teacher_name'  => $this->whenLoaded('teacher', $this->teacher?->name, 'ليس متاح لك'),
            'student_name'  => $this->whenLoaded('student', $this->student?->name, 'غير مستخدم'),
            'created_at'    => $this->created_at->format('F j, Y, g:i A'),
        ];
    }
}
