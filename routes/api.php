<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\MerchantController;
use App\Http\Controllers\MerchantCategoryController;

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
    Route::get('/', [UserController::class, 'index']);
    Route::post('/update', [UserController::class, 'update']);
    Route::post('/register', [UserController::class, 'register']);
    Route::post('/login', [UserController::class, 'login']);
    Route::post('/resend_email_code', [UserController::class, 'resend_email_code']);
    Route::get('/validate_email/{id}', [UserController::class, 'validate_email']);
    Route::get('/logout', [UserController::class, 'logout']);
});



Route::apiResource('/merchant', MerchantController::class);
Route::apiResource('/merchant_category', MerchantCategoryController::class);