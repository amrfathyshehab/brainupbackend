<?php
  
namespace App\Models;
  
use Illuminate\Database\Eloquent\Model;
 
class QuestionbankCategory extends Model
{
    protected $table = 'questionbank_categories';

    protected $fillable = [
        'name',
        'stage',
         'section'

      ];
}
