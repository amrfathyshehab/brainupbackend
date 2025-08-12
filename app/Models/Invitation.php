<?php
  
namespace App\Models;
  
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Invitation extends Model
{
    protected $table = 'invitations';

    protected $fillable = [
        'invite_to',
        'invite_from',
        'is_accept',
     ];

     public function student()
     {
         return $this->belongsTo('App\Models\Student','invite_from');
 
      }
     use SoftDeletes;

}
