<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;

class Student extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable, HasRoles;

    protected $table = 'students';

    protected $fillable = [
        'name',
        'username',
        'password',
        'stage',
        'mobile',
        'parent_mobile',
        'school',
        'area',
        'active',
        'lastseen',
        // 'profile_pic',
        // 'section',
        'approved_by',
        // 'amount',
    ];

    protected $hidden = [
        'username',
        'password',
        'remember_token',
        // Not used in this model at the moment
        'profile_pic',
        'section',
        'amount',
        'api_token'
    ];

    public function groups()
    {
        return $this->belongsTo(Group::class, 'group_id');
    }

    public function admin()
    {
        return $this->belongsTo(Admin::class, 'approved_by');
    }

    public function teachers()
    {
        return $this->belongsToMany(Teacher::class, 'student_teacher_requests')
            ->withPivot('status', 'requested_at', 'approved_at', 'rejected_at');
    }

    public function approvedLectures()
    {
        return Lecture::query()
            ->join('student_teacher_requests', 'lectures.teacher_id', '=', 'student_teacher_requests.teacher_id')
            ->where('student_teacher_requests.student_id', $this->id)
            ->where('student_teacher_requests.status', 'approved')
            ->where('lectures.stage', $this->stage)
            ->where('lectures.visibility', true)
            ->select('lectures.*');
    }

    public function histories()
    {
        return $this->hasMany(History::class, 'student_id');
    }

    public function city()
    {
        return $this->belongsTo(Cities::class, 'area');
    }
}
