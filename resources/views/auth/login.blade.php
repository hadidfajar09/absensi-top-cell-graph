@extends('layouts.app')
@section('content')
<div class="row justify-content-center">
    <div class="col-md-6">
        <div class="card mx-4">
            <div class="card-body p-4">
                <h1>Login PT. Top Indo Maju</h1>

                <p class="text-muted">{{ trans('global.login') }}</p>

                @if(session('message'))
                <div class="alert alert-info" role="alert">
                    {{ session('message') }}
                </div>
                @endif

                <form method="POST" action="{{ route('login') }}">
                    @csrf

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <i class="fa fa-user"></i>
                            </span>
                        </div>

                        <input id="email" name="email" type="text"
                            class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" required
                            autocomplete="email" autofocus placeholder="{{ trans('global.login_email') }}"
                            value="{{ old('email', null) }}">

                        @if($errors->has('email'))
                        <div class="invalid-feedback">
                            {{ $errors->first('email') }}
                        </div>
                        @endif
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fa fa-lock"></i></span>
                        </div>

                        <input id="password" name="password" type="password"
                            class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" required
                            placeholder="{{ trans('global.login_password') }}">

                        @if($errors->has('password'))
                        <div class="invalid-feedback">
                            {{ $errors->first('password') }}
                        </div>
                        @endif
                    </div>



                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fa fa-camera"></i></span>
                        </div>

                        <div id="my_camera">

                        </div>

                        <div id="result">

                        </div>


                    </div>


                    <div class="input-group mb-4">
                        <div class="form-check checkbox">
                            <input class="form-check-input" name="remember" type="checkbox" id="remember"
                                style="vertical-align: middle;" />
                            <label class="form-check-label" for="remember" style="vertical-align: middle;">
                                {{ trans('global.remember_me') }}
                            </label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-6">
                            <button type="submit" class="btn btn-primary px-4">
                                {{ trans('global.login') }}
                            </button>
                        </div>
                        <div class="col-6 text-right">
                            @if(Route::has('password.request'))
                            <a class="btn btn-link px-0" href="{{ route('password.request') }}">
                                {{ trans('global.forgot_password') }}
                            </a><br>
                            @endif

                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

@endsection

@section('scripts')

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/webcamjs/1.0.26/webcam.min.js"></script>

<script type="text/javascript">
    function configure(){
        Webcam.set({
            width: 400,
            height: 360,
            image_format: 'jpeg',
            jpeg_quality: 90
        });

        Webcam.attach('#my_camera')
    }
</script>
@endsection