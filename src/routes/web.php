<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/info', function () {
    phpinfo();
});

Route::get('/test', function () {


    dd(\App\Models\User::find(3)->article);
        return '';
});
