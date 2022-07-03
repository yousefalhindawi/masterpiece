<?php

namespace App\Http\Controllers;

use App\Models\Carts;
use Illuminate\Http\Request;

use function PHPSTORM_META\type;
use Illuminate\Support\Facades\Session;
use Illuminate\Database\Eloquent\ModelNotFoundException;

class CartsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        try {
            //GET
            $cartItems = Carts::orderBy('carts.id', 'ASC')->where('user_id', Session::get('user')->id)->join('users', 'carts.user_id', '=', 'users.id')->join('products', 'carts.product_id', '=', 'products.id')->get(['carts.id','carts.sub_total', 'carts.quantity', 'products.product_img', 'products.product_name','products.sale_status','products.product_price_on_sale','products.product_price','products.product_price']);
            // dd($cartItems);
            return view('cart', compact('cartItems'));
        } catch (ModelNotFoundException $exception) {
            return back()->withError($exception->getMessage())->withInput();
        };
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
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
            // dd($request->all());
            // dd(Session::get('user'));
            // dd($request->session());
            // dd($request->session()->get('user')->id);
            // dd(gettype($request->quantity));
            // dd(gettype((float)($request->quantity)));
            if (Session::has('user')) {
                if ($cart = Carts::where('user_id', $request->session()->get('user')->id)->Where('product_id', $request->product_id)->first()) {
                    // $package->update(array_merge($data,request('image') != null ? ['image' => $imagePath ] : []));
                    $cart->quantity =  $cart->quantity + $request->quantity;
                    $cart->sub_total = $cart->sub_total + (($request->quantity) * ($request->product_price));
                    $cart->update();
                    return back();
                } else {

                    $cart = new Carts();
                    $cart->user_id = $request->session()->get('user')->id;
                    $cart->product_id = $request->product_id;
                    $cart->quantity = $request->quantity;
                    $cart->sub_total = ($request->quantity) * ($request->product_price);
                    $cart->save();
                    return back();
                }
            } else {
                return redirect()->route('login')->withFailure(__('You must login to purchase this product'));
            }
        } catch (ModelNotFoundException $exception) {
            return back()->withError($exception->getMessage())->withInput();
        };
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Carts  $carts
     * @return \Illuminate\Http\Response
     */
    public function show(Carts $carts)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Carts  $carts
     * @return \Illuminate\Http\Response
     */
    public function edit(Carts $carts)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Carts  $carts
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Carts $cart)
    {
        try{
        //PUT
        // dd($request->all());
        // dd($cart);
        $cart->quantity =  $request->quantity;
        $cart->sub_total = (($request->quantity) * ($request->product_price));
        $cart->update();
        return back();

    } catch (ModelNotFoundException $exception) {
        return back()->withError($exception->getMessage())->withInput();
    };
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Carts  $carts
     * @return \Illuminate\Http\Response
     */
    public function destroy(Carts $cart)
    {
        //DELETE
        // Carts::destroy($id);
        $cart->delete($cart);
        return back();

    }


    // function cartItems(){
    //     $userId = Session::get('user')->id;
    //     return Carts::where('user_id', $userId)->count();
    // }

}
