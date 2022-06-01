<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use App\Models\Feedback;
use Illuminate\Support\Facades\Storage;

class FeedbackController extends Controller
{
    //

    public function create(Request $request){
    $controls=$request->all();
    $rules=array(
        "subject"=>"required",
        "body"=>"required",
        'attachment'  => 'required|mimes:png,jpg,jpeg|max:2048',
    );

    $validator=Validator::make($controls,$rules);
    if ($validator->fails()) {
        return response()->json(['status'=>0,'message'=>$validator->errors()->all()[0]]);
        }
      $uploadedFile = $request->file('attachment');
      $filename = time().$uploadedFile->getClientOriginalName();

      Storage::disk('local')->putFileAs(
        'files/',
        $uploadedFile,
        $filename
      );
        $feedback=new Feedback;
        $feedback->subject=$request->subject;
        $feedback->body=$request->body;
        $feedback->attachment=$filename;
        $feedback->user_id=$request->user()->id;
        if ($feedback->save()) {
        return response()->json([
            'status'=>1,
            'message'=>"Feedback Added...!",
            "data"=>$feedback]);
        } else{
             return response()->json([
            'status'=>0,
            'message'=>"Something Went Wrong...!"]);
        }


    }


}
