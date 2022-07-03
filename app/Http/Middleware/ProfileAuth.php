<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class ProfileAuth
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
           if ($request->session()->has('user') || $request->session()->has('admin') && ($request->path() == 'users/{user}/edit')) {
            $user = $request->session()->get('user');
            return redirect()->route('users.edit', $user->id);
        }
         return $next($request)->header('Cache-Control, no-cache','no-store','max-age=0','must-revalidate')->header('Pragma', 'no-cache')->header('Expires', 'Sat 01 Jan 1970 00:00:00 GMT');
    }
}
