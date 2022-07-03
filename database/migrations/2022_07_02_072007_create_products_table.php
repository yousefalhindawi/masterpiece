<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('product_name')->unique();
            $table->string('product_description');
            $table->string('product_img');
            $table->bigInteger('product_price');
            $table->bigInteger('product_price_on_sale');
            $table->tinyInteger('sale_status')->default(0);
            $table->bigInteger('product_quantity');
            $table->tinyInteger('product_featured')->default(0);
            $table->string('product_tags');
            $table->bigInteger('category_id')->unsigned()->nullable(false);
            $table->foreign('category_id')->references('id')->on('categories')->onUpdate('cascade')->onDelete('cascade');
            $table->timestamps();


            // $table->index('category_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('products');
    }
}
