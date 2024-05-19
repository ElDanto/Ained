<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Deal extends Model
{
    use HasFactory;

    public function status()
    {
        return $this->belongsTo(DealStatus::class);
    }

    public function clients()
    {
        return $this->belongsToMany(Client::class);
    }

    public function objects()
    {
        return $this->belongsToMany(RealEstateObject::class);
    }
}
