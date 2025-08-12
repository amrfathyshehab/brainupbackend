<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Cities extends Model
{
    protected $table = 'cities';

    protected $fillable = [
        'city_name_en',
        'city_name_ar',
        'governorate_id'
    ];

    public $timestamps = false;

    public function students()
    {
        return $this->hasMany(Student::class, 'area', 'id');
    }

    public function governorate()
    {
        return $this->belongsTo(Governorates::class, 'governorate_id');
    }
}
