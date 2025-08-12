<?php
  
namespace App\Models;
  
use Illuminate\Database\Eloquent\Model;
 
class Attachment extends Model
{
    protected $table = 'attachments';

    protected $fillable = [
        'is_public',
        'address',
        'lecture_id',
        'teacher_id'
     
      ];

      public function lecture()
      {
          return $this->belongsTo('App\Models\Lecture','lecture_id');
  
       }
       public function teacher()
       {
           return $this->belongsTo('App\Models\Teacher','teacher_id');
   
        }
}
