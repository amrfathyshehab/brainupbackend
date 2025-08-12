<?php
  
namespace App\Models;
  
use Illuminate\Database\Eloquent\Model;
 
class SetsbankQuestion extends Model
{
    protected $table = 'bank_questions_sets';

    protected $fillable = [
        'category_id',
        'quiz_id',
        'easy',
        'medium',
        'hard',
        'homework_id',
        'lecture_id',
        'exam_id'


         	
      ];

      public function quiz()
      {
          return $this->belongsTo('App\Models\Quiz','quiz_id');
  
       }
       public function homework()
       {
           return $this->belongsTo('App\Models\Homework','homework_id');
   
        }
      public function categroy()
      {
          return $this->belongsTo('App\Models\QuestionbankCategory','category_id');
  
       }
}
