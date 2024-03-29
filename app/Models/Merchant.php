<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Merchant extends Model
{
    use HasFactory;
    protected $table = "merchants";
    protected $fillable = [
        "name", "short_description", "long_description", "category_id",
        "background", "user_id"
    ];

    public function category()
    {
        return $this->hasOne(CategoryMerchant::class, "id", "category_id");
    }

    public function user()
    {
        return $this->hasOne(User::class, "id", "user_id");
    }
}
