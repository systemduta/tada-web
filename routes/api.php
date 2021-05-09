<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\MerchantController;
use App\Http\Controllers\TransactionController;
use App\Http\Controllers\RegionController;
use App\Http\Controllers\VoucherController;
use App\Http\Controllers\MerchantCategoryController;
use App\Http\Controllers\UserVoucherController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group(['prefix' => 'user'], function(){
    Route::post('/update', [UserController::class, 'update']);
    Route::post('/register', [UserController::class, 'register_user']);
    Route::post('/login', [UserController::class, 'login']);
    Route::post('/resend_email_code', [UserController::class, 'resend_email_code']);
    Route::get('/validate_email/{id}', [UserController::class, 'validate_email']);
    Route::get('/logout', [UserController::class, 'logout']);

    Route::group(['middleware' => 'user'], function(){
        Route::get('/', [UserController::class, 'index']);

        Route::apiResource('/transaction', TransactionController::class)->except('update');
        Route::apiResource('/voucher', UserVoucherController::class)->except('update');
        Route::apiResource('/voucher_merchant', VoucherController::class)->only('index', 'show');
    });
});

Route::get('/province', [RegionController::class, 'get_province']);
Route::get('/city/{id}', [RegionController::class, 'get_city']);

Route::apiResource('/merchant_category', MerchantCategoryController::class)->only('index', 'show');

Route::group(['prefix' => 'merchant'], function(){
    Route::post('/register', [UserController::class, 'register_merchant']);
    Route::apiResource('/', MerchantController::class)->only('index', 'show');
});

Route::group(['prefix' => 'admin', 'middleware' => 'merchant'], function(){
    Route::apiResource('/merchant', MerchantController::class)->except('store');
    Route::apiResource('/merchant_voucher', VoucherController::class);
});
