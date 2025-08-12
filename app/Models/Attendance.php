<?php
  
namespace App\Models;
  
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Attendance extends Model
{
    use SoftDeletes;

    protected $table = 'attendance';

    protected $fillable = [
        'student_id',
        'lecture_id',
        'student_quiz',
         'student_homework',
        'attend_at',
        'attend_by',
        'group_id',

      ];
      public function group()
      {
          return $this->belongsTo('App\Models\Group','group_id');
  
       }
      public function lecture()
      {
          return $this->belongsTo('App\Models\Lecture','lecture_id');
  
       }
       public function student()
       {
           return $this->belongsTo('App\Models\Student','student_id');
   
        }

        public function teacher()
        {
            return $this->belongsTo('App\Models\Admin','attend_by');
    
         }
}
