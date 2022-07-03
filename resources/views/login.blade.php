@extends('./layouts.master')
@section('title', 'Login')
@section('content')
    <style>
        .mouse {
            display: none;
        }

        .loginsection {
            background-image: url(images/hero-bg.jpg);
            background-repeat: no-repeat;
            background-size: cover;
            color: #000;

        }

        label:not(.form-check-label) {
            font-size: 1.7em;
            /* color: #82ae46; */
        }
    </style>


    <section class="vh-100 mb-5 loginsection">
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
        <div class="container-fluid h-custom  h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                {{-- <div class="col-md-9 col-lg-6 col-xl-5">
        <img src="images/category-1.jpg"
          class="img-fluid" alt="Sample image">
      </div> --}}
                <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                    <form method="POST" action='{{ route('users.Authenticate') }}'>
                        @method('POST')
                        @csrf
                        <!-- Email input -->
                        <div class="form-outline mb-4">
                            <label class="form-label" for="form3Example3">Email address</label>
                            <input type="email" name='email' value='{{ old('email') }}' id="form3Example3"
                                class="form-control form-control-lg" placeholder="Enter a valid email address" autofocus />
                            @error('email')
                                <div class="text-danger fw-bolder"></div>
                            @enderror
                        </div>


                        <!-- Password input -->
                        <div class="form-outline mb-3">
                            <label class="form-label" for="form3Example4">Password</label>
                            <input type="password" name='password' id="form3Example4" class="form-control form-control-lg"
                                placeholder="Enter password" />
                            @error('password')
                                <div class="text-danger fw-bolder"></div>
                            @enderror
                        </div>

                        <div class="d-flex justify-content-between align-items-center">
                            <!-- Checkbox -->
                            <div class="form-check mb-0">
                                <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3" />
                                <label class="form-check-label" for="form2Example3">
                                    Remember me
                                </label>
                            </div>
                            <a href="#!" class="text-body">Forgot password?</a>
                        </div>

                        <div class="text-center text-lg-start mt-4 pt-2">
                            <button type="submit" class="btn btn-primary btn-lg"
                                style="padding-left: 2.5rem; padding-right: 2.5rem;">Login</button>
                            <p class="small fw-bold mt-2 pt-1 mb-0">Don't have an account? <a
                                    href="{{ route('register') }}" class="link-danger">Register</a></p>
                        </div>

                    </form>
                </div>
            </div>
        </div>

    </section>
@endsection
