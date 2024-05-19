<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Deal;
use App\Models\DealStatus;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Deal>
 */
class DealFactory extends Factory
{
    protected $model = Deal::class;
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'number' => fake()->randomNumber(9, true),
            'status_id' => DealStatus::get()->random()->id,
        ];
    }
}
