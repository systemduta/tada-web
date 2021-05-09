<?php

namespace App\Http\Middleware;

use Closure;
use Api;

class UserMiddleware
{
    public function handle($request, Closure $next)
    {
          if (auth()->guard('api')->user()){
            return $next($request);
          }

          return Api::apiRespond(401, [], "Unauthorized");
    }
}
