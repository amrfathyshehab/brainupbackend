<?php
  
namespace App\Models;
  
use Illuminate\Database\Eloquent\Model;
 
class QuestionbankQuestion extends Model
{
    protected $table = 'questionbank_question';

    protected $fillable = [
        'question',
        'answer1',
        'answer2',
        'answer3',
        'answer4',
        'correct_answer',
        'difficulty',
        'category_id',
        'is_essay',
        'quiz_id',
        'homework_id',
        'degree',
        'exam_id',
        'vdo_id',
        'platform',
        'hint'
      ];

      public function quiz_id()
      {
          return $this->belongsTo('App\Models\Quiz','quiz_id');
  
       }
      public function homework()
      {
          return $this->belongsTo('App\Models\Homework','homework_id');
  
       }
}
