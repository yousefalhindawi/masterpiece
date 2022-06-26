<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('index');
});
Route::get('/shop', function () {
    return view('shop');
});
Route::get('/product-single', function () {
    return view('product-single');
});
Route::get('/cart', function () {
    return view('cart');
});
Route::get('/checkout', function () {
    return view('checkout');
});
Route::get('/about', function () {
    return view('about');
});
Route::get('/contact', function () {
    return view('contact');
});
Route::get('/profile', function () {
    return view('profile');
});
Route::get('/login', function () {
    return view('login');
});
Route::get('/register', function () {
    return view('register');
});


//dashboard routes
Route::get('admin', function () {
    return view('admin.index');
})->name('admin');

Route::get('admin/users', function () {
    return view('admin.users');
})->name('admin/users');

//start admins routes
Route::get('admin/admins', function () {
    return view('admin.admins.index');
})->name('admin/admins');

Route::get('/admin/edit', function () {
    return view('admin.admins.edit');
});
Route::get('/admin/create', function () {
    return view('admin.admins.create');
});

Route::get('admin/addquiz', function () {
    return view('admin.add_quiz');
})->name('admin/add_quiz');

Route::get('admin/addqustions', function () {
    return view('admin.add_qustions');
})->name('admin/add_qustions');

Route::get('admin/qustions', function () {
    return view('admin.qustions');
})->name('admin/add_interview_qustions');
