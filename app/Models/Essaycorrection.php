<?php
  
namespace App\Models;
  
use Illuminate\Database\Eloquent\Model;
 
class Essaycorrection extends Model
{
    protected $table = 'essay_correction';

    protected $fillable = [
        'student_answer_id',
        'degree',
        'comment',
        'draft'


      ];

      public function student()
      {
          return $this->belongsTo('App\Models\Studentanswer','student_answer_id');
  
       }
       
         
}
