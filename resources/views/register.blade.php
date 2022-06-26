@extends('./layouts.master')

@section('content')

{{-- <!DOCTYPE html>
<html lang="en">
<head>
	<title>Login V15</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="Loginstyle/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Loginstyle/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Loginstyle/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Loginstyle/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Loginstyle/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Loginstyle/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Loginstyle/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Loginstyle/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Loginstyle/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Loginstyle/css/util.css">
	<link rel="stylesheet" type="text/css" href="Loginstyle/css/main.css">
<!--===============================================================================================-->
<style>

    .container-login100{
    /* background-image: url(images/category-1.jpg); */
    background-repeat: no-repeat;
    background-size: cover;
    }
    .login100-form-btn{
        background-color:#82ae46;
    }
</style>
</head>
<body>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-form-title" style="background-image: url(images/bg_2.jpg);">
					<span class="login100-form-title-1">
						Sign In
					</span>
				</div>

				<form class="login100-form validate-form">
					<div class="wrap-input100 validate-input m-b-26" data-validate="Username is required">
						<span class="label-input100">Username</span>
						<input class="input100" type="text" name="username" placeholder="Enter username">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-26" data-validate="Username is required">
						<span class="label-input100">Email</span>
						<input class="input100" type="text" name="username" placeholder="example@gmail.com">
						<span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-26" data-validate="Username is required">
						<span class="label-input100">Phone</span>
						<input class="input100" type="text" name="username" placeholder="07xxxxxxxx">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
						<span class="label-input100">Password</span>
						<input class="input100" type="password" name="pass" placeholder="Enter password">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
						<span class="label-input100">Repeat Password</span>
						<input class="input100" type="password" name="pass" placeholder="Enter password">
						<span class="focus-input100"></span>
					</div>


					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							Register
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>

<!--===============================================================================================-->
	<script src="Loginstyle/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="Loginstyle/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="Loginstyle/vendor/bootstrap/js/popper.js"></script>
	<script src="Loginstyle/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="Loginstyle/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="Loginstyle/vendor/daterangepicker/moment.min.js"></script>
	<script src="Loginstyle/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="Loginstyle/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="Loginstyle/js/main.js"></script>

</body>
</html> --}}


<style>
    .mouse {
        display: none;
    }

    .loginsection {
        background-image: url(images/hero-bg.jpg);
        background-repeat:no-repeat;
        background-size: cover;
        color: #000;

    }
    label:not(.form-check-label) {
        font-size: 1.7em;
        /* color: #82ae46; */
    }
</style>

<section class=" mb-5 loginsection">
    <div class="container-fluid h-custom  ">
        <div class="row d-flex justify-content-center align-items-center ">
          {{-- <div class="col-md-9 col-lg-6 col-xl-5">
            <img src="images/category-1.jpg"
              class="img-fluid" alt="Sample image">
          </div> --}}
          <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1 my-5">
            <form method="POST" action=''>
              @method('POST')
              @csrf
              <!-- Username input -->
              <div class="form-outline mb-4">
                  <label class="form-label" for="form3Example1">Username</label>
                <input type="email" name='name' value='{{ old('email') }}' id="form3Example1" class="form-control form-control-lg"
                  placeholder="Enter a valid username" />
                @error('name')
                <div class="text-danger fw-bolder"></div>
                @enderror
              </div>
              <!-- Email input -->
              <div class="form-outline mb-4">
                  <label class="form-label" for="form3Example2">Email address</label>
                <input type="email" name='email' value='{{ old('email') }}' id="form3Example2" class="form-control form-control-lg"
                  placeholder="example@gmail.com" />
                @error('email')
                <div class="text-danger fw-bolder"></div>
                @enderror
              </div>
              <!-- Phone input -->
              <div class="form-outline mb-4">
                  <label class="form-label" for="form3Example3">Phone</label>
                <input type="email" name='phone' value='{{ old('email') }}' id="form3Example3" class="form-control form-control-lg"
                  placeholder="07xxxxxxxx" />
                @error('phone')
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
              <!-- Repeat Password input -->
              <div class="form-outline mb-3">
                  <label class="form-label" for="form3Example5">Repeat Password</label>
                <input type="password" name='password' id="form3Example5" class="form-control form-control-lg"
                  placeholder="Enter password" />
                  @error('password')
                  <div class="text-danger fw-bolder"></div>
              @enderror
              </div>

              <div class="d-flex justify-content-between align-items-center">
                <!-- Checkbox -->
                <div class="form-check mb-0">
                    <input class="form-check-input me-2" type="checkbox" value=""
                    id="form2Example3c" />
                <label class="form-check-label" for="form2Example3c">
                    I agree all statements in <a href="#!">Terms of service</a>
                </label>
                </div>
                <a href="#!" class="text-body">Forgot password?</a>
              </div>

              <div class="text-center text-lg-start mt-4 pt-2">
                <button type="submit" class="btn btn-primary btn-lg"
                  style="padding-left: 2.5rem; padding-right: 2.5rem;">Register</button>
                <p class="fw-bold mt-2 pt-1 mb-0">Already have an account? <a href="/login"
                    class="link-danger">Login</a></p>
              </div>

            </form>
          </div>
        </div>
      </div>

    </section>




@endsection

