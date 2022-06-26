@extends('./layouts.master')
@section('title', 'Profile')
@section('content')

<div class="container my-5">
    <div class="row flex-lg-nowrap">
      <div class="col-12 col-lg-auto mb-3" style="width: 200px;">

      </div>

      <div class="col">
        <div class="row">
          <div class="col mb-3">
            <div class="card">
              <div class="card-body">
                <div class="e-profile">
                  <div class="row">
                    <div class="col-12 col-sm-auto mb-3">
                      <div class="mx-auto" style="width: 140px;">
                        <div class="d-flex justify-content-center align-items-center rounded" style="height: 140px; background-color: rgb(233, 236, 239);">
                          <span style="color: rgb(166, 168, 170); font: bold 8pt Arial;"><img class="card-img-top" src="./admin/users/images/"></span>

                        </div>
                      </div>
                    </div>
                    <div class="col d-flex flex-column flex-sm-row justify-content-between mb-3">
                      <div class="text-center text-sm-left mb-2 mb-sm-0">
                      <form class="form" method="post" action="./edit.php" enctype="multipart/form-data" >

                        <div class="mt-2">
                          <button class="btn btn-primary" type="button" style="">

                            <i class="fa fa-fw fa-camera"></i>

                            <input type="hidden" name="userimage" value ="">
                            <input type="file" name="image" value ="">
                          </button>

                        </div>
                      </div>
                      <div class="text-center text-sm-right">
                        <span class="badge badge-secondary">users</span>

                      </div>
                    </div>
                  </div>
                  <ul class="nav nav-tabs">
                    <li class="nav-item"><a href="" class="active nav-link">Settings</a></li>
                  </ul>
                  <div class="tab-content pt-3">
                    <div class="tab-pane active">


                        <div class="row">
                          <div class="col">
                            <div class="row">
                              <div class="col">
                                <div class="form-group">
                                  <label class="text-primary">Full Name</label>
                                  <input class="form-control" type="text" name="name" placeholder="" value="">
                                  <span class="error" style= "color:red;"></span>
                                  </br>
                                </div>
                              </div>

                            </div>
                            <div class="row">
                              <div class="col">
                                <div class="form-group">
                                  <label class="text-primary">Email</label>
                                  <input class="form-control" type="email" placeholder="" name="email" value="">
                                  <span class="error" style= "color:red;"></span>
                                  </br>
                                </div>
                              </div>
                            </div>
                            <div class="row">
                              <div class="col">
                                <div class="form-group">
                                  <label class="text-primary">Phone</label>
                                  <input class="form-control" type="text" placeholder="" name="phone" value="">
                                  <span class="error" style= "color:red;"></span></div>
                                  </br>
                                </div>
                            </div>
                            <div class="row">
                              <div class="col">
                                <div class="form-group">
                                  <label class="text-primary">Address</label>
                                  <input class="form-control" type="text" name="address" placeholder="" value="">
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>

                      </br>
                        <div class="row">
                          <div class="col d-flex justify-content-end">
                            <button class="btn btn-primary" type="submit" name="update" style=";margin-right:10px;">Save Changes</button>
                            </form>
                            <form action="" method="post">
                            <a href=""><button class="btn btn-primary" name="orders" type="submit" style="">Show orders</button></a>
                            </form>
                          </div>
                        </div>


                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="col-12 col-md-3 mb-3">
            <div class="card mb-3">
              <div class="card-body">
                <div class="px-xl-3">
                  <a class="btn btn-block btn-secondary" href="index.php?status=logout">
                    <i class="fa fa-sign-out"></i>
                    <span>Logout</span>
                </a>
                </div>
              </div>
            </div>
            <div class="card">
              <div class="card-body">
                <h6 class="card-title font-weight-bold">Support</h6>
                <p class="card-text">Get fast, free help from our friendly assistants.</p>
                <button type="button" class="btn btn-block btn-secondary" style=""><a href="/contact" style="color:white">Contact Us</a></button>
              </div>
            </div>
          </div>
        </div>

      </div>
      <?php

      ?>
    </div>
    </div>

@endsection
