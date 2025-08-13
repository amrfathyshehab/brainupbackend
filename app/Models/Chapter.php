<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Chapter extends Model
{
    protected $fillable = [
        'name',
        'description',
        'stage',
        'visibility',
        'img',
        'teacher_id',
        'section'
    ];

    public function teacher()
    {
        return $this->belongsTo(Teacher::class, 'teacher_id')->withTrashed();
    }
}
