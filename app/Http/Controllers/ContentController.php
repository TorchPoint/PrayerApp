<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Content;
use Validator;
class ContentController extends Controller
{
  
    public function index()
    {
        $contents=Content::all();
        if ($contents) {
             return response()->json([
                'status'=>1,
                'message'=>'Content Available',
                'data'=>$contents,
            ]);
        }else{
             return response()->json([
                'status'=>0,
                'message'=>'Content Not Available',
            ]);
        }
    }

    public function create()
    {
        //
    }

  
    public function store(Request $request)
    {
        //
    }

   
    public function show($id)
    {
        $controls=['id'=>$id];
        $rules=array(
        "id"=>"required|exists:contents,id"
        );
        $validator=Validator::make($controls,$rules);
        if ($validator->fails()) {
            return response()->json(['status'=>0,'message'=>$validator->errors()->all()[0]]);
        }
        $content=Content::find($id);
        if ($content) {
             return response()->json([
                'status'=>1,
                'message'=>'Content Available',
                'data'=>$content,
            ]);  
        }else{
             return response()->json([
                'status'=>0,
                'message'=>'Content Not Found',
            ]);
        }
    }

    
    public function edit($id)
    {
        //
    }

    
    public function update(Request $request, $id)
    {
        //
    }


    public function destroy($id)
    {
        //
    }
    
    public function content(Request $request){
         $controls=$request->all();
        $rules=array(
        "type"=>"required"
        );
        $validator=Validator::make($controls,$rules);
        if ($validator->fails()) {
            return response()->json(['status'=>0,'message'=>$validator->errors()->all()[0]]);
        }
        $content=Content::where('type',$request->type)->first();
        if ($content) {
             return response()->json([
                'status'=>1,
                'message'=>'Content Available',
                'data'=>$content,
            ]);  
        }else{
             return response()->json([
                'status'=>0,
                'message'=>'Content Not Found',
            ]);
        }
    }
}
