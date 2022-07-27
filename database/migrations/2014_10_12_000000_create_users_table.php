<?php

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

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
            // $table->bigInteger('role_id')->default(2);
            $table->string('name');
            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->string('phone')->unique();
            $table->string('address');
            // $table->tinyInteger('role')->default(0);
            $table->string('user_img')->default('avatar.png');
            $table->rememberToken();
            $table->timestamps();
        });

        DB::table('users')->insert(
            array(
                'role_id'=> 1,
                'name'=>'yousef alhindawi',
                'email'=>'yousefalhindawe@gmail.com',
                'avatar'=>'users/default.png',
                'password'=>'$2y$10$gEVARivMMlIe4JdPWd.a1OudTk35nxRMbIWo8LpxSISZVQ86J0N5C',//Yousef@123
                'address'=>'Irbid',
                'user_img'=>'avatar.png',
                
        ));
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
