<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\User;
use App\Notifications\VerifyEmail;
use App\Notifications\PasswordResetNotification;
use Validator;
use Hash;
use Auth;
use DB;
use Carbon\Carbon;
use Str;
use App\Models\Notification;

class AuthController extends Controller
{
    public function signUp(Request $request){
        $controls=$request->all();
        $rules=array(
            "email"=>"required|email|unique:users,email",
            "password"=>"required|min:6",
            "first_name"=>"required",
            "last_name"=>"required",
            "contact_no"=>"required",
            'device_type'=>'required|in:android,ios',
            'device_token'=>'required',
            'country_code'=>"required"
        );
           $customMessages = [
        'required' => 'The :attribute  is required.',
        'unique' => 'The :attribute is Already Exists',
        'exists' => 'The :attribute is Not Exists',
        ];
        $validator=Validator::make($controls,$rules,$customMessages);
        if ($validator->fails()) {
            return response()->json(['status'=>0,'message'=>$validator->errors()->all()[0]]);
        }
        else
        {
        $user = new User();
        $user->otp = rand(100000,999999);
        $user->email =$request->email;
        $user->first_name=$request->first_name;
        $user->last_name=$request->last_name;
        $user->contact_no=$request->contact_no;
        $user->country_code=$request->country_code;
        $user->user_device_type=$request->device_type;
        $user->user_device_token=$request->device_token;
        $user->password= bcrypt($request->password);
        $user->remember_token = Str::random(10);
        $user->save();
        $token = $user->createToken('authToken')->plainTextToken;
        $user->notify(new VerifyEmail($user));
        // $loggedInUser = new LoggedInUser($user);
        if($user){
            return response()->json([
                'status'=>1,
                'message'=>'We have sent OTP verification code at your email address',
                'data'=>['user_id'=>$user->id],
            ]);
        }
        else{
            return response()->json(['status'=>0,'message'=>'Something Went Wrong...!']);
        }
      }

   }




    public function resendOtp(Request $request){
         $controls=$request->all();
         $rules=array(
            "user_id"=>"required|exists:users,id"
        );
        $customMessages = [
        'required' => 'The :attribute  is required.',
        'exists' => 'The :attribute is Not Exists',
        ];
        $validator=Validator::make($controls,$rules,$customMessages);
         if ($validator->fails()) {
            return response()->json(['status'=>0,'message'=>$validator->errors()->all()[0]]);
        }
        $user=User::where('id','=',$request->user_id)->first();
        if($user){
        $user->otp = rand(100000,999999);
        $user->save();
        $user->notify(new VerifyEmail($user));

        return response()->json(['status'=>1,'message'=>'We have sent OTP verification code at your email address']);
        }else{
        return response()->json(['status'=>0,'message'=>'Something Went Wrong']);
        }

    }

    public function verification(Request $request){
     $controls=$request->all();
     $rules=array(
            "otp"=>"required|min:6|numeric",
            "user_id"=>"required|exists:users,id"
        );
     $customMessages = [
        'required' => 'The :attribute  is required.',
        'numeric' => 'The :attribute  Must be Numeric',
        'exists' => 'The :attribute is Not Exists',
        ];
        $validator=Validator::make($controls,$rules,$customMessages);
         if ($validator->fails()) {
            return response()->json(['status'=>0,'message'=>$validator->errors()->all()[0]]);
        }
        $user=User::where([['id','=',$request->user_id],['otp','=',$request->otp]])->first();
        if($user){
        Auth::loginUsingId($user->id, true);
        $token = $user->createToken('authToken')->plainTextToken;
        $user->email_verified_at=Carbon::now();
        $user->account_verified = 1;
        $user->save();
        return response()->json(['status'=>1,'message'=>'Account Verification Completed You Can Loggin Now...!', 'data'=>$user,
                        'bearer_token'=>$token]);
        }else{
        return response()->json(['status'=>0,'message'=>'Invalid OTP']);
        }

   }



