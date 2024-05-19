<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\RealEstateObjectType;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\RealEstateObjectType>
 */
class RealEstateObjectTypeFactory extends Factory
{
    protected $model = RealEstateObjectType::class;
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'type' => fake()->word(),
        ];
    }
}
