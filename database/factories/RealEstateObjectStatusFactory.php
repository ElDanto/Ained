<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\RealEstateObjectStatus;
/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\RealEstateObjectStatus>
 */
class RealEstateObjectStatusFactory extends Factory
{
    protected $model = RealEstateObjectStatus::class;
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'status' => fake()->word(),
        ];
    }
}
