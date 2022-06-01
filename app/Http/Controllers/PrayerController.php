<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Validator;
use App\Models\Prayer;
use App\Models\Notification;
use App\Models\User;

use Auth;
class PrayerController extends Controller
{
    //


    public function create_prayer(Request $request){
        $controls=$request->all();

        $rules=array(
        "category"=>"nullable",
        "name"=>"nullable",
        "title"=>"required",
        "description"=>"nullable",
        "type"=>"required|in:prayer,praise",
        );
        $customMessages = [
        'required' => 'The :attribute field is required.',
        'exists' => 'The :attribute not exists',
        'in' => 'The :attribute field is must be prayer or praise',

        ];
        $validator=Validator::make($controls,$rules,$customMessages);
        if ($validator->fails()){
        return response()->json(['status'=>0,'message'=>$validator->errors()->all()[0]]);
        }
        $user=Auth::user();
        $prayer=new Prayer;
        $prayer->name=$request->name;
        $prayer->category_id=$request->input('category');
        $prayer->user_id=$user->id;
        $prayer->title=$request->title;
        $prayer->description=$request->description;
        $prayer->type=$request->type;
        $prayer->save();
        $prayer=Prayer::where('id','=',$prayer->id)->with('category')->first();
        if ($prayer->save()) {
        return response()->json(['status'=>1,'data'=>$prayer]);
        }else{
        return response()->json(['status'=>0,'message'=>"Something Went Wrong...!"]);
        }
     }

     public function update_prayer(Request $request){
        $controls=$request->all();
        $rules=array(
        "prayer"=>"required|exists:prayers,id",
        "category"=>"nullable",
        "name"=>"required",
        "title"=>"required",
        "description"=>"required",
        "type"=>"required|in:prayer,praise",
        );
        $customMessages = [
        'required' => 'The :attribute field is required.',
        'exists' => 'The :attribute not exists',
        'in' => 'The :attribute field is must be prayer or praise',

        ];
        $validator=Validator::make($controls,$rules,$customMessages);
        if ($validator->fails()){
        return response()->json(['status'=>0,'message'=>$validator->errors()->all()[0]]);
        }
        $prayer= Prayer::find($request->prayer);
        $prayer->name=$request->name;
        $prayer->category_id=$request->category;
        $prayer->title=$request->title;
        $prayer->description=$request->description;
        $prayer->type=$request->type;
        $prayer->save();
        if ($prayer->save()) {
        return response()->json(['status'=>1,'message'=>"Prayer Updated Successfully...!"]);
        }else{
        return response()->json(['status'=>0,'message'=>"Something Went Wrong...!"]);
        }
     }


     public function edit_prayer(Request $request){
        $controls=$request->all();
        $rules=array(
        "prayer"=>"required|exists:prayers,id",
        );
        $customMessages = [
        'required' => 'The :attribute field is required.',
        'exists' => 'The :attribute not exists',
        ];
        $validator=Validator::make($controls,$rules,$customMessages);
        if ($validator->fails()){
        return response()->json(['status'=>0,'message'=>$validator->errors()->all()[0]]);
        }
        $prayer=Prayer::with('category')->find($request->prayer);
        return response()->json(['status'=>1,'data'=>$prayer]);
     }


     public function delete_prayer(Request $request){
        $controls=$request->all();
        $rules=array(
        "prayer"=>"required|exists:prayers,id",
        );
        $customMessages = [
        'required' => 'The :attribute field is required.',
        'exists' => 'The :attribute not exists',
        ];
        $validator=Validator::make($controls,$rules,$customMessages);
        if ($validator->fails()){
        return response()->json(['status'=>0,'message'=>$validator->errors()->all()[0]]);
        }
        $prayer=Prayer::find($request->prayer)->delete();
        return response()->json(['status'=>1,'message'=>"Prayer Deleted"]);
     }


