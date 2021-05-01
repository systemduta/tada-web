<?php

namespace App\Http\Controllers;

use Api;
use App\Mail\EmailCodeVerification;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Validator;
use Exception;
use File;
use App\Http\Resources\UserResource;
class UserController extends Controller
{
    private $code;
    private $message;

    public function __construct()
    {
        $this->code = 200;
        $this->message = "success";
    }

    public function index()
    {
        $data = new UserResource(auth()->guard('api')->user());
        return Api::apiRespond($this->code, $data, $this->message);
    }

    public function update(Request $request){
        try {
            $id = auth()->guard('api')->user()->id;
            $response = User::where('id', $id)->first();

            if($request->file('photo')){
                $photo = $request->file('photo');
                $photo->move('user/photo/', $photo->getClientOriginalName());
                $filename = public_path('/user/photo/'. $response->photo);

                if(File::exists($filename)) {
                    File::delete($filename);
                }

                $response->photo = $photo->getClientOriginalName();
                $response->save();
            }

            $response = $response->fill($request->input())->save();
        } catch (Exception $e) {
                $this->code = 500;
                $this->message = $e->getMessage();
                $response = [];
        }

        return Api::apiRespond($this->code, $response, $this->message);
    }

    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => ['required', 'string', 'email', 'unique:users', 'max:255'],
            'password' => [
                'required', 'string', 'min:8', 'confirmed', 'min:9',
                'regex:/[a-z]/',
                'regex:/[A-Z]/',
                'regex:/[0-9]/',
                'regex:/[@$!%*#?&.s]/']
        ]);

        if ($validator->fails()) {
            return Api::apiResponseValidationFails('Validation error messages!', $validator->errors()->all());
        }

        $code = rand(100000,999999);

        $user = User::create([
            'email'=> $request->email,
            'password' => Bcrypt($request->password),
            'remember_token' => $code
        ]);

        $this->message = "Sukses mendaftar akun, silahkan cek email untuk verifikasi";
        Mail::to($request->email)->send(new EmailCodeVerification($code));

        return Api::apiRespond($this->code, $user, $this->message);
    }

    public function validate_email($id){
        $data = User::where('remember_token', $id)->first();
        $this->message = "Kode tidak valid silahkan mengkonfirmasi ulang";
        $this->code = 404;

        if ($data){
            if(!$data->email_verified_at){
                $this->code = 200;
                $this->message = "Sukses melakukan konfirmasi email";

                $data->email_verified_at = Carbon::now();
                $data->remember_token = null;
                $data->save();
            } else {
                $this->message = "Email sudah diverifikasi";
            }
        }

        return Api::apiRespond($this->code, [], $this->message);
    }

    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => ['required', 'email'],
            'password' => ['required']
        ]);

        if ($validator->fails()) {
            return Api::apiResponseValidationFails('Login validation fails!', $validator->errors()->all(), 422);
        }

        $data = [];
        $this->code = 404;
        $this->message = "Email atau password anda salah";

        if (Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
            $get_user = User::where('email', '=', $request->email)->first();
            if($get_user){
                if($get_user->email_verified_at){
                    $user = Auth::user();
                    $data['user'] = $user;
                    $data['token'] = $user->createToken('maesaintern')->accessToken;

                    $this->code = 200;
                    $this->message = "success";
                } else {
                    $this->message = "Email belum diverifikasi";
                }
            }
        }

        return Api::apiRespond($this->code, $data, $this->message);
    }

    public function resend_email_code(Request $request){
        $data = User::where('email', $request->email)->first();

        $this->message = "Email tidak valid";
        $this->code = 404;

        $code = rand(100000,999999);

        if ($data){
            if(!$data->email_verified_at){
                $this->code = 200;
                $this->message = "Sukses mengirimkan kode konfirmasi";

                $data->remember_token = $code;
                $data->save();

                Mail::to($request->email)->send(new EmailCodeVerification($code));
            } else {
                $this->message = "Email sudah diverifikasi";
            }
        }

        return Api::apiRespond($this->code, [], $this->message);
    }

    public function reset_password(){
        
    }

    public function logout()
    {
        Auth::logout();
        return Api::apiRespond($this->code, [], $this->message);
    }
}
