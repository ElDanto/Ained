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
        Schema::create('deal_real_estate_object', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('real_estate_object_id');
            $table->unsignedBigInteger('deal_id');

            $table->foreign('real_estate_object_id')
                ->references('id')->on('real_estate_objects');
            $table->foreign('deal_id')
                ->references('id')->on('deals');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('object_deal');
    }
};
