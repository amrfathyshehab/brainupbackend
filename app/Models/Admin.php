<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;
use Illuminate\Database\Eloquent\SoftDeletes;


class Admin extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable, HasRoles, SoftDeletes;
    protected $table = 'admins';
    protected $guard_name = 'admin';

    protected $fillable = [
        'name',
        'username',
        'password',
        'api_token',
        'mobile',
        'profile_pic'
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];
}
