<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Notification;
use App\Models\Prayer;
use App\Models\Chat;
use App\Models\Partner;
use App\Models\Reminder;
use App\Models\Group;
use App\Models\GroupUser;
use App\Models\Content;
use App\Models\Feedback;
use Validator;
use Auth;
class UserController extends Controller
{
       public function index(){
        $users=User::all();
        return view('admin.user.index',['users'=>$users]);
    }

     public function contents(){
        $contents=Content::where('type','<>','help-center')->get();
        return view('admin.user.content',['contents'=>$contents]);
    }
 public function edit_content($id){
        $content=Content::find($id);
        return view('admin.user.update-content',['content'=>$content]);
    }
    public function update_content(Request $request){
        $controls=$request->all();
         $rules=array(
            "description"=>"required",
            "id"=>"required",
           

        );
        $validator=Validator::make($controls,$rules);
        if ($validator->fails()) {
           
        return redirect()->back()->withErrors($validator)->withInput();
        }

        $content=Content::find($request->id);
        $content->body=$request->description;
        $content->save();
        return redirect()->back()->withSuccess('Content Added Succefully...!');

    }


   

    public function profile($id){
        $user=User::find($id);
        return view('admin.user.profile',['user'=>$user]);
    }

      public function update(Request $request,$id){ 
         $controls=$request->all();
         $rules=array(
            "email"=>"nullable|email|unique:users,email,".$id,
            "first_name"=>"required",
            "last_name"=>"required",
            "image"  => 'nullable',
            "contact_no"=>"nullable|unique:users,contact_no,".$id,
           

        );
        $validator=Validator::make($controls,$rules);
        if ($validator->fails()) {
        return redirect()->back()->withErrors($validator)->withInput();
        }
    
        $user = User::find($id);
        $user->email =$request->email;
        $user->first_name=$request->first_name;
        $user->last_name=$request->last_name;
        if(isset($request->password) && isset($request->change_password)){
        $user->password= bcrypt($request->password);
        }
        if($request->hasFile('image')){
        $imageName = time().'.'.$request->image->getClientOriginalExtension();
        $request->image->move(public_path('/uploadedimages/'), $imageName);
        $user->profile_image=asset('public/uploadedimages')."/".$imageName;
       
        }
        $user->contact_no=$request->contact_no;
        if($user->save()){
          return redirect()->back()->withSuccess('Profile Updated Succefully...!');
        }else{
        return redirect()->back()->withErrors(['error'=>'Something Went Wrong...!']);
        }
    }

    public function create(){
        return view('admin.user.create');
    }


    public function store(Request $request){
         $controls=$request->all();
         $rules=array(
            "email"=>"nullable|email|unique:users,email",
            "first_name"=>"required",
            "last_name"=>"required",
            "image"  => 'required',
            "contact_no"=>"required|unique:users,contact_no",
           

        );
        $validator=Validator::make($controls,$rules);
        if ($validator->fails()) {
        return redirect()->back()->withErrors($validator)->withInput();
        }
    
        $user = new User;
        $user->email =$request->email;
        $user->first_name=$request->first_name;
        $user->last_name=$request->last_name;
        $user->password= bcrypt($request->password);
        if($request->hasFile('image')){
        $imageName = time().'.'.$request->image->getClientOriginalExtension();
        $request->image->move(public_path('/uploadedimages/'), $imageName);
        $user->profile_image=asset('public/uploadedimages')."/".$imageName;
        
        }
        $user->contact_no=$request->contact_no;
        if($user->save()){
          return redirect()->back()->withSuccess('User Added Succefully...!');
        }else{
        return redirect()->back()->withErrors(['error'=>'Something Went Wrong...!']);
        }
    }


    public function destroy(Request $request){
        User::destroy($request->id);
        $reminder=Reminder::where('user_id',$request->id)->delete();
        $reminder=Prayer::where('user_id',$request->id)->delete();
        $reminder=GroupUser::where('user_id',$request->id)->delete();
        $reminder=Group::where('user_id',$request->id)->delete();
        $reminder=Notification::where('reciever_id',$request->id)->delete();
        $reminder=Chat::where('sender_id',$request->id)->orWhere("reciever_id",$request->id)->delete();
        $reminder=Partner::where('sender_id',$request->id)->orWhere("reciever_id",$request->id)->delete();

    }

    public function status(Request $request){
         $controls=$request->all();
         $rules=array(
            "user_id"=>"required|exists:users,id",
            "status"=>"required",
        );
        $validator=Validator::make($controls,$rules);
        if ($validator->fails()) {
        return redirect()->back()->withErrors($validator)->withInput();
        }
        $user=User::find($request->user_id);
        $user->is_active=$request->status;
        $user->save();
        $user->tokens()->delete();
        return true;
    }

    public function create_notice(){
        return view('admin.user.create_notice');
    }

    public function notifications(){
        $notifications=Notification::where([["sender_id","<>",NULL],['type','=','notification']])->groupBy('sender_id')->get();
        return view('admin.user.notifications',['notifications'=>$notifications]);
    }

    public function delete_notification (Request $request){
        Notification::where('sender_id',$request->id)->delete();
    }

    public function send_notification(Request $request){
        $admin=Auth::guard('admin')->user();
         $controls=$request->all();
         $rules=array(
            "title"=>"required",
            "message"=>"required",);
         $validator=Validator::make($controls,$rules);
         if ($validator->fails()) {
         return redirect()->back()->withErrors($validator)->withInput();
        }
        $unique=time();
        $data=json_encode(["message"=>$request->message,'title'=>$request->title,'first_name'=>$admin->first_name,'last_name'=>$admin->last_name,'image'=>$admin->profile_image]);
        $users=User::get();
        foreach ($users as $key => $user) {
        $notification=new Notification;
        $notification->type='notification';
        $notification->reciever_id=$user->id;
        $notification->sender_id=$unique;
        $notification->data=$data;
        $notification->save();
          $SERVER_API_KEY = 'AAAAsuCi65o:APA91bHxgmauJiC6VOiiLSTTbljrx6QUYT3wCFGwqnrw3Bn5KCS_gmYAHj15fjjNPXZq2yH-cQWxFLG1Jt86ALCW58NyeC2Hq8gl71r8VwyH4SvNikAlBhl81xqDtKlDWnqE6cv1yoh6';
        $data1 = [
            "to" => $user->user_device_token,
            "notification" => [
                "title" => $request->title,
                "body" =>$request->message ,  
            ],
            "data"=>[
                "type"=>"notification"]
        ];
        $dataString = json_encode($data1);
    
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
        }

          return redirect()->back()->withSuccess('Notification Has Been Sent Succefully...!');


    }
}
