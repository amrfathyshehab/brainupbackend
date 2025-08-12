<?php
  
namespace App\Models;
  
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Code extends Model
{
    protected $table = 'codes';

    protected $fillable = [
        'code',
        'price',
        'created_at',
     ];
     use SoftDeletes;

}
