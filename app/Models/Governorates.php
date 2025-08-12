<?php
  
namespace App\Models;
  
use Illuminate\Database\Eloquent\Model;
 
class Governorates extends Model
{
    protected $fillable = [
        'governorate_name_ar',
        'country_id'
    ];
}