     public function login(Request $request){
        $controls=$request->all();
        $rules=array(
            'email' => 'required|email|exists:users,email|max:191',
            'password' => 'required|string|min:6',
            'device_type'=>'required|in:android,ios',
            'device_token'=>'required',
            "time_zone"=>"required"
        );
         $customMessages = [
        'required' => 'The :attribute field is required.',
        'unique' => 'The :attribute is Already Exists',
        'exists' => 'The :attribute does not exist',
        ];
        $validator = Validator::make($controls,$rules,$customMessages);
        if ($validator->fails()){
            return response()->json(['status'=>0,'message'=>$validator->errors()->all()[0]]);
        }
        $authenticate_user=Auth::attempt(['email'=>$request->email,'password'=>$request->password]);
        if ($authenticate_user) {
	
        $user = Auth::user();
if($user->is_active==0){
                 return response()
            ->json([
                'status'=>0,
                "data" => $user,
                "message"=>"Your Account Has been Suspended...!"
                 ]);
             }
         if($user->account_verified) {
           $user->tokens()->delete();
           $user->save();
           $token = $user->createToken('authToken')->plainTextToken;
           $user=User::find($user->id);
           $user->user_device_type=$request->device_type;
           $user->time_zone=$request->time_zone;
           $user->user_device_token=$request->device_token;
           $user->save();
           return response()->json([
                        'status'=>1,
                        'message'=>'Login Successfull',
                        'data'=>User::with('user_package')->find($user->id),
                        'bearer_token'=>$token
                    ]);
             }
          else{
            return response()
            ->json([
                'status'=>1,
                "data" => $user,
                "message"=>"Loggedin"
                 ]);
            }
        }  else{
        return response()->json(['status'=>0,"message" =>'Invalid Creidentials...!']);
        }

    }


    public function updateProfile(Request $request){
        $controls=$request->all();
        $user = Auth::user();
        $rules=array(
            "first_name"=>"required",
            "last_name"=>"required",
            "contact_no"=>"required|unique:users,contact_no,".$user->id,
            "attachment"  => 'nullable',
            "country_code"=>"required"
        );
        $customMessages = [
        'required' => 'The :attribute field is required.',
        'unique' => 'The :attribute is Already Exists',
        'exists' => 'The :attribute is Not Exists',
        ];
        $validator=Validator::make($controls,$rules,$customMessages);
        if ($validator->fails()){
            return response()->json(['status'=>0,'message'=>$validator->errors()->all()[0]]);
        }else{
        $user=User::find($user->id);
        $user->first_name=$request->first_name;
        $user->last_name=$request->last_name;
        $user->contact_no=$request->contact_no;
        $user->country_code=$request->country_code;
        $user->complete_profile=1;
        if($request->hasFile('attachment')){
        $imageName = time().'.'.$request->attachment->getClientOriginalExtension();
        $request->attachment->move(public_path('/uploadedimages'), $imageName);
        $user->profile_image=asset('public/uploadedimages')."/".$imageName;
        }
        if ($user->save()) {
            return response()->json(['status'=>1,'message'=>"Profile Updated Successful","data"=>$user]);
        }else{
            return response()->json(['status'=>0,'message'=>"Something Went Wrong Try Again...!"]);
        }
      }

    }


    // public function login(LoginRequest $request){
    //     $authenticate_user  = Auth::attempt(['email'=>$request->email,'password'=>$request->password]);
    //     if($authenticate_user){
    //         $user = Auth::user();
    //         if($user->account_verified && $user->email_verified_at!=null){
    //             $user->device_type = $request->device_type;
    //             $user->device_token = $request->device_token;
    //             $user->save();
    //             $user->tokens()->delete();
    //             $token =$user->createToken('authToken')->plainTextToken;
    //             $user->token = $token;
    //             $loggedInUser = new LoggedInUser($user);
    //             return response()->json([
    //                 'status'=>1,
    //                 'message'=>'Login Successfull',
    //                 'data'=>$loggedInUser,
    //                 'bearer_token'=>$token
    //             ]);
    //         }else{
    //             return $this->apiSuccessMessageResponse('User Is Not Verified',new LoggedInUser($user));
    //         }
    //     }
    //     return $this->apiErrorMessageResponse('Invalid Credentials Entered');
    // }




