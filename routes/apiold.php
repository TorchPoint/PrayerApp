<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ContentController;
use App\Http\Controllers\FeedbackController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\PrayerController;
use App\Http\Controllers\ReminderController;
use App\Http\Controllers\GroupController;
use App\Http\Controllers\PartnerController;
use App\Http\Controllers\AgoraController;
use App\Http\Controllers\SubscriberController;









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

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

//Registration   

Route::group(['middleware' => ['cors', 'json.response']], function () {  
Route::post('signup',[AuthController::class,'signUp'])->name('signup');
Route::post("social-login",[AuthController::class,'socialAuth'])->name('social-login');
Route::post('resend-otp',[AuthController::class,'resendOtp'])->name('resend-otp');
Route::post('verification',[AuthController::class,'verification'])->name('verification');
Route::post('login',[AuthController::class,'login'])->name('login');
Route::post("forgot-password",[AuthController::class,'forgotPassword'])->name('forgot-password');
Route::post("forgot-password-otp-verify",[AuthController::class,'forgotPasswordOtpVerify'])->name('forgot-password-otp-verify');
Route::post("reset-forgot-password",[AuthController::class,'resetForgotPassword'])->name('reset-forgot-password');
Route::get("noti",[SubscriberController::class,'noti'])->name('noti');



//Category
Route::post('add-category',[CategoryController::class,'create'])->name('add-category');
Route::get('categories',[CategoryController::class,'index'])->name('categories');
Route::post('update-category',[CategoryController::class,'update'])->name('update-category');
Route::delete('delete-category/{category}',[CategoryController::class,'destroy'])->name('delete-category');

Route::middleware('auth:api')->group(function () {
//Registration & USER
Route::post("update-profile",[AuthController::class,'updateProfile'])->name('update-profile');
Route::post("change-password",[AuthController::class,'changePassword'])->name('change-password');
Route::post("logout",[AuthController::class,'logout'])->name('logout');
Route::post("add-feedback",[FeedbackController::class,'create'])->name('add-feedback');
Route::resource("contents",ContentController::class);
Route::get("content",[ContentController::class,'content'])->name('content');
//Prayer 

Route::post('add-prayer',[PrayerController::class,'create_prayer'])->name('add-prayer');
Route::post('update-prayer',[PrayerController::class,'update_prayer'])->name('update-prayer');
Route::post('delete-prayer',[PrayerController::class,'delete_prayer'])->name('delete-prayer');
Route::get('edit-prayer',[PrayerController::class,'edit_prayer'])->name('edit-prayer');
Route::post('finish-prayer',[PrayerController::class,'finish_prayer'])->name('finish-prayer');
Route::get('prayers',[PrayerController::class,'prayers'])->name('prayers');
Route::get('prayer-search',[PrayerController::class,'search'])->name('prayer-search');


Route::post('add-reminder',[ReminderController::class,'create_reminder'])->name('add-reminder');
Route::post('update-reminder',[ReminderController::class,'update_reminder'])->name('update-reminder');
Route::get('edit-reminder',[ReminderController::class,'edit_reminder'])->name('edit-reminder');
Route::post('delete-reminder',[ReminderController::class,'delete_reminder'])->name('delete-reminder');
Route::get('reminders',[ReminderController::class,'reminders'])->name('reminders');


Route::post('add-partner',[PartnerController::class,'add_partner'])->name('add-partner');
Route::get('partners',[PartnerController::class,'partners'])->name('partners');
Route::get('search-partners',[PartnerController::class,'search_partners'])->name('search-partners');

Route::post('add-group',[GroupController::class,'create_group'])->name('add-group');
Route::post('update-group',[GroupController::class,'update_group'])->name('update-group');
Route::get('edit-group',[GroupController::class,'edit_group'])->name('edit-group');
Route::get('joined-group',[GroupController::class,'joined_group'])->name('joined-group');
Route::post('delete-group',[GroupController::class,'delete_group'])->name('delete-group');
Route::get('notifications',[AuthController::class,'notifications'])->name('notifications');

Route::post('payment',[SubscriberController::class,'create'])->name('payment');



});
});












