@extends('layouts.admin')
@section('content')
<div class="content" onload="configure2();">
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    Absen Page
                </div>

                <div class="col-md-12">
                    <div class="title m-b-md">
                        <div class="clockStyle" id="clock" style="font-size: 60px;">123</div>
                    </div>

                </div>

                


            </div>
        </div>
    </div>

    <center>
    

        <div id="aku_camera" >
    
        </div>
    
        <div id="result">
    
        </div>
</center>
    <a href="" type="button" class="btn btn-secondary">Absen Masuk</a>
    

    

    
</div>


@endsection
@section('scripts')


@parent

<script type="text/javascript">
    function configure2(){
        Webcam.set({
            width: 400,
            height: 360,
            image_format: 'jpeg',
            jpeg_quality: 90
        });

        Webcam.attach('#aku_camera')
    }

    
</script>


@endsection

