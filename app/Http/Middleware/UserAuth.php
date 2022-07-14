<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class UserAuth
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        if (!$request->session()->has('user') && !$request->session()->has('admin') && $request->path() != 'login' && $request->path() != 'register' && $request->path() != 'users/{user}/edit') {
            return redirect()->route('login')->withFailure(__('You must login.'));
        }
        // if ($request->session()->has('user') && $request->path() =='users/{user}/edit') {
        //     return redirect()->route('users.edit');
        // }
        if ($request->path() != 'users/{user}/edit' && $request->session()->has('user') || $request->session()->has('admin') && ($request->path() =='login' || $request->path() == 'register' )) {
            return back();
        }

        return $next($request)->header('Cache-Control, no-cache','no-store','max-age=0','must-revalidate')->header('Pragma', 'no-cache')->header('Expires', 'Sat 01 Jan 1970 00:00:00 GMT');
    }
}
