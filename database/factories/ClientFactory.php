<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Client;
use App\Models\ClientStatus;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Client>
 */
class ClientFactory extends Factory
{
    protected $model = Client::class;
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
           'first_name' => fake()->firstName,
           'last_name'  => fake()->lastName,
           'patronymic' => fake()->firstNameMale(),
           'phone_number' => fake()->randomNumber(9, true),
           'status_id' => ClientStatus::get()->random()->id,
        ];
    }
}
