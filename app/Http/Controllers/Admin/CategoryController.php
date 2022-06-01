<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category as CategoryModel;
use Auth;
use Validator;


class CategoryController extends Controller
{
  

    public function create(){
    return view('admin.category.create');
    }
    
    
    
    public function store(Request $request){
        $controls=$request->all();
        $rules=array(
        "name"=>"required|unique:categories,name",
        );
        $validator=Validator::make($controls,$rules);
        if($validator->fails()) {
         return redirect()->back()->withErrors($validator)->withInput();
        }
        $category=new CategoryModel;
        $category->name=$request->name;
        if ( $category->save()) {
        return redirect()->back()->withSuccess('Category Added Succefully...!');
        }else{
        return redirect()->back()->withErrors(['error'=>'Something Went Wrong...!']);
        }
    }
    
   public function edit($id){
    $category=CategoryModel::FindorFail($id);
    return view('admin.category.edit',['category'=>$category]);
    }
    
    
    public function update(Request $request,$id){
         $controls=$request->all();
        $rules=array(
        "name"=>"required|unique:categories,name,".$id,
        );
        $validator=Validator::make($controls,$rules);
        if($validator->fails()) {
         return redirect()->back()->withErrors($validator)->withInput();
        }
        $category= CategoryModel::find($id);
        $category->name=$request->name;
        if ( $category->save()) {
        return redirect()->back()->withSuccess('Category Updated Succefully...!');
        }else{
        return redirect()->back()->withErrors(['error'=>'Something Went Wrong...!']);
        }
    }
    
    public function index(){
        $categories=CategoryModel::orderBy('id',"DESC")->get();
        return view('admin.category.index',['categories'=>$categories]);
    }
    
    
     public function destroy(Request $request){
        $milestones=CategoryModel::destroy($request->id);
        return ['message'=>"Category Deleted"];
    }

     public function status(Request $request){
        $category=CategoryModel::find($request->id);
        $category->status=$request->status;
        $category->save();

        return ['message'=>"Category Deleted"];
    }
   
}