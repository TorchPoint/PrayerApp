<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;
class SubscribeRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            "payment_id"=>"required",
            "type"=>"required|in:monthly,yearly",
            "name"=>"required",
        ];
    }

     public function failedValidation(Validator $validator) { 
        throw new HttpResponseException(response()->json(["message"=>$validator->errors()->all()[0], "status"=>0])); 
    }
}
