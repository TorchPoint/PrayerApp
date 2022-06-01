<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Notification;
use App\Models\Reminder;
use App\Models\User;


class ReminderNotification extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'reminder:notice';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'It Send Notification By Daily,Weekly,Monthly and Yearly';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
     
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
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $dataString);
        $response = curl_exec($ch);
    }
     

}

    public function handle()
    {
      
        
        
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
}
