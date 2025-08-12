<?php
  
namespace App\Models;
  
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Session extends Model
{
    use SoftDeletes;

    protected $table = 'attendance_session';

    protected $fillable = [
        'name',
        'quiz_degree',
        'group_id',
        'days'
     ];
}