    public function changePassword(Request $request){
        $controls=$request->all();
        $rules=array(
        'old_password'=>'required',
        'new_password'=>'required|min:6'
        );
        $customMessages = [
        'required' => 'The :attribute field is required.',
        ];
        $validator=Validator::make($controls,$rules,$customMessages);
        if ($validator->fails()){
            return response()->json(['status'=>0,'errors'=>$validator->errors()->all()[0]]);
        }else{
        $hashedPassword = Auth::user()->password;
        if (Hash::check($request->old_password , $hashedPassword )) {
            if (!Hash::check($request->new_password , $hashedPassword)) {
                $user = Auth::user();
                $user->password = bcrypt($request->new_password);
                $user->save();
                return response()->json(['status'=>1,'message'=>"Password Updated"]);
            }else{
                return response()->json(['status'=>0,'message'=>'New password can not be same as the old password!']);
            }
        }
        return response()->json(['status'=>0,'message'=>'Old Password Is Incorrect']);
      }

    }



       public function forgotPassword(Request $request){
        $controls=$request->all();
        $rules=array(
            'email'=>'required|email|exists:users,email'
        );
        $customMessages = [
        'required' => 'The :attribute  is required.',
        'exists' => 'The :attribute is Not Exists',
        ];
        $validator=Validator::make($controls,$rules,$customMessages);
        if ($validator->fails()){
            return response()->json(['status'=>0,'errors'=>$validator->errors()->all()[0]]);
        }
        else{
        $user = User::where('email',$request->email)->first();
            if($user->email_verified_at){
            $token = rand(100000,999999);
            DB::table('password_resets')->insert([
                'email'=>$user->email,
                'token'=> $token,
                'created_at'=>Carbon::now()
            ]);
            $user->notify(new PasswordResetNotification($token));
            return response()->json(['status'=>1,'message'=>'Password reset otp has been sent to your email address']);
         }else{
            return response()->json(['status'=>0,'message'=>'Your Account Is Not Verified Please Verify Your Account...!']);
         }
      }

    }


    // public function forgotPassword(Request $request){
    //     $this->validate($request,[
    //         'email'=>'required|email'
    //     ]);
    //     $user = User::where('email',$request->email)->first();
    //     if($user){
    //         if($user->is_social){
    //             return $this->apiErrorMessageResponse('Password can not be changed because this account is registered using social media platform.');
    //         }
    //         if($user->email_verified_at===null || !$user->account_verified){
    //             return $this->apiErrorMessageResponse('You need to verify your account first');
    //         }
    //         $token = rand(100000,999999);
    //         DB::table('password_resets')->insert([
    //             'email'=>$user->email,
    //             'token'=> $token,
    //             'created_at'=>Carbon::now()
    //         ]);
    //         $user->notify(new PasswordResetNotification($token));
    //         return $this->apiSuccessMessageResponse('Password reset otp has been sent to your email address');
    //     }
    //     return $this->apiErrorMessageResponse('Invalid Email');

    // }




    public function forgotPasswordOtpVerify(Request $request){
        $controls=$request->all();
        $rules=array(
            'otp'=>'required|min:6|numeric',
            'email'=>'required|email|exists:users,email'
        );
        $customMessages = [
        'required' => 'The :attribute field is required.',
        'unique' => 'The :attribute is Already Exists',
        'exists' => 'The :attribute is Not Exists',
        ];
        $validator=Validator::make($controls,$rules,$customMessages);
        if ($validator->fails()){
            return response()->json(['status'=>0,'message'=>$validator->errors()->all()[0]]);
        }
        $check_otp = DB::table('password_resets')->where(['token'=>$request->otp,'email'=>$request->email])->first();
        if($check_otp){
            $totalDuration = Carbon::parse($check_otp->created_at)->diffInHours(Carbon::now());
            if($totalDuration > 1){
            return response()->json(['status'=>0,'message'=>'OTP Expired']);
            }
            return response()->json(['status'=>1,'message'=>'Otp Verified']);

        }
            return response()->json(['status'=>0,'message'=>'OTP Invalid']);
    }

