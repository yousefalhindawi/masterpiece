<!DOCTYPE html>
<html lang="en">

<head>
    <title>@yield('title')</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" href='{{ asset('images/bg_2.jpg') }}' type="image/png" />
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
        rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">
    {{-- <script src="//unpkg.com/alpinejs" defer></script> --}}

    <link rel="stylesheet" href="{{ url('css/open-iconic-bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ url('css/animate.css') }}">

    <link rel="stylesheet" href="{{ url('css/owl.carousel.min.css') }}">
    <link rel="stylesheet" href="{{ url('css/owl.theme.default.min.css') }}">
    <link rel="stylesheet" href="{{ url('css/magnific-popup.css') }}">

    <link rel="stylesheet" href="{{ url('css/aos.css') }}">

    <link rel="stylesheet" href="{{ url('css/ionicons.min.css') }}">

    <link rel="stylesheet" href="{{ url('css/bootstrap-datepicker.css') }}">
    <link rel="stylesheet" href="{{ url('css/jquery.timepicker.css') }}">


    <link rel="stylesheet" href="{{ url('css/flaticon.css') }}">
    <link rel="stylesheet" href="{{ url('css/icomoon.css') }}">
    <link rel="stylesheet" href="{{ url('css/style.css') }}">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
        integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />





    <style>
        .nav-link {
            font-size: 1em !important;
        }

        .nav-item .active {
            color: #82ae46 !important;

        }
    </style>
</head>

<body class="goto-here">
    <div class="py-1 bg-primary">
        <div class="container">
            <div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
                <div class="col-lg-12 d-block">
                    <div class="row d-flex">
                        <div class="col-md pr-4 d-flex topper align-items-center">
                            <div class="icon mr-2 d-flex justify-content-center align-items-center"><span
                                    class="icon-phone2"></span></div>
                            <span class="text">+962790640416</span>
                        </div>
                        <div class="col-md pr-4 d-flex topper align-items-center">
                            <div class="icon mr-2 d-flex justify-content-center align-items-center"><span
                                    class="icon-paper-plane"></span></div>
                            <span class="text">yousefalhindawe@gmail.com</span>
                        </div>
                        <div class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
                            <span class="text">3-5 Business days delivery &amp; Free Returns</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
        <div class="container">
            <a class="navbar-brand" href="{{ route('home') }}">Vegefoods</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
                aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="oi oi-menu"></span> Menu
            </button>

            <div class="collapse navbar-collapse" id="ftco-nav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a href="/"
                            class="nav-link {{ Request::is('/') ? 'active' : '' }}">Home</a></li>

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle " href="#" id="dropdown04" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">Shop</a>
                                <div class="dropdown-menu" aria-labelledby="dropdown04">
                                    <a class="dropdown-item" href="{{ route('shops') }}">Shop</a>
                                    @foreach ($categories as $category)
                                    <a class="dropdown-item" href="{{ route('shops.show', $category->id) }}">{{ $category->category_name }}</a>
                                    @endforeach
                            {{-- <a class="dropdown-item" href="/product-single">Single Product</a> --}}
                            {{-- <a class="dropdown-item" href="/cart">Cart</a> --}}
                            <a class="dropdown-item" href="/checkout">Checkout</a>
                        </div>
                    </li>
                    <li class="nav-item "><a href="/about"
                            class="nav-link {{ Request::is('about') ? 'active' : '' }}">About</a></li>
                    {{-- <li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li> --}}
                    <li class="nav-item "><a href="/contact"
                            class="nav-link {{ Request::is('contact') ? 'active' : '' }}">Contact</a></li>

                            @if (Session::has('user') || Session::has('admin'))
                    <li class="nav-item cta cta-colored"><a href="{{ route('carts.index') }}" class="nav-link"><span
                                class="icon-shopping_cart"></span>[{{ $cartCount }}]</a></li>
                                @endif
                    @if ($user = Session::get('user'))
                        <li class="nav-item">
                            <a href="{{ route('users.edit', $user->id) }}" class="icons nav-link {{ Request::is('users/{user}/edit') ? 'active' : '' }}">
                                <i class="fa-solid fa-user" style="font-size:1.2em"></i>
                            </a>
                        </li>
                    @endif
                    @if (Session::has('user') || Session::has('admin'))
                        <li class="nav-item"><a href="{{ route('logout') }}"
                                class="nav-link {{ Request::is('logout') ? 'active' : '' }}">Logout</a></li>
                    @else
                        <li class="nav-item "><a href="{{ route('login') }}"
                                class="nav-link {{ Request::is('login') ? 'active' : '' }}">Login</a></li>
                        <li class="nav-item"><a href="{{ route('register') }}"
                                class="nav-link {{ Request::is('register') ? 'active' : '' }}">Register</a></li>
                    @endif
                    @if (Session::has('admin'))
                        <li class="nav-item"><a href="{{ route('dashboard') }}"
                                class="nav-link {{ Request::is('dashboard') ? 'active' : '' }}">Admin</a></li>
                    @endif
                </ul>
            </div>
        </div>
    </nav>
    <!-- END nav -->
