<?php

namespace App\Models;

use App\Models\User;
use App\Models\Category;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Product extends Model
{
    use HasFactory;

    public function category(){
        return $this->belongsTo(Category::class);
    }
    public function status(){
        return $this->belongsTo(Status::class);
    }
    public function feature(){
        return $this->belongsTo(Feature::class);
    }
    public function users(){
        return $this->belongsToMany(User::class, 'orders','product_id','user_id');
    }
}
