<?php
  
namespace App\Models;
  
use Illuminate\Database\Eloquent\Model;
 
class Sessionlecture extends Model
{
 
    protected $table = 'sessions_lectures';

    protected $fillable = [
        'lecture_id',
        'session_id',
     ];

     public function lecture()
      {
          return $this->belongsTo('App\Models\Lecture','lecture_id');
  
       }
}
