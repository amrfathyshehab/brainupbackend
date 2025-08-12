<?php
  
namespace App\Models;
  
use Illuminate\Database\Eloquent\Model;
 
class Cities extends Model
{
    protected $table = 'cities';

    protected $fillable = [
        'city_name_en','city_name_ar',
    ];
}
