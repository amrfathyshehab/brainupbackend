<?php
  
namespace App\Models;
  
use Illuminate\Database\Eloquent\Model;
 
class Homework extends Model
{
    protected $table = 'homeworks';

    protected $fillable = [
        'title',
        'lecture_id',
        'visibility',
        'success_rate'

      
      ];

      public function lecture()
      {
          return $this->belongsTo('App\Models\Lecture','lecture_id');
  
       }
    
}
