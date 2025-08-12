<?php
  
namespace App\Models;
  
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Attendancequiz extends Model
{
    use SoftDeletes;

    protected $table = 'attendancequiz';

    protected $fillable = [
         'lecture_id',
        'degree_quiz',
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
      
}
