<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\ResourceCollection;

class TransactionCollection extends ResourceCollection
{

    /**
     * set aim collection
     */
    public $collects = 'App\Http\Resources\TransactionResource';

    /**
     * Transform the resource collection into an array.
     *
     * @param Request $request
     * @return \Illuminate\Support\Collection
     */
    public function toArray($request)
    {
        return $this->collection;
    }
}
