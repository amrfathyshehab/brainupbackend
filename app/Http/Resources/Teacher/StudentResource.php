<?php

namespace App\Http\Resources\Teacher;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class StudentResource extends JsonResource
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
            'name'          => $this->name,
            'mobile'        => $this->mobile,
            'parent_mobile' => $this->parent_mobile,
            'school'        => $this->school,
            'stage'         => $this->stage,
            'city'          => $this->city?->city_name_ar,
            'approved_by'   => $this->admin?->name,
            'status'        => $this->translateStatus($this->pivot->status),
            'requested_at'  => $this->pivot->requested_at,
        ];
    }

    private function translateStatus(?string $status): string
    {
        return match ($status) {
            'pending'       => 'قيد الانتظار',
            'approved'      => 'مقبول',
            'rejected'      => 'مرفوض',
            default         => 'لم يتم الطلب'
        };
    }
}
