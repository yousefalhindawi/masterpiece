@extends('./layouts.master')
@section('title', 'Home')
@section('content')


<section id="home-section" class="hero">
    @if (Session::get('success'))
    <div x-data="{show: true}" x-init="setTimeout(() => show=false, 3000)" x-show="{show}">
        <p class="alert alert-success text-center fw-bolder"
            role="alert">
            {{ Session::get('success') }}
        </p></div>
    @endif
    @if (Session::get('failure'))
        <div class="alert alert-danger text-center fw-bolder" role="alert">
            {{ Session::get('failure') }}
        </div>
    @endif
    <div class="home-slider owl-carousel">
    <div class="slider-item" style="background-image: url(images/bg_1.jpg);">
        <div class="overlay"></div>
      <div class="container">
        <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

          <div class="col-md-12 ftco-animate text-center">
            <h1 class="mb-2">We serve Fresh Vegestables &amp; Fruits</h1>
            <h2 class="subheading mb-4">We deliver organic vegetables &amp; fruits</h2>
            <p><a href="{{ route('shops') }}" class="btn btn-primary">View Details</a></p>
          </div>

        </div>
      </div>
    </div>

    <div class="slider-item" style="background-image: url(images/bg_2.jpg);">
        <div class="overlay"></div>
      <div class="container">
        <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

          <div class="col-sm-12 ftco-animate text-center">
            <h1 class="mb-2">100% Fresh &amp; Organic Foods</h1>
            <h2 class="subheading mb-4">We deliver organic vegetables &amp; fruits</h2>
            <p><a href="{{ route('shops') }}" class="btn btn-primary">View Details</a></p>
          </div>

        </div>
      </div>
    </div>
  </div>
</section>

<section class="ftco-section">
      <div class="container">
          <div class="row no-gutters ftco-services">
    <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
      <div class="media block-6 services mb-md-0 mb-4">
        <div class="icon bg-color-1 active d-flex justify-content-center align-items-center mb-2">
              <span class="flaticon-shipped"></span>
        </div>
        <div class="media-body">
          <h3 class="heading">Free Shipping</h3>
          <span>On order over 10JD</span>
        </div>
      </div>
    </div>
    <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
      <div class="media block-6 services mb-md-0 mb-4">
        <div class="icon bg-color-2 d-flex justify-content-center align-items-center mb-2">
              <span class="flaticon-diet"></span>
        </div>
        <div class="media-body">
          <h3 class="heading">Always Fresh</h3>
          <span>Product well package</span>
        </div>
      </div>
    </div>
    <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
      <div class="media block-6 services mb-md-0 mb-4">
        <div class="icon bg-color-3 d-flex justify-content-center align-items-center mb-2">
              <span class="flaticon-award"></span>
        </div>
        <div class="media-body">
          <h3 class="heading">Superior Quality</h3>
          <span>Quality Products</span>
        </div>
      </div>
    </div>
    <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
      <div class="media block-6 services mb-md-0 mb-4">
        <div class="icon bg-color-4 d-flex justify-content-center align-items-center mb-2">
              <span class="flaticon-customer-service"></span>
        </div>
        <div class="media-body">
          <h3 class="heading">Support</h3>
          <span>24/7 Support</span>
        </div>
      </div>
    </div>
  </div>
      </div>
  </section>

  <section class="ftco-section ftco-category ftco-no-pt">
      <div class="container">
          <div class="row">
              <div class="col-md-8">
                  <div class="row">
                      <div class="col-md-6 order-md-last align-items-stretch d-flex">
                          <div class="category-wrap-2 ftco-animate img align-self-stretch d-flex" style="background-image: url(images/category.jpg);">
                              <div class="text text-center">
                                  <h2>Vegetables</h2>
                                  <p>Protect the health of every home</p>
                                  <p><a href="{{ route('shops') }}" class="btn btn-primary">Shop now</a></p>
                              </div>
                          </div>
                      </div>
                      <div class="col-md-6">
                         {{-- {{  (str_replace('\\', '/', ($categories[0]->category_img)))}} --}}
                          <div class="category-wrap ftco-animate img mb-4 d-flex align-items-end" style="background-image: url({{ asset('storage/'.(str_replace('\\', '/', ($categories[0]->category_img)))) }});">
                              <div class="text px-3 py-1">
                                  <h2 class="mb-0"><a href="{{ route('shops.show', 1) }}">Fruits</a></h2>
                              </div>
                          </div>
                          <div class="category-wrap ftco-animate img d-flex align-items-end" style="background-image: url({{ asset('storage/'.(str_replace('\\', '/', ($categories[1]->category_img)))) }});">
                              <div class="text px-3 py-1">
                                  <h2 class="mb-0"><a href="{{ route('shops.show', 2) }}">Vegetables</a></h2>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>

              <div class="col-md-4">
                  <div class="category-wrap ftco-animate img mb-4 d-flex align-items-end" style="background-image: url({{ asset('storage/'.(str_replace('\\', '/', ($categories[2]->category_img)))) }});">
                      <div class="text px-3 py-1">
                          <h2 class="mb-0"><a href="{{ route('shops.show', 3) }}">Herbs</a></h2>
                      </div>
                  </div>
                  <div class="category-wrap ftco-animate img d-flex align-items-end" style="background-image: url({{ asset('storage/'.(str_replace('\\', '/', ($categories[3]->category_img)))) }});">
                      <div class="text px-3 py-1">
                          <h2 class="mb-0"><a href="{{ route('shops.show', 4) }}">Dates</a></h2>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </section>

