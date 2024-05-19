<?php

namespace Database\Seeders;

use App\Models\Client;
use App\Models\ClientStatus;
use App\Models\Deal;
use App\Models\DealStatus;
use App\Models\RealEstateObject;
use App\Models\RealEstateObjectStatus;
use App\Models\RealEstateObjectType;
use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {

        ClientStatus::factory()->count(5)->create();
        Client::factory()->count(20)->create();

        DealStatus::factory()->count(5)->create();
        $deals = Deal::factory()->count(15)->create();
        
        RealEstateObjectStatus::factory()->count(5)->create();
        RealEstateObjectType::factory()->count(15)->create();
        RealEstateObject::factory()->count(30)->create();


        foreach ($deals as $deal) {
            $clients = Client::find([rand(0, 20), rand(0, 20)]);
            $deal->clients()->attach($clients);

            $objects = RealEstateObject::find([rand(0, 30), rand(0, 30)]);
            $deal->objects()->attach($objects);
        }
    }
}
