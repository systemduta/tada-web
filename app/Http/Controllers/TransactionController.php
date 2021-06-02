<?php

namespace App\Http\Controllers;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use App\Http\Resources\TransactionCollection;
use App\Http\Resources\TransactionResource;
use App\Models\UserVoucher;
use Illuminate\Http\Request;
use App\Models\Transaction;
use Illuminate\Http\Response;
use Exception;
use Api;

class TransactionController extends Controller
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
            $pagination = 8;
            $response = Transaction::query()->where('user_id', auth()->guard('api')->user()->id);

            $response = $response->paginate($pagination);
            $response = new TransactionCollection($response);
        } catch (Exception $e){
            $this->code = 500;
            $this->message = $e->getMessage();
            $response = [];
        }
        return Api::apiRespond($this->code, $response, $this->message);
    }

    /**
     * Store a newly created resource in store.
     *
     * @param Request $request
     * @return Response
     */
    public function store(Request $request)
    {
        try {
            $this->message = "Sukses menambahkan merchant";

            $response = Transaction::create([
                'merchant_id' => $request->merchant_id,
                'user_id' => auth()->guard('api')->user()->id
            ]);
        } catch (Exception $e){
            $this->code = 500;
            $this->message = $e->getMessage();
            $response = [];
        }
        return Api::apiRespond($this->code, $response, $this->message);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function show($id)
    {
        try {
            $response = Transaction::findOrFail($id);
            $response = new TransactionResource($response);
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
     * @param  int  $id
     * @return Response
     */
    public function destroy($id)
    {
        try {
            $response = Transaction::findOrFail($id)->delete();
            UserVoucher::where('transaction_id', $id)->delete();
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
