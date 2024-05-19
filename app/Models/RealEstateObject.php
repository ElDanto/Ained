<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RealEstateObject extends Model
{
    use HasFactory;
    protected $fillable = ['type_id', 'status_id','number_of_rooms','address','area','floor','apartament_number','price'];

    public function type()
    {
        return $this->belongsTo(RealEstateObjectType::class);
    }

    public function status()
    {
        return $this->belongsTo(RealEstateObjectStatus::class);
    }

    public function deals() 
    {
        return $this->belongsToMany(Deal::class);
    }
}
