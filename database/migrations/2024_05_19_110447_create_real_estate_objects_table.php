<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('real_estate_objects', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('type_id');
            $table->unsignedBigInteger('status_id');
            $table->integer('number_of_rooms')->unsigned();
            $table->string('address');
            $table->integer('area')->unsigned();
            $table->integer('floor')->unsigned();
            $table->integer('apartament_number')->unsigned();
            $table->integer('price')->unsigned();
            $table->timestamps();

            $table->foreign('type_id')
                ->references('id')->on('real_estate_object_types');
            $table->foreign('status_id')
                ->references('id')->on('real_estate_object_statuses');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('real_estate_objects');
    }
};
