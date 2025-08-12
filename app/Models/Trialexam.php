<?php
  
namespace App\Models;
  
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Trialexam extends Model
{
    protected $table = 'trialexam';

    protected $fillable = [
        'name',
        'stage',
        'visibility',
        'price',
        'v_model',
        'is_buying',
        'nextlecture',
        'description',
        'img',
        'duration',
        'success_rate',
        'section',
         'edu_type'


     ];
     use SoftDeletes;

     public function lecture()
     {
         return $this->belongsTo('App\Models\Lecture','nextlecture');
 
      }
}
