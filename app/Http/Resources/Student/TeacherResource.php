<?php

namespace App\Http\Resources\Student;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class TeacherResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'username' => $this->username,
            'mobile' => $this->mobile,
            'profile_pic' => asset('uploads/profile_picture/' . $this->profile_pic),
            'subject' => $this->subject,
            'description' => $this->description
        ];
    }
}
