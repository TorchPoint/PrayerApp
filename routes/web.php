<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\Authcontroller as AuthController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Admin\CategoryController;
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

Route::get('/login',[AuthController::class,'login'])->name('login');
Route::post('/login-process',[AuthController::class,'login_process'])->name('login-process');
Route::get('/forgot-password',[AuthController::class,'forgot'])->name('forgot-password');
Route::post('/forgot-password-process',[AuthController::class,'forgotPassword'])->name('forgot-password-process');

Route::group(['middleware'=>'admins'],function(){
Route::get('/users',[UserController::class,'index'])->name('users');
Route::get('/create-user',[UserController::class,'create'])->name('create-user');
Route::post('/store-user',[UserController::class,'store'])->name('store-user');
Route::get('/edit-user/{id}',[UserController::class,'edit'])->name('edit-user');
Route::post('/update-user',[UserController::class,'update'])->name('update-user');
Route::post('/delete-user',[UserController::class,'destroy'])->name('delete-user');

Route::get('/feedbacks',[UserController::class,'feedbacks'])->name('feedbacks');
Route::get('/contents',[UserController::class,'contents'])->name('contents');
Route::get('/edit-content/{id}',[UserController::class,'edit_content'])->name('edit-content');

Route::post('/update-content',[UserController::class,'update_content'])->name('update-content');
Route::get('/help-center',[UserController::class,'help'])->name('help-center');
Route::get('/user-profile/{id}',[UserController::class,'profile'])->name('user-profile');
Route::put('/update-profile/{id}',[UserController::class,'update'])->name('update-profile');
Route::post('/user-status',[UserController::class,'status'])->name('user-status');

Route::get('/profile',[Authcontroller::class,'profile'])->name('profile');


Route::get('/create-notification',[UserController::class,'create_notice'])->name('create-notification');
Route::get('/notifications',[UserController::class,'notifications'])->name('notifications');
Route::post('/send-notification',[UserController::class,'send_notification'])->name('send-notification');
Route::post('/delete-notification',[UserController::class,'delete_notification'])->name('delete-notification');

Route::get('/categories',[CategoryController::class,'index'])->name('categories');
Route::get('/create-category',[CategoryController::class,'create'])->name('create-category');
Route::post('/store-category',[CategoryController::class,'store'])->name('store-category');
Route::get('/edit-category/{id}',[CategoryController::class,'edit'])->name('edit-category');
Route::put('/update-category/{id}',[CategoryController::class,'update'])->name('update-category');
Route::post('/delete-category',[CategoryController::class,'destroy'])->name('delete-category');
Route::post('/category-status',[CategoryController::class,'status'])->name('category-status');





Route::post('/updateadmin',[Authcontroller::class,'updateadmin'])->name('updateadmin');

Route::get('logout',[AuthController::class,'logout'])->name('logout');

});
