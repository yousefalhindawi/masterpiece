<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Carts;
use App\Models\Order;

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
            if (Session::has('user')) {
            $cartItems = Carts::orderBy('carts.id', 'ASC')->where('user_id', Session::get('user')->id)->join('users', 'carts.user_id', '=', 'users.id')->join('products', 'carts.product_id', '=', 'products.id')->get(['carts.id','carts.sub_total', 'carts.quantity', 'products.product_img', 'products.product_name','products.sale_status_id','products.product_price_on_sale','products.product_price','products.product_price']);
            // dd($cartItems);
            return view('cart', compact('cartItems'));
        } else {
            return redirect()->route('login')->withFailure(__('You must login to see this page'));
        }
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
                    return redirect(url()->previous()."#$request->product_id");
                } else {

                    $cart = new Carts();
                    $cart->user_id = $request->session()->get('user')->id;
                    $cart->product_id = $request->product_id;
                    $cart->quantity = $request->quantity;
                    $cart->sub_total = ($request->quantity) * ($request->product_price);
                    $cart->save();
                    return redirect(url()->previous()."#$request->product_id");
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

    public function checkout(){
        try {
            if (Session::has('user')) {
            $allCart = Carts::where('user_id',Session::get('user')->id)->join('products', 'carts.product_id', '=', 'products.id')->get(['carts.quantity','carts.sub_total', 'products.product_name']);
            // dd( $allCart);
            $subtotal = Carts::where('user_id', Session::get('user')->id)->pluck('sub_total')->sum();

            $total_price = Carts::where('user_id', Session::get('user')->id)->pluck('sub_total')->sum();
            $discount = 0;
            if ($coupon = Session::get('coupon')){
                if ($coupon->type_id === 1) {
                    $discount = $coupon->value;
                    $total_price = $total_price - $discount;
                }else if ($coupon->type_id === 2){
                    $discount = ($total_price*($coupon->percent_off/100));
                    $total_price = $total_price - $discount;
                }
            }
            // dd($total_price);
            // dd($discount);
            $user = User::where('id', '=' ,Session::get('user')->id)->first();
            // dd($user);
            return view('checkout', compact('user','allCart','subtotal','total_price','discount'));
        } else {
            return redirect()->route('login')->withFailure(__('You must login to purchase this product'));
        }
        } catch (ModelNotFoundException $exception) {
            return back()->withError($exception->getMessage())->withInput();
        };
    }

public function placeOrder(Request $request){

    // dd ($request->all());
    $allCart = Carts::where('user_id',Session::get('user')->id)->join('products', 'carts.product_id', '=', 'products.id')->get();
    //  dd ($allCart);
     foreach ($allCart as $cart){
        //  dd($cart->id);
         $order = new Order();
         $order->user_id = $cart->user_id;
         $order->product_id = $cart->product_id;
         $order->product_quantity = $cart->quantity;
         $order->product_sub_total = $cart->sale_status_id === 1 ? $cart->product_price_on_sale : $cart->product_price;
        //  dd( $order->product_sub_total);
         $order->order_total_price = $request->total_price;
         $order->address = $request->address;
         $order->phone = $request->phone;
         $order->order_status = 'pending';
         $order->save();
         Carts::where('user_id',Session::get('user')->id)->delete();
     }
     return redirect()->route('home')->withSuccess(__('You placed your order successfully.'));
}

public function myOrders(){
    $user = User::where('id', Session::get('user')->id)->first();
    // dd($user);
    $orders = Order::orderBy('orders.id', 'DESC')->where('user_id', Session::get('user')->id)->join('users', 'orders.user_id', '=', 'users.id')->join('products', 'orders.product_id', '=', 'products.id')->get(['orders.id','orders.product_sub_total','orders.order_total_price', 'orders.product_quantity','orders.address', 'orders.phone','orders.created_at', 'products.product_name',]);
    // $orders =  Order::orderBy('orders.id', 'DESC')->where('user_id', Session::get('user')->id)->join('users', 'orders.user_id', '=', 'users.id')->join('products', 'orders.product_id', '=', 'products.id')->get(['orders.id','orders.order_total_amount', 'orders.product_quantity','orders.address', 'orders.phone', 'orders.created_at', 'products.product_name',]);
    // dd($orders);
    return view('profile', compact('user','orders'));
}
public function ordersDetails(Request $request){
    // dd($request->all());
    // $user = User::where('id', Session::get('user')->id)->first();
    // dd($user);
    $orders =  Order::orderBy('orders.id', 'DESC')->where('user_id', Session::get('user')->id)->where('orders.created_at',$request->order_date)->join('users', 'orders.user_id', '=', 'users.id')->join('products', 'orders.product_id', '=', 'products.id')->get(['orders.id','orders.product_sub_total','orders.order_total_price', 'orders.product_quantity','orders.address', 'orders.phone', 'orders.created_at', 'products.product_name','products.product_price']);
    // $orders =  Order::orderBy('orders.id', 'DESC')->where('user_id', Session::get('user')->id)->where('orders.created_at',$request->order_date)->join('users', 'orders.user_id', '=', 'users.id')->join('products', 'orders.product_id', '=', 'products.id')->get(['orders.id','orders.order_total_amount', 'orders.product_quantity','orders.address', 'orders.phone', 'orders.created_at', 'products.product_name',]);
    // dd($orders);
    return view('ordersDetails', compact('orders'));
}

}
