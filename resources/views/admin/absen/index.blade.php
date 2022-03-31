@extends('layouts.admin')
@section('content')
<div class="content" onload="configure2();">
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    Absen Page
                </div>
                <div class="card-body">
                    <div id="clock" style="font-size: 60px;">123</div>
                </div>
                    

                


            </div>
        </div>
    </div>

    <center>
    
        <div class="image-fluid">

        
        <div id="aku_camera">
    
        </div>
        <br>
        <div id="result">
    
        </div>
    </div>
        
</center>
<br>

    <div id="timer">
    <a href="#" type="button" class="btn btn-secondary" onclick="saveSnap()">
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
            width: 300,
            height: 200,
            image_format: 'jpeg',
            jpeg_quality: 90
        });

        Webcam.attach('#aku_camera');
    }

    function saveSnap(){
        Webcam.snap(function(data_uri){
            document.getElementById('result').innerHTML = 
            '<img id="webcam" src = "'+data_uri+'" style="width: 300px; height: 200px;">';
        });

        Webcam.reset();

        var base64image = document.getElementById("webcam").src;
        // Webcam.upload(base64image, 'function.php', function(code,text){
        //     alert('save success');
        // });

        configure2();


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

