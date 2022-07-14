<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class DashboardController extends Controller
{
    //
    public function index(){

        if (Session::has('admin')) {
        return view('admin.index');
    } else {
        return redirect()->route('login')->withFailure(__('You must login with admin credentials to see this page'));
    }
    }
}
