<?php
  
namespace App\Models;
  
use Illuminate\Database\Eloquent\Model;
 
class Studentanswer extends Model
{
    protected $table = 'student_answers';

    protected $fillable = [
        'q_id',
        'student_answer',
        'student_id',
        'quiz_id',
        'homework_id',
        'is_essay',
        'n',
        'exam_id',
        'draft',
        'is_correct'


      ];

      public function question()
      {
          return $this->belongsTo('App\Models\QuestionbankQuestion','q_id');
  
       }
  
      public function student()
      {
          return $this->belongsTo('App\Models\Student','student_id');
  
       }
       public function quiz()
       {
           return $this->belongsTo('App\Models\Quiz','quiz_id');
   
        }
        public function homework()
        {
            return $this->belongsTo('App\Models\Homework','homework_id');
    
         }
}
