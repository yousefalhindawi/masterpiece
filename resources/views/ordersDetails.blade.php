@extends('./layouts.master')
@section('title', 'orders details')

@section('content')

<div class="container">
    <h3>Your order</h3>
    <br>
    <table class="table table-striped table-hover border border-secoundry">
        <thead>
            <tr>
                <!-- <th scope="col">Name </th> -->
                <!-- <th scope="col">Order Date</th> -->
                <th scope="col">Address</th>
                <th scope="col">Phone</th>
                <th scope="col">Item Name</th>
                <th scope="col">Item Price</th>
                <th scope="col">Quantity</th>
                <th scope="col">Sub Total</th>
            </tr>
        </thead>
        <tbody>


          @foreach($orders as $order)




                <tr scope="row">
                    <td>{{ $order->address }}</td>
                    <td>{{ $order->phone }}</td>
                    <td>{{ $order->product_name }}</td>
                    <td>{{ $order->product_sub_total }}JD</td>
                    <td>{{ $order->product_quantity }}kilo</td>
                    <td>{{ ($order->product_quantity )*($order->product_sub_total)}}kilo</td>

                </tr>
               @endforeach


            <tr scope="row" >

                <p class="h3 text-dark">Order Total Amount : {{ $order->order_total_price }} JD</p>
                {{-- <p class="h3 text-dark">Order Total Amount : {{ $order->order_total_amount }} JOD</p> --}}
               </tr>
            <tr scope="row" >

                <p class="h5">Order Date : {{ $order->created_at }}</p>
               </tr>
        </tbody>
      </table>
</div>

@endsection