<section class="ftco-section">
  <div class="container">
          <div class="row justify-content-center mb-3 pb-3">
    <div class="col-md-12 heading-section text-center ftco-animate">
        <span class="subheading">Featured Products</span>
      <h2 class="mb-4">Our Products</h2>
      <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p>
    </div>
  </div>
  </div>
  <div   class="container">
      <div class="row">
          @foreach ($featureProducts as $product)


          <div id="{{$product->id}}" class="col-md-6 col-lg-3 ftco-animate">
            <div class="product">
                <a href="{{ route('products.show', $product->id) }}" class="img-prod"><img class="img-fluid" style="height:300px"
                        src="{{ asset('storage/'.(str_replace('\\', '/', ($product->product_img)))) }}" alt="Colorlib Template">
                        @if ($product->sale_status_id === 1)
                        <span class="status">{{ round(((($product->product_price-$product->product_price_on_sale)/$product->product_price)*100),2) }}%</span>
                        @endif
                    <div class="overlay"></div>
                </a>
                <div class="text py-3 pb-4 px-3 text-center">
                    <h3><a href="#">{{ $product->product_name }}</a></h3>
                    {{-- <p><a href="#">{{ str_replace('<p>', '',substr(($product->product_description),0,30) )}}</a></p> --}}
                    <div class="d-flex">
                        <div class="pricing">
                            <p class="price"><span class="mr-2 @if ($product->sale_status_id === 1) price-dc @endif">{{ $product->product_price }}JD/kilo</span>
                                @if ($product->sale_status_id === 1)
                                <span class="price-sale">{{ $product->product_price_on_sale }}JD/kilo</span>
                            </p>
                                @endif
                        </div>
                    </div>
                    <div class="bottom-area d-flex px-3">
                        <div class="m-auto d-flex">
                            <a href="{{ route('products.show', $product->id) }}"
                                class="add-to-cart d-flex justify-content-center align-items-center text-center">
                                <span><i class="ion-ios-eye"></i></span>
                            </a>
                            <form  action="{{ route('carts.store')}}" method="post">
                                @csrf
                                <input type="hidden" name="product_id" value="{{ $product->id }}"/>
                                <input type="hidden" name="quantity" value="1" />
                                <input type="hidden" name="product_price" value="{{ $product->sale_status_id === 1 ? $product->product_price_on_sale : $product->product_price }}"/>
                                <button type="submit"
                                    class="buy-now d-flex justify-content-center align-items-center mx-1">
                                    <span><i class="ion-ios-cart"></i></span>
                                </button>
                            </form>
                            {{-- <a href="#" class="heart d-flex justify-content-center align-items-center ">
                                <span><i class="ion-ios-heart"></i></span>
                            </a> --}}
                        </div>
                    </div>
                </div>
            </div>
        </div>
          @endforeach
      </div>
  </div>
