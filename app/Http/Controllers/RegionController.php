<?php

namespace App\Http\Controllers;

use App\Models\Province;
use App\Models\Regency;
use Api;
use Exception;

class RegionController extends Controller
{
    private $code;
    private $message;

    public function __construct()
    {
        $this->code = 200;
        $this->message = "success";
    }

    public function get_province()
    {
        try {
            $response = Province::orderBy('name', 'asc')->get();
        } catch (Exception $e) {
                $this->code = 500;
                $this->message = $e->getMessage();
                $response = [];
        }
        return Api::apiRespond($this->code, $response, $this->message);
    }

    public function get_city($id)
    {
        try {
            $response = Regency::where('province_id', $id)->orderBy('name', 'asc')->get();
        } catch (Exception $e) {
            $this->code = 500;
            $this->message = $e->getMessage();
            $response = [];
        }
        return Api::apiRespond($this->code, $response, $this->message);
    }
}
