<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\LinkController;


Route::prefix('api/links')->group(function () {
    Route::post('/', [LinkController::class, 'store']);
    Route::get('/{code}/stats', [LinkController::class, 'stats']);
});
Route::get('/{code}', [LinkController::class, 'redirect']);