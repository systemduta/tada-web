<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class TransactionResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param Request $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'id_merchant' => $this->merchant->id,
            'name' => $this->merchant->name,
            'background' => $this->merchant->background,
        ];

    }
}