</section>

  <section class="ftco-section img" style="background-image: url(images/bg_3.jpg);">
  <div class="container">
          <div class="row justify-content-end">
    <div class="col-md-6 heading-section ftco-animate deal-of-the-day ftco-animate">
        <span class="subheading">Best Price For You</span>
      <h2 class="mb-4">Everyday we have Deals</h2>
      <p>Our fresh Products are always at your fingertips</p>
      <h3> <button type="button" class="btn btn-success" data-toggle="modal" data-target="#discountModal"  style = " background-color: #82ae46; color :white;">
        Show Coupon
      </button></h3>

      {{-- <span class="price">$10 <a href="#">now $5 only</a></span> --}}
      {{-- <div id="timer" class="d-flex mt-5">
                    <div class="time" id="days"></div>
                    <div class="time pl-3" id="hours"></div>
                    <div class="time pl-3" id="minutes"></div>
                    <div class="time pl-3" id="seconds"></div>
                  </div> --}}
    </div>
  </div>


  <div class="modal fade" id="discountModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-body text-center">
          <div class="icon text-danger">
            <img src="images/grunge-limited.png" width="50%">
          </div>
          <div class="notice">
            <h4>Get {{ $coupons->percent_off }}% Discount</h4>
            {{-- <p>For the next 24 hours you can get any product at half-price.</p> --}}

            <p>Use promo code {{ $coupons->percent_off }}%-OFF at checkout.</p>
          </div>
          <div class="code" style="font-size: 19px;" >promo code :<span style="color:#82ae46;" >{{ $coupons->code }}</span></div><br><br>
          @if (Session::has('user') || Session::has('admin'))
          <span></span>
          @else
          <span style="color:brown;" >You Have to <a href="{{ route('login') }}">Login</a> , To benefit from the discount !</span>
          @endif

        </div>

      </div>
    </div>
  </div>


  </div>
</section>

<section class="ftco-section">
    <div class="container">
            <div class="row justify-content-center mb-3 pb-3">
      <div class="col-md-12 heading-section text-center ftco-animate">
          <span class="subheading">On Sales Products</span>
        <h2 class="mb-4">Our Products</h2>
        <p>Our fresh Products are always at your fingertips</p>
      </div>
    </div>
    </div>
    <div class="container">
        <div class="row">
            @foreach ($onsalesProducts as $product)


            <div id="{{$product->id}}" class="col-md-6 col-lg-3 ftco-animate">
              <div class="product">
                  <a href="{{ route('products.show', $product->id) }}" class="img-prod"><img class="img-fluid" style="height:300px"
                          src="{{ asset('storage/'.(str_replace('\\', '/', ($product->product_img)))) }}" alt="Colorlib Template">
                          @if ($product->sale_status_id === 1)
                          <span class="status">{{ round(((($product->product_price-$product->product_price_on_sale)/$product->product_price)*100),2) }}%</span>
                          @endif
                      <div class="overlay"></div>
                  </a>
                  <div class="text py-3 pb-4 px-3 text-center">
                      <h3><a href="#">{{ $product->product_name }}</a></h3>
                      {{-- <p><a href="#">{{ str_replace('<p>', '',substr(($product->product_description),0,30) )}}</a></p> --}}
                      <div class="d-flex">
                          <div class="pricing">
                              <p class="price"><span class="mr-2 @if ($product->sale_status_id === 1) price-dc @endif">{{ $product->product_price }}JD/kilo</span>
                                  @if ($product->sale_status_id === 1)
                                  <span class="price-sale">{{ $product->product_price_on_sale }}JD/kilo</span>
                              </p>
                                  @endif
                          </div>
                      </div>
                      <div class="bottom-area d-flex px-3">
                          <div class="m-auto d-flex">
                              <a href="{{ route('products.show', $product->id) }}"
                                  class="add-to-cart d-flex justify-content-center align-items-center text-center">
                                  <span><i class="ion-ios-eye"></i></span>
                              </a>
                              <form action="{{ route('carts.store')}}" method="post">
                                @csrf
                                <input type="hidden" name="product_id" value="{{ $product->id }}"/>
                                <input type="hidden" name="quantity" value="1" />
                                <input type="hidden" name="product_price" value="{{ $product->sale_status_id === 1 ? $product->product_price_on_sale : $product->product_price }}"/>
                                <button type="submit" id="addToCart2"
                                    class="buy-now d-flex justify-content-center align-items-center mx-1">
                                    <span><i class="ion-ios-cart"></i></span>
                                </button>
                            </form>
                              {{-- <a href="#" class="heart d-flex justify-content-center align-items-center ">
                                  <span><i class="ion-ios-heart"></i></span>
                              </a> --}}
                          </div>
                      </div>
                  </div>
              </div>
          </div>
            @endforeach
        </div>
    </div>
  </section>

