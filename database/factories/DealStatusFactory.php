<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\DealStatus;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\DealStatus>
 */
class DealStatusFactory extends Factory
{
    protected $model = DealStatus::class;
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
