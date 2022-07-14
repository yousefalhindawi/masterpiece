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
            $table->longText('product_description');
            $table->string('product_img');
            $table->double('product_price');
            $table->double('product_price_on_sale');
            $table->double('product_quantity');
            $table->string('product_tags');
            $table->bigInteger('category_id')->unsigned()->nullable(false);
            $table->bigInteger('sale_status_id')->unsigned()->nullable(false);
            $table->bigInteger('product_feature_id')->unsigned()->nullable(false);
            $table->foreign('category_id')->references('id')->on('categories')->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('sale_status_id')->references('id')->on('statuses')->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('product_feature_id')->references('id')->on('features')->onUpdate('cascade')->onDelete('cascade');
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
