<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RealEstateObjectType extends Model
{
    use HasFactory;

    protected $fillable = ['type'];
    public function deals()
    {
        return $this->hasMany(RealEstateObject::class);
    }
}
