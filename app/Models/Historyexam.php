<?php
  
namespace App\Models;
  
use Illuminate\Database\Eloquent\Model;
 
class Historyexam extends Model
{
    protected $table = 'trialexam_history';

    protected $fillable = [
        'exam_id',
        'student_id',
        'code_id',
   
      ];

      public function exam()
      {
          return $this->belongsTo('App\Models\Trialexam','exam_id');
  
       }
      
        public function student()
        {
            return $this->belongsTo('App\Models\Student','student_id');
    
         }

         public function code()
         {
             return $this->belongsTo('App\Models\Code','code_id');
     
          }
}
