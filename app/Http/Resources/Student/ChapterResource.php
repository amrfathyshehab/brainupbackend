<?php

namespace App\Http\Resources\Student;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ChapterResource extends JsonResource
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
            'name'        => $this->name,
            'description' => $this->description,
            'stage'       => $this->stage,
            'visibility'  => $this->visibility,
            'img'         => asset('uploads/lectures/images/' . $this->img),
            'created_by'  => $this->teacher->name,
            'is_chapter'  => 1,
            'created_at'  => $this->created_at->format('F j, Y, g:i a'),
        ];
    }
}
