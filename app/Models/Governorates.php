<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Governorates extends Model
{
    protected $table = 'governorates';

    protected $fillable = [
        'governorate_name_ar',
        'governorate_name_en'
    ];

    public $timestamps = false;

    public function cities()
    {
        return $this->hasMany(Cities::class, 'governorate_id');
    }
}
