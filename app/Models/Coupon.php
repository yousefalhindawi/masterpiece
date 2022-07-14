<?php

namespace App\Models;

use App\Models\Type;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Coupon extends Model
{
    use HasFactory;
    public function type(){
        return $this->belongsTo(Type::class);
    }
}
