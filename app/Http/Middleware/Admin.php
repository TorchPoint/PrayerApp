<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Auth;


class Admin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        if(Auth::guard('admin') ){
          if(Auth::guard('admin')->user()->role=='admin')
        {
            return $next($request);
        }
        return redirect('login')->with('error','You have not admin access');

      }
        return redirect('login')->with('error','Login First');
    }
}
