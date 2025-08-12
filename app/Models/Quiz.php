<?php
  
namespace App\Models;
  
use Illuminate\Database\Eloquent\Model;
 
class Quiz extends Model
{
    protected $table = 'quizzes';

    protected $fillable = [
        'duration',
        'lecture_id',
        'visibility',
        'success_rate'
      
      ];

      public function lecture()
      {
          return $this->belongsTo('App\Models\Lecture','lecture_id');
  
       }
    
}