    public function resetForgotPassword(Request $request){
        $controls=$request->all();
        $rules=array(
            'otp'=>'required',
            'new_password'=>'required|min:6',
            'email'=>'required|email|exists:users,email'
        );
           $customMessages = [
        'required' => 'The :attribute field is required.',
        'unique' => 'The :attribute is Already Exists',
        'exists' => 'The :attribute is Not Exists',
        ];
        $validator=Validator::make($controls,$rules,$customMessages);
        if ($validator->fails()){
            return response()->json(['status'=>0,'message'=>$validator->errors()->all()[0]]);
        }
        $check_otp = DB::table('password_resets')->where(['token'=>$request->otp,'email'=>$request->email])->first();
        if($check_otp){
            $totalDuration = Carbon::parse($check_otp->created_at)->diffInHours(Carbon::now());
            if($totalDuration > 1){
            return response()->json(['status'=>0,'message'=>"OTP Expired"]);
            }
            $user = User::where('email',$check_otp->email)->first();
            $user->password = bcrypt($request->new_password);
            $user->save();
            DB::table('password_resets')->where(['token'=>$request->otp,'email'=>$request->email])->delete();
            return response()->json(['status'=>1,'message'=>"Password updated"]);
        }
        return response()->json(['status'=>0,'message'=>"OTP Invalid"]);


    }




     public function socialAuth(Request $request){
      $controls=$request->all();
      $rules=array(
            'access_token'=>'required',
            'provider'=>'required|in:google,facebook,apple,phone',
            'device_type'=>'required|in:android,ios',
            'device_token'=>'required',
            'name'=>"nullable",
            'image'=>"nullable",
            'email'=>"nullable",
            'phone'=>"nullable",
            "time_zone"=>"required",
             "country_code"=>"nullable"



        );
        $validator=Validator::make($controls,$rules);
        if ($validator->fails()){
            return response()->json(['status'=>0,'message'=>$validator->errors()->all()[0]]);
        }
        // $auth = app('firebase.auth');
        // Retrieve the Firebase credential's token
        // $idTokenString = $request->access_token;
 
        try {
            // $verifiedIdToken = $auth->verifyIdToken($idTokenString);
            // $user_social_token = $verifiedIdToken->getClaim('sub');
            $user_social_token=$request->access_token;
            $user = User::where('user_social_token',$user_social_token)->first();
            if(!$user){
                $user = new User();
                $user->is_social=1;
                $user->user_social_token = $user_social_token;
                $user->user_social_type = $request->provider;
                $user->email=$request->email;
                $user->profile_image=$request->image;
                $user->contact_no=$request->phone;
                $user->country_code=$request->country_code;
                if(isset($request->name)){
                $name=explode(' ', $request->name);
                $user->first_name=$name[0];
                if(isset($name[1])){
                $user->last_name=$name[1];}
                }

            }

            if(!$user->account_verified){
                $user->account_verified = 1;
                $user->email_verified_at = Carbon::now();
            }
		 
            $user->user_device_type = $request->device_type;
            $user->user_device_token = $request->device_token;
            $user->tokens()->delete();
            Auth::loginUsingId($user->id, true);
            $user->time_zone=$request->time_zone;
            $user->save();
	   
          
            $token =$user->createToken('authToken')->plainTextToken;
           $user=User::find($user->id);
 if($user->is_active==0){
                 return response()
            ->json([
                'status'=>0,
                "message"=>"Your Account Hasbeen Suspended...!"
                 ]);
              }
            // $user->token = $token;
            // $loggedInUser = new LoggedInUser($user);

            return response()->json([
                'status'=>1,
                'message'=>'Login Successful',
                'data'=>User::with('user_package')->find($user->id),
                'bearer_token'=>$token
            ]);
        } catch (\InvalidArgumentException $e) { // If the token has the wrong format
            return response()->json(['status'=>0,
                'message' => 'Unauthorized - Can\'t parse the token: ' . $e->getMessage()
            ]);

        } catch (InvalidToken $e) { // If the token is invalid (expired ...)
            return response()->json([
                'status'=>0,
                'message' => 'Unauthorized - Token is invalide: ' . $e->getMessage()
            ]);
        }


    }

    public function logout(){
        $user = Auth::user();
        $user->tokens()->delete();
        // $user->device_type = null;
        // $user->device_token = null;
        $user->save();
        return response()->json(['status'=>1,'message'=>"Logout Successful...!"]);

    }


    public function notifications(){
    $user=Auth::user();
    $notifictions=Notification::where('reciever_id','=',$user->id)->get();
    if($notifictions->count()){
     return response()->json(['status'=>1,'data'=>$notifictions]);
     }else{
     return response()->json(['status'=>0,'message'=>"Notification Not Available...!"]);
     }
    }

}
