@extends('./layouts.master')
@section('title', 'orders details')

@section('content')
<div id="notfound">
    <div class="notfound">
        <div class="notfound-404">
            <h1>404</h1>
            <h2>Page not found</h2>
        </div>
        <a href="{{ route('home') }}">Homepage</a>
    </div>
</div>
@endsection

