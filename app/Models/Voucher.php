<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Voucher extends Model
{
    use HasFactory;

    public $fillable = [
      'merchant_id', 'min_transaction', 'name', 'background',
      'value', 'expiration', 'description'
    ];

    public function merchant()
    {
        return $this->hasOne(Merchant::class, "id", "merchant_id");
    }
}
