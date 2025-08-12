<?php
  
namespace App\Models;
  
use Illuminate\Database\Eloquent\Model;
 
class Studentresult extends Model
{
    protected $table = 'student_results';

    protected $fillable = [
        'student_degree',
        'assignment_degree',
        'student_id',
        'quiz_id',
        'homework_id',
        'exam_id',

      ];

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
