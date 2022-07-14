@extends('./layouts.master')
@section('title', 'Checkout')
@section('content')
       @if (Session::get('success'))
        <div x-data="{ show: true }" x-init="setTimeout(() => show = false, 3000)" x-show="{show}">
            <p class="alert alert-success text-center fw-bolder" role="alert">
                {{ Session::get('success') }}
            </p>
        </div>
    @endif
    @if (Session::get('failure'))
        <div class="alert alert-danger text-center fw-bolder" role="alert">
            {{ Session::get('failure') }}
        </div>
    @endif
    <div class="hero-wrap hero-bread" style="background-image: url('images/bg_1.jpg');">



        <div class="container">



            <div class="row no-gutters slider-text align-items-center justify-content-center">
                <div class="col-md-9 ftco-animate text-center">
                    <p class="breadcrumbs"><span class="mr-2"><a href="{{ route('home') }}">Home</a></span>
                        <span>Checkout</span>
                    </p>
                    <h1 class="mb-0 bread">Checkout</h1>
                </div>
            </div>
        </div>
    </div>

    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-7 ftco-animate">
                    @if (!session()->has('coupon'))
                    <div class="cart-detail cart-total p-3 p-md-4 my-5">
                    <form action="{{ route('coupon.store') }}" method="POST" class="form-group">
                        @csrf
                        <input type="text" name='code' class="form-control text-left px-3" placeholder="coupon code">
                        <p><input type="submit"  class="btn btn-primary" style="border-radius:0"
                                value="Apply Coupon"/></p>
                    </form>
                </div>
                @endif
                    <form method="POST" action="{{ route('carts.placeorder') }}" class="billing-form">
                        @csrf
                        <h3 class="mb-4 billing-heading" style="color: #82ae46">Billing Details</h3>
                        <div class="row align-items-end">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="name">Your Name</label>
                                    <input type="text" name="name" id="name"class="form-control"
                                        value="{{ $user->name }}">
                                </div>
                            </div>
                            <div class="w-100"></div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="email" name='email' id="email" class="form-control"
                                        value="{{ $user->email }}" disabled />
                                </div>
                            </div>
                            <div class="w-100"></div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="address">Address</label>
                                    <input type="text" name='address' id="address" class="form-control"
                                        value="{{ $user->address }}">
                                </div>
                            </div>

                            <div class="w-100"></div>


                            <div class="w-100"></div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="phone">Phone</label>
                                    <input type="text" name='phone' id="phone" class="form-control"
                                        value="{{ $user->phone }}">
                                </div>
                            </div>
                            <div class="w-100"></div>
                            <div class="col-md-12">
                                <div class="form-group mt-4">
                                    {{-- <h3 class="mb-4 billing-heading" style="color: #82ae46">Payment</h3>
                                    <div class="radio">
                                        <label class="mr-3"><input type="radio" name="optradio"> Create an Account? </label>
                                        <label><input type="radio" name="optradio" checked> Cash on Delivery</label>
                                    </div> --}}
                                </div>
                            </div>
                        </div>

                </div>
                <div class="col-xl-5">
                    <div class="row mt-5 pt-3">
                        <div class="col-md-12 d-flex mb-5">
                            <div class="cart-detail cart-total p-3 p-md-4">
                                <h3 class="billing-heading mb-4">Cart Total</h3>

                                    @foreach ($allCart as $cart)
                                            <p class="d-flex">
                                                <span>{{ $cart->product_name }}  X{{ $cart->quantity }} kilo</span>
                                                <span>{{ $cart->sub_total }}JD</span>
                                            </p>
                                        @endforeach

                                <p class="d-flex">
                                    <span>Subtotal</span>
                                    <span>{{ $subtotal }}JD</span>
                                </p>
                                {{-- <p class="d-flex">
                                  <span>Delivery</span>
                                  <span>1.00 JD</span>
                              </p> --}}

                              @if (session()->has('coupon'))
                                <p class="d-flex">
                                    <span>Discount({{ session()->has('coupon') ? session()->get('coupon')['code'] :''}})</span>
                                    <span style="margin-left:50px">-{{ $discount }}JD</span>
                                    <a href="{{ route('coupon.remove') }}">Remove</a>
                                </p>
                                @endif

                                <hr>
                                <p class="d-flex total-price">
                                    <span>Total</span>
                                    <span><input type="hidden" name="total_price"
                                            value="{{ $total_price }}"/>{{ $total_price }}JD</span>
                                </p>
                                {{-- <form action="{{ route('coupon.store') }}" method="POST" class="form-group d-flex">
                                    @csrf
                                    <input type="text" class="form-control text-left px-3" placeholder="coupon code">
                                    <p><input type="submit" class="btn btn-primary" style="border-radius:0; padding:5px"
                                            value="Apply Coupon" /></p>
                                </form> --}}
                            </div>
                        </div>
                        <div class="col-md-12 ">
                            <div class="cart-detail p-3 p-md-4">
                                {{-- <h3 class="billing-heading mb-4">Payment Method</h3>
                                <h3 class="billing-heading mb-4">Coupon Code</h3>
                                <p>Enter your coupon code if you have one</p>
                                <label for="">Coupon code</label> --}}

                                <h3 class="mb-4 billing-heading" style="color: #82ae46">Payment</h3>
                                    <div class="radio">
                                        {{-- <label class="mr-3"><input type="radio" name="optradio"> Create an Account? </label> --}}
                                        <label><input type="radio" name="optradio" checked> Cash on Delivery</label>
                                    </div>


                            </div>
                            <p><button type="submit" class="btn btn-primary my-3 py-3 px-4 col-md-12">Place an
                                    order</button></p>
                        </div>
                    </div>
                </div> <!-- .col-md-8 -->
                </form><!-- END -->
            </div>
        </div>
    </section> <!-- .section -->

    <section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
        <div class="container py-4">
            <div class="row d-flex justify-content-center py-5">
                <div class="col-md-6">
                    <h2 style="font-size: 22px;" class="mb-0">Subcribe to our Newsletter</h2>
                    <span>Get e-mail updates about our latest shops and special offers</span>
                </div>
                <div class="col-md-6 d-flex align-items-center">
                    <form action="#" class="subscribe-form">
                        <div class="form-group d-flex">
                            <input type="text" class="form-control" placeholder="Enter email address">
                            <input type="submit" value="Subscribe" class="submit px-3">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

@endsection