     public function prayers(Request $request){
        $controls=$request->all();
        $rules=array(
        "type"=>"required|in:prayer,praise",
        );
        $customMessages = [
        'required' => 'The :attribute field is required.',
        'in' => 'The :attribute field is must be prayer or praise',
        ];
        $validator=Validator::make($controls,$rules,$customMessages);
        if ($validator->fails()){
        return response()->json(['status'=>0,'message'=>$validator->errors()->all()[0]]);
        }
        $user=Auth::user();
        $prayers=Prayer::where([['user_id',"=",$user->id],['type','=',$request->type]])->with('category')->get();
        if ($prayers->count()) {
        return response()->json(['status'=>1,'data'=>$prayers]);
        }
        return response()->json(['status'=>0,'message'=>"Record Not Found"]);
     }

     public function finish_prayer(Request $request){
        $controls=$request->all();
        $rules=array(
        "prayer"=>"required|exists:prayers,id",
        'prayer_duration'=>"nullable"
        );
        $customMessages = [
        'required' => 'The :attribute field is required.',
        'exists' => 'The :attribute not exists',
        ];
        $validator=Validator::make($controls,$rules,$customMessages);
        if ($validator->fails()){
        return response()->json(['status'=>0,'message'=>$validator->errors()->all()[0]]);
        }
        $prayer=Prayer::find($request->prayer);
        if($prayer->type=='prayer'){
        $prayer->type='praise';
        $prayer->prayer_duration=$request->prayer_duration;
        }else{
        $prayer->type='prayer';
        }
        $prayer->save();
        return response()->json(['status'=>1,'data'=>$prayer]);
     }


     public function search(Request $request){
        $controls=$request->all();
        $rules=array(
        "search"=>"required",
        );
        $customMessages = [
        'required' => 'The :attribute field is required.',
        'exists' => 'The :attribute not exists',
        ];
        $validator=Validator::make($controls,$rules,$customMessages);
        if ($validator->fails()){
        return response()->json(['status'=>0,'message'=>$validator->errors()->all()[0]]);
        }
        $user=Auth::user();
        $prayers=Prayer::where(function ($query) use ($request){
            $query->where("name","LIKE",'%'.$request->search.'%')
            ->orWhere("title","LIKE",'%'.$request->search.'%');
        })->where('user_id','=',$user->id) ->get();
        if ($prayers->count()) {
        return response()->json(['status'=>1,'data'=>$prayers]);
        }
        return response()->json(['status'=>0,'message'=>"Record Not Found...!"]);
     }


     public function pre_prayer_notice(Request $request){
         $user=Auth::user();
         $data=json_encode(["message"=>"Your Prayer Time About To Complete"]);
         $notification=new Notification;
         $notification->data=$data;
         $notification->reciever_id=$user->id;
         $notification->type='prayer';
         $notification->save();
         $firebaseToken = User::where('id','=',$user->id)->first();
         $SERVER_API_KEY = 'AAAAsuCi65o:APA91bHxgmauJiC6VOiiLSTTbljrx6QUYT3wCFGwqnrw3Bn5KCS_gmYAHj15fjjNPXZq2yH-cQWxFLG1Jt86ALCW58NyeC2Hq8gl71r8VwyH4SvNikAlBhl81xqDtKlDWnqE6cv1yoh6';
         $data = [
             "to" => $firebaseToken->user_device_token,
             "notification" => [
                 "title" => "Prayer",
                 "body" =>"Your Prayer Time About To Complete" ,
             ],
             "data"=>[
                 "type"=>"prayer"]
         ];
         $dataString = json_encode($data);

         $headers = [
             'Authorization: key=' . $SERVER_API_KEY,
             'Content-Type: application/json',
         ];
         $ch = curl_init();
         curl_setopt($ch, CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send');
         curl_setopt($ch, CURLOPT_POST, true);
         curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
         curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);
         curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
         curl_setopt($ch, CURLOPT_POSTFIELDS, $dataString);
         $response = curl_exec($ch);
         return response()->json(['status'=>1,'message'=>$response]);

     }


}
