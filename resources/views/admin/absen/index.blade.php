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
<br>

    <div id="timer">
    <a href="" type="button" class="btn btn-secondary">
        <i class="fa-fw fas fa-users nav-icon">

        </i><span>Absen Masuk</span>
        </a>
    </div>
    

    

    
</div>


@endsection
@section('scripts')


@parent

<script type="text/javascript">
    function configure2(){
        Webcam.set({
            width: 400,
            height: 300,
            image_format: 'jpeg',
            jpeg_quality: 90
        });

        Webcam.attach('#aku_camera')
    }

    
</script>

<script>
    function switchWorkStatus(data) {
        let $timer = $("#timer span");
        let text = $timer.text() == 'Absen Pulang' ? 'Absen Masuk' : 'Absen Pulang';
        $timer.text(text);
    
        Swal.fire({
            title: 'Success!',
            text: data.status,
            icon: 'success'
        })
    }
    
    $(function() {
        $.get("{{ route('admin.time-entries.showCurrent') }}", function (data) {
            if(data.timeEntry != null) {
                switchWorkStatus();
            }
        });
    
        $('#timer').click(function () {
            $.ajax({
                method: "POST",
                url: "{{ route('admin.time-entries.updateCurrent') }}",
                data: {
                    _token
                },
                success: (data) => switchWorkStatus(data),
                error: () => window.location.reload()
            });
        });
    });
    </script>

@endsection

