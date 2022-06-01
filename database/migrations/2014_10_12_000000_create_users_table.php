<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
             $table->string('first_name')->nullable();
            $table->string('last_name')->nullable();
            $table->string('contact_no')->nullable();
            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->string('gender',15)->nullable();
            $table->date('dob')->nullable();
            $table->string('otp')->nullable();
            $table->string('profile_image')->nullable();
            $table->tinyInteger('complete_profile')->default(0);
            $table->tinyInteger('account_verified')->default(0);
            $table->enum('is_social',['yes','no'])->nullable();
            $table->string('user_social_token')->nullable();
            $table->string('user_social_type')->nullable();
            $table->string("user_device_type")->nullable();
            $table->string("user_device_token")->nullable();
            $tabel->string('time_zone')->nullable();
            $table->rememberToken();
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
        Schema::dropIfExists('users');
    }
}
