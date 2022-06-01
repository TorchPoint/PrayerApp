<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use App\Models\Category;
class CategoryController extends Controller
{
    //
     public function index(){
        $Categories=Category::where('status','=',1)->get();
        if ($Categories->count()) {
        return response()->json(['status'=>1,'message'=>'Categories Available','data'=>$Categories,]);
        }else{
        return response()->json(['status'=>0, 'message'=>'Category  Not Available']);
        }
    }

    public function create(Request $request){
        $controls=$request->all();
        $rules=array(
            "name"=>"required|unique:categories,name",
        );
        $customMessages = [
        'required' => 'The :attribute field is required.',
        ];
        $validator=Validator::make($controls,$rules,$customMessages);
        if ($validator->fails()){
            return response()->json(['status'=>0,'message'=>$validator->errors()->all()[0]]);
        }else{
            $category=new Category;
            $category->name=$request->name;
            if ($category->save()) {
            return response()->json(['status'=>1,'message'=>"Category Added Successfully...!"]);
           }else{
            return response()->json(['status'=>0,'message'=>"Something Went Wrong...!"]); 
          }
       }
    }


    public function update(Request $request){
        $controls=$request->all();
        $rules=array(
            "name"=>"required",
            "category"=>"required|exists:categories,id"
        );
        $customMessages = [
        'required' => 'The :attribute field is required.',
        ];
        $validator=Validator::make($controls,$rules,$customMessages);
        if ($validator->fails()){
            return response()->json(['status'=>0,'message'=>$validator->errors()->all()[0]]);
        }else{
            $category=Category::find($request->category);
            $category->name=$request->name;
            if ($category->save()) {
            return response()->json(['status'=>1,'message'=>"Category Updated Successfully...!"]);
           }else{
            return response()->json(['status'=>0,'message'=>"Something Went Wrong...!"]); 
          }
       }
    }


    public function destroy($category){
        $categor=Category::find($category);
        if ($categor) {
        Category::destroy($category);
        return response()->json(['status'=>1,'message'=>"Category Deleted Successfully...!"]);  
        }else{
        return response()->json(['status'=>0,'message'=>"Category Not Found...!"]); 
        }
    }

}
