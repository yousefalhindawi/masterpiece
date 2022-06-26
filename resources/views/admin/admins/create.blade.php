
@extends('admin.layout')

@section('content')
<section style="margin-left: 4%;">

     <form method="post" style="margin-left: 2%; margin-right: 2%" enctype="multipart/form-data">

    <div class="form-group my-3">
        <label class="form-label" for='name'>admin name</label>
        <input type="text" id="name" class="form-control" name="admin_name" value = "">
    </div>
    <div class="form-group my-3">
        <label class="form-label" for='email'>admin email</label>
        <input type="email" class="form-control" id="email" name="admin_email" value = "">
    </div>
    <div class="form-group my-3">
        <label class="form-label">admin password</label>
        <input type="password" class="form-control" name="admin_password" value = "">
    </div>
    <div class="mt-4">
    <button type="submit" class="btn btn-primary">Submit</button>
    <a href="/admin/admins" class="btn btn-primary">admin Page</a>
</div>
    </form>
</section>

  
@endsection

