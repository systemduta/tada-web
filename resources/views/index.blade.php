<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Maesa | Customer Retention Admin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" />
    <meta name="description" content="Maesa Customer retention admin">
    <meta name="msapplication-tap-highlight" content="no">
{{--    <link href="{{url('layout_assets/css/main.css')}}" rel="stylesheet">--}}
{{--    <link href="{{url('layout_assets/css/auth_style.css')}}" rel="stylesheet">--}}
{{--    <script src="{{url('assets/js/axios.min.js')}}"></script>--}}
</head>
<body style="background-color: lavender;">
    <div id="app" style="height: 100%;">
        <layout></layout>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="{{  URL::asset('js/app.js') }}"></script>
    <script type="text/javascript" src="{{url('layout_assets/js/main.js')}}"></script>
</body>
</html>
