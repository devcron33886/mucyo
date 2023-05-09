<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tinnumbers', function (Blueprint $table) {
            $table->id();
            $table->string('name',40);
            $table->string('company_name', 45);
            $table->string('tin_number',40);
            $table->string('password',45);
            $table->string('Phone_number',40);
            $table->string('email',40);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tinnumbers');
    }
};
