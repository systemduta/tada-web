<?php

namespace App\Http\Controllers;

use App\Models\Merchant;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use App\Models\Voucher;
use Exception;
use Api;
use File;
use Illuminate\Http\Response;
use Symfony\Component\HttpKernel\Exception\HttpException;

class VoucherController extends Controller
{
    private $code;
    private $message;

    public function __construct()
    {
        $this->code = 200;
        $this->message = "success";
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        try {
            $response = Voucher::where('merchant_id', request()->query("merchant_id"))->get();
        } catch (Exception $e) {
            $this->code = 500;
            $this->message = $e->getMessage();
            $response = [];
        }
        return Api::apiRespond($this->code, $response, $this->message);
    }

    /**
     * Store a newly created resource in store.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return Response
     */
    public function store(Request $request)
    {
        try {
            $background = $request->file('background');
            $background->move('merchant/voucher/background', $background->getClientOriginalName());

            $response = Voucher::create([
                'name' => $request->name,
                'description' => $request->description,
                'merchant_id' => Merchant::where('user_id', auth()->guard('api')->user()->id)->first()->id,
                'min_transaction' => $request->min_transaction,
                'value' => $request->value,
                'expiration' => $request->expiration,
                'background' => $background->getClientOriginalName()
            ]);
        } catch (Exception $e) {
            $this->code = 500;
            $this->message = $e->getMessage();
            $response = [];
        }
        return Api::apiRespond($this->code, $response, $this->message);
    }

    /**
     * Display the specified resource.
     *
     * @param $id
     * @return Response
     */
    public function show($id)
    {
        try {
            $response = Voucher::findOrFail($id);
        } catch (ModelNotFoundException $e) {
            if ($e instanceof ModelNotFoundException) {
                $this->code = 404;
                $this->message = "Data Not Exist";
            } else {
                $this->code = 500;
                $this->message = $e->getMessage();
            }
            $response = [];
        }
        return Api::apiRespond($this->code, $response, $this->message);
    }

    /**
     * Update the specified resource in store.
     *
     * @param \Illuminate\Http\Request $request
     * @param $id
     * @return Response
     */
    public function update(Request $request, $id)
    {
        try {
            $response = Voucher::findOrFail($id);

            if($request->file('background')){
                $background = $request->file('background');;
                if($response->background != $background->getClientOriginalName()){
                    $background->move('voucher/background/', $background->getClientOriginalName());
                    $filename = public_path('/voucher/background/'. $response->background);

                    if(File::exists($filename)) {
                        File::delete($filename);
                    }

                    $response->background = $background->getClientOriginalName();
                    $response->save();
                }
            }

            $response = $response->fill($request->input())->save();
        } catch (ModelNotFoundException $e) {
            if ($e instanceof ModelNotFoundException) {
                $this->code = 404;
                $this->message = "Data Not Exist";
            } else {
                $this->code = 500;
                $this->message = $e->getMessage();
            }
            $response = [];
        }
        return Api::apiRespond($this->code, $response, $this->message);
    }

    /**
     * Remove the specified resource from store.
     *
     * @param $id
     * @return void
     */
    public function destroy($id)
    {
        try{
            $response = Voucher::findOrFail($id);
            $filename = public_path('/voucher/background/'. $response->background);

            if(File::exists($filename)) {
                File::delete($filename);
            }

            $response = $response->delete();
        } catch (ModelNotFoundException $e) {
            if ($e instanceof ModelNotFoundException) {
                $this->code = 404;
                $this->message = "Data Not Exist";
            } else {
                $this->code = 500;
                $this->message = $e->getMessage();
            }
            $response = [];
        }
        return Api::apiRespond($this->code, $response, $this->message);
    }
}
