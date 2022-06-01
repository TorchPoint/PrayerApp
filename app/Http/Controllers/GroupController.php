<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Group;
use App\Models\GroupUser;
use App\Models\User;
use Validator;
use Auth;
use App\Models\Notification;

class GroupController extends Controller
{
    //
    public function create_group(Request $request){
        $controls=$request->all();
        $rules=array(
        "name"=>"required",
        "members.*"=>"nullable",
        );
        $customMessages = [
        'required' => 'The :attribute field is required.',
        ];
        $validator=Validator::make($controls,$rules,$customMessages);
        if ($validator->fails()){
        return response()->json(['status'=>0,'message'=>$validator->errors()->all()[0]]);
        }
        $members= explode(",",$request->members);
        $user=Auth::user();
        $group=new Group;
        $group->user_id=$user->id;
        $group->name=$request->name;
        $group->save();
        if($group->save()) {
        $member=new GroupUser;
        $member->group_id=$group->id;
        $member->user_id=$user->id;
        $member->save();
         if (isset($request->members)) {
               foreach ($members as $member) {
                  $members=new GroupUser;
                  $members->group_id=$group->id;
                  $members->user_id=$member;
                  $members->save();
                  $this->notify($type='group',$group->id,$message="You Are Added in $group->name Group By $user->first_name $user->last_name",$member);
                  
              }
        }
        return response()->json(['status'=>1,'data'=>$group]);
        }else{
        return response()->json(['status'=>0,'message'=>"Something Went Wrong...!"]); 
        }
    }

    public function edit_group(Request $request){
        $controls=$request->all();
        $rules=array(
        "group"=>"required|exists:groups,id",
        );
        $customMessages = [
        'required' => 'The :attribute field is required.',
        'exists' => 'The :attribute not exists',
        ];
        $validator=Validator::make($controls,$rules,$customMessages);
        if ($validator->fails()){
        return response()->json(['status'=>0,'message'=>$validator->errors()->all()[0]]);
        }
        $group=Group::find($request->group);
        return response()->json(['status'=>1,'data'=>$group]);
     }


     public function update_group(Request $request){
        $controls=$request->all();
        $rules=array(
        "group"=>"required|exists:groups,id",
        "name"=>"required",
        "members.*"=>"nullable",
        );
        $customMessages = [
        'required' => 'The :attribute field is required.',
        ];
        $validator=Validator::make($controls,$rules,$customMessages);
        if ($validator->fails()){
        return response()->json(['status'=>0,'message'=>$validator->errors()->all()[0]]);
        }
        $members= explode(",",$request->members);
        $user=Auth::user();
        $group= Group::find($request->group);
        $group->user_id=$user->id;
        $group->name=$request->name;
        $group->save();
        if($group->save()) {
         if (isset($request->members)) {
               foreach ($members as $member) {
                 $check=GroupUser::where([['group_id','=',$group->id],['user_id','=',$member]])->first();
                    if (!$check) {
                      $members=new GroupUser;
                      $members->group_id=$group->id;
                      $members->user_id=$member;
                      $members->save();
                         $this->notify($type='group',$group->id,$message="You Are Added in $group->name Group By $user->first_name $user->last_name",$member);
             }
         }
      }
    return response()->json(['status'=>1,'data'=>$group]);
    }else{
        return response()->json(['status'=>0,'message'=>"Something Went Wrong...!"]); 
        }
     }


     public function delete_group(Request $request){
        $controls=$request->all();
        $rules=array(
        "group"=>"required|exists:groups,id",
        );
        $customMessages = [
        'required' => 'The :attribute field is required.',
        'exists' => 'The :attribute not exists',
        ];
        $validator=Validator::make($controls,$rules,$customMessages);
        if ($validator->fails()){
        return response()->json(['status'=>0,'message'=>$validator->errors()->all()[0]]);
        }
        $group=Group::find($request->group)->delete();
        return response()->json(['status'=>1,'message'=>"Group Deleted"]);
     }
     
     public function joined_group(Request $request){
        $user=Auth::user();
        $groups=Group::whereHas('member',function($query) use ($user){
            $query->where('user_id','=',$user->id);
        })->with('member','groupadmin')->get();
        if ($groups->count()) {
        return response()->json(['status'=>1,'data'=>$groups]);
        }
        return response()->json(['status'=>0,'message'=>"Group Not Found...!"]);
     }
     
     
      public function notify($type,$post,$message,$user_id){
        $user=Auth::user();
        $data=json_encode(['name'=>$user->first_name." ".$user->last_name,'image'=>$user->profile_image,"message"=>$message]);
        $notification=new Notification;
        $notification->data=$data;
        $notification->reciever_id=$user_id;
        $notification->sender_id=$user->id;
        $notification->group_id=$post;
        $notification->type=$type;
        $notification->save();
        $firebaseToken = User::where('id','=',$user_id)->first();
        $SERVER_API_KEY = 'AAAAsuCi65o:APA91bHxgmauJiC6VOiiLSTTbljrx6QUYT3wCFGwqnrw3Bn5KCS_gmYAHj15fjjNPXZq2yH-cQWxFLG1Jt86ALCW58NyeC2Hq8gl71r8VwyH4SvNikAlBhl81xqDtKlDWnqE6cv1yoh6';
        $data = [
            "to" => $firebaseToken->user_device_token,
            "notification" => [
                "title" => "Group",
                "body" =>$message ,  
            ],
            "data"=>[
                "type"=>"group"]
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
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER,true);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $dataString);
        $response = curl_exec($ch);
    }
}
