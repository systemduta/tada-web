<?php

namespace App\Http\Controllers;

use Api;
use App\Models\Merchant;
use Exception;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Resources\MerchantListCollection;
use App\Http\Resources\MerchantResource;
use File;

class MerchantController extends Controller
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
            $response = Merchant::query();
            $pagination = 8;

            if(request()->has("search")){
                $response->where('name', 'like', "%" . request()->query("search") . "%");
            }

            $response = $response->get();
        } catch (Exception $e) {
            $this->code = 500;
            $this->message = $e->getMessage();
            $response = [];
        }
        return Api::apiRespond($this->code, $response, $this->message);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return Response
     */
    public function store(Request $request)
    {
        try {
            $background = $request->file('background');
            $background->move('merchant/background', $background->getClientOriginalName());

            $response = Merchant::create([
                'name' => $request->name,
                'short_description' => $request->short_description,
                'long_description' => $request->long_description,
                'category_id' => $request->category_id,
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
     * @param  int  $id
     * @return Response
     */
    public function show($id)
    {
        try {
            $response = Merchant::findOrFail($id);
            $response = new MerchantResource($response);
        } catch (ModelNotFoundException $e) {
            if ($e instanceof ModelNotFoundException) {
                $this->code = 404;
                $this->message = "Data Not Exist";
                $response = [];
            } else {
                $this->code = 500;
                $this->message = $e->getMessage();
                $response = [];
            }
        }
        return Api::apiRespond($this->code, $response, $this->message);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param  int  $id
     * @return Response
     */
    public function update(Request $request, $id)
    {
        try {
            $response = Merchant::findOrFail($id);

            if($request->background){
                $background = $request->file('background');
                $background->move('merchant/background/', $background->getClientOriginalName());
                $filename = public_path('/merchant/background/'. $response->background);

                if(File::exists($filename)) {
                    File::delete($filename);
                }

                $response->background = $background->getClientOriginalName();
                $response->save();
            }

            $response = $response->fill($request->input())->save();
        } catch (ModelNotFoundException $e) {
            if ($e instanceof ModelNotFoundException) {
                $this->code = 404;
                $this->message = "Data Not Exist";
                $response = [];
            } else {
                $this->code = 500;
                $this->message = $e->getMessage();
                $response = [];
            }
        }
        return Api::apiRespond($this->code, $response, $this->message);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function destroy($id)
    {
        try{
            $response = Merchant::findOrFail($id);
            $filename = public_path('/merchant/background/'. $response->background);

            if(File::exists($filename)) {
                File::delete($filename);
            }

            $response = $response->delete();
        } catch (ModelNotFoundException $e) {
            if ($e instanceof ModelNotFoundException) {
                $this->code = 404;
                $this->message = "Data Not Exist";
                $response = [];
            } else {
                $this->code = 500;
                $this->message = $e->getMessage();
                $response = [];
            }
        }
        return Api::apiRespond($this->code, $response, $this->message);
    }
}
