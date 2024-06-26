<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RealEstateObjectStatus extends Model
{
    use HasFactory;
    protected $fillable = ['status'];

    public function deals()
    {
        return $this->hasMany(RealEstateObject::class);
    }
}
