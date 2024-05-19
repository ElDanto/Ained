<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Client extends Model
{
    use HasFactory;
    protected $fillable = ["first_name","last_name","patronymic","phone_number","status_id"];

    public function status()
    {
        return $this->belongsTo(ClientStatus::class);
    }

    public function deals()
    {
        return $this->belongsToMany(Deal::class);
    }
}
