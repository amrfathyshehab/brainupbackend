<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;
use Illuminate\Database\Eloquent\SoftDeletes;

class Teacher extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable, HasRoles, SoftDeletes;

    protected $guard_name = 'teachers';

    protected $table = 'teachers';

    protected $fillable = [
        'name',
        'username',
        'password',
        'api_token',
        'mobile',
        'profile_pic',
        'subject',
        'description',
        'cover_path'
    ];

    protected $hidden = [
        'username',
        'api_token',
        'password',
        'remember_token',
    ];

    public function lectures()
    {
        return $this->hasMany(Lecture::class, 'teacher_id');
    }

    public function students()
    {
        return $this->belongsToMany(Student::class, 'student_teacher_requests')
            ->withPivot('status', 'requested_at', 'approved_at', 'rejected_at');
    }

    public function barcodes()
    {
        return $this->hasMany(Barcode::class, 'teacher_id');
    }

    public function scopeApprovedForStudent($query, $studentId)
    {
        return $query->whereHas('students', function ($q) use ($studentId) {
            $q->where('students.id', $studentId)
                ->wherePivot('status', 'approved');
        });
    }
}
