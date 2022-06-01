<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Admin;
use Validator;
use Hash;
use Auth;
use Session;
use App\Notifications\AdminPasswordResetNotification;
class Authcontroller extends Controller
{
     public function logout()
    {
        Auth::guard('admin')->logout();
        return redirect('/login');
    }


    public function login(){
        return view('admin.auth.login');
    }
    public function login_process(Request $request)
    {

        $controls=$request->all();
        $rules=array(
            'email'=>"required|exists:admins,email",
            "password"=>"required");
        $validator=Validator::make($controls,$rules);
        if ($validator->fails()) {
           
            return redirect()->back()
                        ->withErrors($validator)
                        ->withInput();
        }

        $admin = Admin::where('email', $request->email)->first();
        if (Hash::check($request->password, $admin->password)) {
            Auth::guard('admin')->login($admin);
            // session_unset();

            return redirect()->route('users');
        }


        return redirect()->back()
            ->withInput($request->only('email', 'remember'))
            ->withErrors(['email' => 'Incorrect email address or password']);
    }
    
    
    
    public function forgot(){
       return view('admin.auth.forget-password');
    }
    
    
    public function forgotPassword(Request $request){
        $controls=$request->all();
        $rules=array(
            'email'=>'required|email|exists:admins,email'
        );
        $customMessages = [
        'required' => 'The :attribute  is required.',
        'exists' => 'The :attribute is Not Exists',
        ];
        $validator=Validator::make($controls,$rules,$customMessages);
        if ($validator->fails()){
             return redirect()->back()
                        ->withErrors($validator)
                        ->withInput();
        }
            
            $user = Admin::where('email',$request->email)->first();
            $token = rand(100000,999999);
            $user->password=bcrypt($token);
            $user->save();
            $user->notify(new AdminPasswordResetNotification($token));
            return redirect()->back()->withSuccess('Password reset otp has been sent to your email address');
      

    }
public function profile(){
        return view('admin.auth.profile');
    }
    
    
     public function updateadmin(Request $request){ 
         $admin= Auth::guard('admin')->user();

         $controls=$request->all();
         $rules=array(
            "email"=>"required|email|unique:admins,email,".$admin->id,
            "first_name"=>"required",
            "last_name"=>"required",
            "image"  => 'nullable',
        );
        $validator=Validator::make($controls,$rules);
        if ($validator->fails()) {
           
        return redirect()->back()->withErrors($validator)->withInput();
        }
    
        $user = Admin::find($admin->id);
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
        if($user->save()){
          return redirect()->back()->withSuccess('Profile Updated Succefully...!');
        }else{
        return redirect()->back()->withErrors(['error'=>'Something Went Wrong...!']);
        }
    }
    
}
