@component('mail::message')
<h1>{{ $mailData['subject'] }}</h1>
<p>From: {{ $mailData['name'] }}</p>
<p>Email: {{ $mailData['email'] }}</p>
<p>message: {{ $mailData['message'] }}</p>

@component('mail::button', ['url' => 'http://127.0.0.1:8000/shops'])
visit our website
@endcomponent

Thanks,<br>
{{ config('app.name') }}
@endcomponent
