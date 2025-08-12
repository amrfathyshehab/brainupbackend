<?php
  
namespace App\Models;
  
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Passwordtoken extends Model
{
    use SoftDeletes;

    protected $table = 'password_tokens';

    protected $fillable = [
        'student_id',
        'otp',
        'expire_at',
    ];
}
