<?php

namespace App\Http\Middleware;

use Closure;
use Api;
use Illuminate\Http\Request;

class MerchantMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  Request  $request
     * @param Closure $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if (auth()->guard('api')->user()){
            if (
                auth()->guard('api')->user()->status == 1 &&
                auth()->guard('api')->user()->email_verified_at != null
            ){
                return $next($request);
            }
        }

        return Api::apiRespond(401, [], "Unauthorized");
    }
}
