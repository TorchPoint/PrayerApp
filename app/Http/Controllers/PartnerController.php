<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Partner;
use App\Models\User;
use Auth;
use Validator;
class PartnerController extends Controller
{
    //
    public function add_partner(Request $request){
        $controls=$request->all();
        $rules=array(
        "name"=>"required",
        "contact_no"=>"required",
            "country_code"=>"required"
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
        $friend_requests=Partner::where('reciever_id','=',$user->id)
        ->pluck("sender_id")->toArray();
        $friend_requests1=Partner::where('sender_id','=',$user->id)
        ->pluck("reciever_id")->toArray();
        $friends=array_merge($friend_requests,$friend_requests1);
        $part=User::where([['contact_no','=',$request->contact_no],['country_code','=',$request->country_code]])
        ->orWhere(function ($query) use ($request){
        $query->where('first_name','=',$request->name)
        ->orWhere('last_name','=',$request->name);
        })->whereNotIn('id',$friends)->first();
        if (!$part) {
        return response()->json(['status'=>0,'message'=>"Partner Not Found...!"]);
        }
        $user=Auth::user();
        $partner=new Partner;
        $partner->sender_id=$user->id;
        $partner->reciever_id=$part->id;
        $partner->save();
        return response()->json(['status'=>1,'message'=>"Partner Added...!"]);
    }


    public function partners(Request $request){
        $user=Auth::user();
        $friend_requests=Partner::where('reciever_id','=',$user->id)
        ->pluck("sender_id")->toArray();
        $friend_requests1=Partner::where('sender_id','=',$user->id)
        ->pluck("reciever_id")->toArray();
        $friends=array_merge($friend_requests,$friend_requests1);
        $users=User::whereIn('id',$friends)->get();
        if ($users->count()) {
        return response()->json(['status'=>1,'data'=>$users]);
        }
        return response()->json(['status'=>0,'message'=>"Record Not Found...!"]);
    }

public function search_partners(Request $request){
        $controls=$request->all();
        $rules=array(
        "search"=>"required",
        );
        $customMessages = [
        'required' => 'The :attribute  is required.',
        ];
        $validator=Validator::make($controls,$rules,$customMessages);
        if ($validator->fails()) {
        return response()->json(['status'=>0,'message'=>$validator->errors()->all()[0]]);
        }
        $user=Auth::user();
        $friend_requests=Partner::where('reciever_id','=',$user->id)
        ->pluck("sender_id")->toArray();
        $friend_requests1=Partner::where('sender_id','=',$user->id)
        ->pluck("reciever_id")->toArray();
        $friends=array_merge($friend_requests,$friend_requests1);
         $users=User::where(function ($query) use ($request){
            $query->where("first_name","LIKE",'%'.$request->search.'%')
            ->orWhere("last_name","LIKE",'%'.$request->search.'%');
        })->whereIn('id',$friends)->get();
        if ($users->count()) {
        return response()->json(['status'=>1,'data'=>$users]);
        }
        return response()->json(['status'=>0,'message'=>"Record Not Found...!"]);
    }




}
