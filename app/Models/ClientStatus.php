<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Client;

class ClientStatus extends Model
{
    use HasFactory;
    protected $fillable = ['status'];

    public function clients()
    {
        return $this->hasMany(Client::class);
    }
}