{{-- <section class="ftco-section testimony-section">
<div class="container">
  <div class="row justify-content-center mb-5 pb-3">
    <div class="col-md-7 heading-section ftco-animate text-center">
        <span class="subheading">Testimony</span>
      <h2 class="mb-4">Our satisfied customer says</h2>
      <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in</p>
    </div>
  </div>
  <div class="row ftco-animate">
    <div class="col-md-12">
      <div class="carousel-testimony owl-carousel">
        <div class="item">
          <div class="testimony-wrap p-4 pb-5">
            <div class="user-img mb-5" style="background-image: url(images/person_1.jpg)">
              <span class="quote d-flex align-items-center justify-content-center">
                <i class="icon-quote-left"></i>
              </span>
            </div>
            <div class="text text-center">
              <p class="mb-5 pl-4 line">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
              <p class="name">Garreth Smith</p>
              <span class="position">Marketing Manager</span>
            </div>
          </div>
        </div>
        <div class="item">
          <div class="testimony-wrap p-4 pb-5">
            <div class="user-img mb-5" style="background-image: url(images/person_2.jpg)">
              <span class="quote d-flex align-items-center justify-content-center">
                <i class="icon-quote-left"></i>
              </span>
            </div>
            <div class="text text-center">
              <p class="mb-5 pl-4 line">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
              <p class="name">Garreth Smith</p>
              <span class="position">Interface Designer</span>
            </div>
          </div>
        </div>
        <div class="item">
          <div class="testimony-wrap p-4 pb-5">
            <div class="user-img mb-5" style="background-image: url(images/person_3.jpg)">
              <span class="quote d-flex align-items-center justify-content-center">
                <i class="icon-quote-left"></i>
              </span>
            </div>
            <div class="text text-center">
              <p class="mb-5 pl-4 line">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
              <p class="name">Garreth Smith</p>
              <span class="position">UI Designer</span>
            </div>
          </div>
        </div>
        <div class="item">
          <div class="testimony-wrap p-4 pb-5">
            <div class="user-img mb-5" style="background-image: url(images/person_1.jpg)">
              <span class="quote d-flex align-items-center justify-content-center">
                <i class="icon-quote-left"></i>
              </span>
            </div>
            <div class="text text-center">
              <p class="mb-5 pl-4 line">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
              <p class="name">Garreth Smith</p>
              <span class="position">Web Developer</span>
            </div>
          </div>
        </div>
        <div class="item">
          <div class="testimony-wrap p-4 pb-5">
            <div class="user-img mb-5" style="background-image: url(images/person_1.jpg)">
              <span class="quote d-flex align-items-center justify-content-center">
                <i class="icon-quote-left"></i>
              </span>
            </div>
            <div class="text text-center">
              <p class="mb-5 pl-4 line">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
              <p class="name">Garreth Smith</p>
              <span class="position">System Analyst</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</section> --}}

<hr>

  <section class="ftco-section ftco-partner">
      <h2 class="text-center mb-5">Our Partners</h2>
  <div class="container">
      <div class="row">
          <div class="col-sm ftco-animate">
              <a href="#" class="partner"><img src="images/partner-1.png" class="img-fluid" alt="Colorlib Template"></a>
          </div>
          <div class="col-sm ftco-animate">
              <a href="#" class="partner"><img src="images/partner-2.png" class="img-fluid" alt="Colorlib Template"></a>
          </div>
          <div class="col-sm ftco-animate">
              <a href="#" class="partner"><img src="images/partner-3.png" class="img-fluid" alt="Colorlib Template"></a>
          </div>
          <div class="col-sm ftco-animate">
              <a href="#" class="partner"><img src="images/partner-4.png" class="img-fluid" alt="Colorlib Template"></a>
          </div>
          <div class="col-sm ftco-animate">
              <a href="#" class="partner"><img src="images/partner-5.png" class="img-fluid" alt="Colorlib Template"></a>
          </div>
      </div>
  </div>
</section>

  {{-- <section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
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
</section> --}}


@endsection

