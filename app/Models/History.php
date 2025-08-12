<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class History extends Model
{
    protected $table = 'buying_history';

    protected $fillable = [
        'lecture_id',
        'price',
        'buy_at',
        'student_id',
        'code_id',

        'add_to_session_assistant',
        'quiz_done',
        'homework_done',
        'expire_at',
        'views',
      ];

      public function lecture()
      {
          return $this->belongsTo('App\Models\Lecture','lecture_id');

       }
       public function assistant()
       {
           return $this->belongsTo('App\Models\Admin','add_to_session_assistant');

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
