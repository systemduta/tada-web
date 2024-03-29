<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Transaction extends Model
{
    use HasFactory;

    protected $fillable = ['merchant_id', 'user_id'];

    public function merchant()
    {
        return $this->hasOne(Merchant::class, "id", "merchant_id");
    }
}
