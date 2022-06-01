<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Reminder;
use App\Models\Notification;
use App\Models\User;

use Validator;
use Auth;
class ReminderController extends Controller
{
    //
     public function create_reminder(Request $request){
        $controls=$request->all();
        $rules=array(
        "title"=>"required",
        "reminder_date"=>"required|date",
        "type"=>"required|in:monthly,weekly,daily,once",
        'reminder_time'=>'required'
        );
        $customMessages = [
        'required' => 'The :attribute field is required.',
        'in' => 'The :attribute field is must monthly,weekly,daily or once',
        ];
        $validator=Validator::make($controls,$rules,$customMessages);
        if ($validator->fails()){
        return response()->json(['status'=>0,'message'=>$validator->errors()->all()[0]]);
        }
        $user=Auth::user();
        $reminder=new Reminder;
        $reminder->user_id=$user->id;
        $reminder->title=$request->title;
        $reminder->reminder_date=$request->reminder_date;
        $reminder->reminder_time=$request->reminder_time;
        $reminder->type=$request->type;
        $reminder->save();
        if ($reminder->save()) {
        return response()->json(['status'=>1,'date'=>$reminder]);
        }else{
        return response()->json(['status'=>0,'message'=>"Something Went Wrong...!"]);
        }
     }


      public function update_reminder(Request $request){
        $controls=$request->all();
        $rules=array(
         "reminder"=>"required|exists:reminders,id",
        "title"=>"required",
        "reminder_date"=>"required|date",
        "type"=>"required|in:monthly,weekly,daily,once",
        'reminder_time'=>"required"
        );
        $customMessages = [
        'required' => 'The :attribute field is required.',
        'in' => 'The :attribute field is must monthly,weekly,daily or once',
        ];
        $validator=Validator::make($controls,$rules,$customMessages);
        if ($validator->fails()){
        return response()->json(['status'=>0,'message'=>$validator->errors()->all()[0]]);
        }
        $reminder= Reminder::find($request->reminder);
        $reminder->title=$request->title;
        $reminder->reminder_date=$request->reminder_date;
        $reminder->type=$request->type;
        $reminder->reminder_time=$request->reminder_time;
        $reminder->save();
        if ($reminder->save()) {
        return response()->json(['status'=>1,'date'=>$reminder]);
        }else{
        return response()->json(['status'=>0,'message'=>"Something Went Wrong...!"]);
        }
     }


     public function edit_reminder(Request $request){
        $controls=$request->all();
        $rules=array(
        "reminder"=>"required|exists:reminders,id",
        );
        $customMessages = [
        'required' => 'The :attribute field is required.',
        'exists' => 'The :attribute not exists',
        ];
        $validator=Validator::make($controls,$rules,$customMessages);
        if ($validator->fails()){
        return response()->json(['status'=>0,'message'=>$validator->errors()->all()[0]]);
        }
        $reminder=Reminder::find($request->reminder);
        return response()->json(['status'=>1,'data'=>$reminder]);
     }


     public function delete_reminder(Request $request){
        $controls=$request->all();
        $rules=array(
        "reminder"=>"required|exists:reminders,id",
        );
        $customMessages = [
        'required' => 'The :attribute field is required.',
        'exists' => 'The :attribute not exists',
        ];
        $validator=Validator::make($controls,$rules,$customMessages);
        if ($validator->fails()){
        return response()->json(['status'=>0,'message'=>$validator->errors()->all()[0]]);
        }
        $reminder=Reminder::find($request->reminder)->delete();
        return response()->json(['status'=>1,'message'=>"reminder Deleted"]);
     }


      public function reminders(Request $request){
        $user=Auth::user();
        $reminders=Reminder::where('user_id',"=",$user->id)->get();
        if ($reminders->count()) {
        return response()->json(['status'=>1,'data'=>$reminders]);
        }
        return response()->json(['status'=>0,'message'=>"Record Not Found"]);
     }




     public function time_zone(){
         date_default_timezone_set('Asia/Karachi');

$script_tz = date_default_timezone_get();

return date("Y-m-d h:i:s");
     }


     public function cron_job(){
         $reminders=Reminder::with('user')->get();
         if($reminders->count()){
             foreach($reminders as $reminder){

                 date_default_timezone_set($reminder->user->time_zone);
                 $time_zone = date_default_timezone_get();
                 $current_day=date('D', strtotime(date('Y-m-d')));
                 $short_date=date('d', strtotime(date('Y-m-d')));
                 $short_month=date('m', strtotime(date('Y-m-d')));
                 $minutes=(strtotime(date('h:i:s'))-strtotime($reminder->reminder_time))/60;
                 if($reminder->type='daily' && $minutes<=15){
                     $this->notify($reminder->user_id,$reminder->id,$reminder->reminder_time,$reminder->title,$reminder->user->time_zone);
                 }else if($reminder->type='weekly' && $minutes<=15 && $current_day==date('D',strtotime($reminder->reminder_date))){
                     $this->notify($reminder->user_id,$reminder->id,$reminder->reminder_time,$reminder->title,$reminder->user->time_zone);
                 }
                 else if($reminder->type='monthly' && $minutes<=15 && $short_month==date('m',strtotime($reminder->reminder_date))){
                     $this->notify($reminder->user_id,$reminder->id,$reminder->reminder_time,$reminder->title,$reminder->user->time_zone);
                 }
                 else if($reminder->type='once' && $minutes<=15 && $short_date==date('d',strtotime($reminder->reminder_date))){
                     $this->notify($reminder->user_id,$reminder->id,$reminder->reminder_time,$reminder->title,$reminder->user->time_zone);
                 }
             }
         }
     }

    public function notify($user,$type,$time,$title,$timezone){
        date_default_timezone_set($timezone);
        $time_zone = date_default_timezone_get();
        $current_date=date("Y-m-d");
        $notification=Notification::where([['reciever_id','=',$user],['type','=','reminder'],['read_at','=',$type]])
            ->whereDate('created_at','=', $current_date)->get();
        if(!$notification->count()){
            $user_data=User::where('id','=',$user)->first();
            $newt=new Notification;
            $newt->data=json_encode(['message'=>"Time Reminder",'reminder_time'=>$time]);
            $newt->type='reminder';
            $newt->read_at=$type;
            $newt->reciever_id=$user;
            $newt->save();
            $SERVER_API_KEY = 'AAAAsuCi65o:APA91bHxgmauJiC6VOiiLSTTbljrx6QUYT3wCFGwqnrw3Bn5KCS_gmYAHj15fjjNPXZq2yH-cQWxFLG1Jt86ALCW58NyeC2Hq8gl71r8VwyH4SvNikAlBhl81xqDtKlDWnqE6cv1yoh6';
            $data = [
                "to" => $user_data->user_device_token,
                "notification" => [
                    "title" => "reminder",
                    "body" =>$title." Reminder Time ".$time,
                ]
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
        }


    }
}
