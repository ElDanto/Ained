<?php

use Illuminate\Http\Request;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ClientController;
use App\Http\Controllers\DealController;
use App\Http\Controllers\RealEstateObjectController;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

Route::get( '/objects', [RealEstateObjectController::class,'index'])->middleware('auth:sanctum');
Route::get( '/objects/sortby/{params}', [RealEstateObjectController::class,'sort'])->middleware('auth:sanctum');
Route::get('/objects/{id}', [RealEstateObjectController::class,'show'])->middleware('auth:sanctum');

Route::get('/clients', [ClientController::class, 'index'])->middleware('auth:sanctum');
Route::get('/clients/{id}', [ClientController::class, 'show'])->middleware('auth:sanctum');

Route::get('/deals', [DealController::class,'index'])->middleware('auth:sanctum');
Route::get('/deals/{id}', [DealController::class,'show'])->middleware('auth:sanctum');

