<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\RealEstateObject;
use App\Models\RealEstateObjectStatus;
use App\Models\RealEstateObjectType;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\RealEstateObject>
 */
class RealEstateObjectFactory extends Factory
{
    protected $model = RealEstateObject::class;
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'type_id'  => RealEstateObjectType::get()->random()->id,
            'status_id' => RealEstateObjectStatus::get()->random()->id,
            'number_of_rooms' => fake()->numberBetween(1, 4),
            'address' => fake()->address,
            'area' => fake()->numberBetween(20, 200),
            'floor' => fake()->numberBetween(1, 20),
            'apartament_number' => fake()->numberBetween(1, 1000),
            'price' => fake()->randomNumber(7, true),
        ];
    }
}
