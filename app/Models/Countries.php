<?php
  
namespace App\Models;
  
use Illuminate\Database\Eloquent\Model;
 
class Countries extends Model
{
    protected $table = 'Countries';

    protected $fillable = [
        'country_name_ar',
        'country_name_en',

    ];
}