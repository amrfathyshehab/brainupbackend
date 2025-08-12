<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Message extends Model
{
  protected $table = 'messages';

    protected $fillable = [
        'message',
        'student_id',
        'sent_by',
        'send_to',
        'sent_at',
        ]  ;

        public function assistant()
        {
            return $this->belongsTo('App\Models\Admin','sent_by');
    
         }

         public function student()
         {
             return $this->belongsTo('App\Models\Student','student_id');
     
          }

      }
