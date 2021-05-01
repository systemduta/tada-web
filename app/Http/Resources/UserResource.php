<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
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
            'name' => $this->name,
            'phone' => $this->phone,
            'gender' => $this->gender,
            'tanggal_lahir' => $this->tanggal_lahir,
            'email' => $this->email,
            'province' => empty($this->province->name) ? null : $this->province->name,
            'city' => empty($this->city->name) ? null : $this->city->name,
        ];

    }
}
