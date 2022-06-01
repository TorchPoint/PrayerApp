<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Subscriber;
use App\Models\User;
use App\Http\Requests\SubscribeRequest;
use Auth;

class SubscriberController extends Controller
{
    //


    public function create(SubscribeRequest $request){
    $user=Auth::user();
    $check_package=Subscriber::where('user_id',$user->id)->first();
    if($request->type=='monthly_sub'){
    $end_time=strtotime("+1 month");
    $start_time=strtotime(date('Y-m-d H:i:s'));
    }else{
    $end_time=strtotime("+1 year");
    $start_time=strtotime(date('Y-m-d H:i:s'));
    }
    $request->request->add(['end_time'=>$end_time]);
    $request->request->add(['start_time'=>$start_time]);
    $request->request->add(['sub_date'=>date('Y-m-d')]);
    $request->request->add(['user_id'=>$user->id]);
    if($check_package){
    $subscribe=Subscriber::where('user_id',$user->id)->update($request->all());
    }else{
    $subscribe=Subscriber::create($request->all());
    }
   
    return response()->json(['status'=>1,'data'=>User::with('user_package')->find($user->id)]);
        


    }
}
