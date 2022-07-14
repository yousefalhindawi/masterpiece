<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Session;
use Illuminate\Database\Eloquent\ModelNotFoundException;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //GET
        return view('register');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try {
        //POST
        $formFields = $request->validate([
            'name' => ['required', 'min:3', 'max:255', 'regex:/(^([a-zA-Z]))/'],
            'email' => ['required', 'email', Rule::unique('users', 'email')],
            'password' => ['required', 'confirmed', 'min:8', 'max:25', 'regex:/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/'],
            'phone' => ['required', 'regex:/^([0]{1}[7-9]{1})([0-9]{8})$/', 'digits:10', Rule::unique('users', 'phone')],
            'address' => ['required'],
        ]);

        // 'fname' => ['required', 'min:3', 'max:255', 'regex:/(^([a-zA-Z]+)(\d+)?$)/u'],
        //     'pass' => 'regex:/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-.]).{8,}$/'

        //Hash Password
        $formFields['password'] = bcrypt($request->post('password'));
        $user = User::create($formFields);
        if ($user) {
            return redirect()->route('login')->withSuccess(__('User created successfully.'));
        } else {
            return redirect()->route('login')->withFailure(__('Something went wrong, please try again.'));
        }
    } catch (ModelNotFoundException $exception) {
        return back()->withError($exception->getMessage())->withInput();
    };
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(User $user)
    {
        //GET
        if (Session::has('user')) {
        return view('profile', compact('user'));
    } else {
        return redirect()->route('login')->withFailure(__('You must login to see this page'));
    }
}

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, User $user)
    {
        try {
            // dd($user->name);
            // dd($request->file('image'));
            //PUT
            $request->validate([
                'name' => ['required', 'min:3', 'max:255', 'regex:/(^([a-zA-Z]))/'],
                // 'email' => ['required', 'email', Rule::unique('users', 'email')],
                // 'phone' => ['required', 'regex:/^([0]{1}[7-9]{1})([0-9]{8})$/', 'digits:10', Rule::unique('users', 'phone')],
                // 'address' => ['required'],
                // 'image' => ['required', 'image', 'mimes:jpg,png,jpeg,gif,svg', 'max:2048']
                // 'image' => ['required','image','mimes:jpg,png,jpeg,gif,svg','max:2048','dimensions:min_width=100,min_height=100,max_width=1000,max_height=1000']
            ]);
            if ($request->hasfile('image')) {
                $imageName = time() . '-' . $request->post('name') . '-.' . $request->file('image')->extension();
                $request->file('image')->move(public_path('UsersImage'), $imageName);
                // delete the old image
                $destination = public_path("UsersImage/$user->user_img");
                // dd($destination);
                if (File::exists($destination)) {
                    File::delete($destination);
                }
            } else {
                $imageName = $user->user_img;
            }

            $user->name = $request->post('name');
            $user->email = $request->post('email');
            $user->phone = $request->post('phone');
            $user->address = $request->post('address');
            $user->user_img = $imageName;
            $user->update();
            return redirect()->route('users.edit', $user->id)->withSuccess(__('Information updated successfully.'));
        } catch (ModelNotFoundException $exception) {
            return back()->withError($exception->getMessage())->withInput();
        };
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }


    public function login()
    {
        return view('login');
    }

    public function Authenticate(Request $request)
    {
        try {
            $formFields = $request->validate([
                'email' => ['required', 'email'],
                'password' => ['required']

            ]);

            $userInfo = User::where('email', $formFields['email'])->first();
            if (!$userInfo) {
                return back()->withFailure(__("We don't recognize your email address."));
            } else {
                if ($userInfo && Hash::check($formFields['password'], $userInfo->password)) {
                    // if ($userInfo->role_id  == '2') {
                        $request->session()->put('user', $userInfo);
                        return redirect()->route('home');
                    // }
                    // if ($userInfo->role_id == '1') {
                    //     $request->session()->put('admin', $userInfo);
                    //     return redirect()->route('dashboard');
                    // }
                }
            }
        } catch (ModelNotFoundException $exception) {
            return back()->withError($exception->getMessage())->withInput();
        };
    }

    public function logout(Request $request)
    {
        try {
            // if(session()->has('loggedUser')){
            // $request->session()->pull('loggedUser');
            // return back()->withSuccess(__('Logged out successfully.'));
            // }

            auth()->logout();
            $request->session()->invalidate();
            $request->session()->regenerateToken();
            return redirect()->route('home')->withSuccess(__('Logged out successfully.'));
        } catch (ModelNotFoundException $exception) {
            return back()->withError($exception->getMessage())->withInput();
        };
    }
}
