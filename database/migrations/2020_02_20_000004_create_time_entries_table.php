<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTimeEntriesTable extends Migration
{
    public function up()
    {
        Schema::create('time_entries', function (Blueprint $table) {
            $table->increments('id');
            $table->datetime('time_start');
            $table->string('selfie_datang')->nullable();
            $table->datetime('time_end')->nullable();
            $table->string('selfie_pulang')->nullable();
            $table->timestamps();
            $table->softDeletes();
        });
    }
}
