<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;


class Student extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable , HasRoles;

    /**
     * Guard for the model
     *
     * @var string
     */


    protected $table = 'students';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'username',
        'password',
        'stage',
        'area',
        'mobile',
        'parent_mobile',
        'parent_mobile2',
        'parent_id',
         'school',
        'active',
        'profile_pic',
        'section',
        'approved_by',
        'amount',


    ];
    public function groups()
    {
        return $this->belongsTo('App\Models\Group','group_id');

     }

     public function teacher()
     {
         return $this->belongsTo('App\Models\Admin','approved_by');

      }

      public function histories()
        {
            return $this->hasMany('App\Models\History', 'student_id');
        }
    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

}
