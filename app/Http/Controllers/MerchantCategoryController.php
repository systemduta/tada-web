<?php

namespace App\Http\Controllers;

use App\Models\CategoryMerchant;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use Exception;
use Api;

class MerchantCategoryController extends Controller
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
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        try {
            $response = CategoryMerchant::latest()->get();
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
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try {
            $response = CategoryMerchant::create(['name' => $request->name]);
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
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        try {
            $response = CategoryMerchant::findOrFail($id);
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
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        try{
            $response = CategoryMerchant::findOrFail($id);
            $response->name = $request->name;
            $response->save();
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
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try{
            $response = CategoryMerchant::findOrFail($id);
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
