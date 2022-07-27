<?php

namespace App\Http\Controllers;

use App\Mail\ContactUsMail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class MailController extends Controller
{
    //
    public function sendEmail(Request $request){
        // dd($request->all());
        try {
            $mailData = [
                'name' => $request->name,
                'email' => $request->email,
                'subject' =>$request->subject,
                'message' =>$request->message,
            ];
            Mail::to(env('MAIL_FROM_ADDRESS'))->send(new ContactUsMail($mailData));
            return redirect()->back()->withSuccess(__('Email sent successfully!'));
        } catch (\Throwable $th) {
            return redirect()->back()->withFailure(__('Something went wrong, please try again later.'));
        }
    }
}
