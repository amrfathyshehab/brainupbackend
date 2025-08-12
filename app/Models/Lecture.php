<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Lecture extends Model
{
    protected $table = 'lectures';

    protected $fillable = [
        'title',
        'description',
        'visibility',
        'stage',
        'chapter_id',
        'price',
        'v_hw',
        'v_quiz',
        'img',
        'views',
        'expired_at',
        'teacher_id',
        'section'
    ];

    public function teacher()
    {
        return $this->belongsTo(Teacher::class, 'teacher_id');
    }

    public function histories()
    {
        return $this->hasMany(History::class, 'lecture_id');
    }
}
