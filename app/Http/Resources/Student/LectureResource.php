<?php

namespace App\Http\Resources\Student;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class LectureResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'key'         => $this->id,
            'title'       => $this->title,
            'description' => $this->description,
            'is_chapter'  => 0,
            'stage'       => $this->stage,
            'visibility'  => $this->visibility,
            'img'         => asset('uploads/lectures/images/' . $this->img),
            'created_by'  => $this->teacher->name,
            'chapter_id'  => $this->chapter_id,
            'price'       => $this->price,
            'v_hw'        => $this->v_hw,
            'v_quiz'      => $this->v_quiz,
            'expired_at'  => $this->expired_at,
            'created_at'  => $this->created_at->format('F j, Y, g:i a'),
        ];
    }
}
