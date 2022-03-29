@extends('layouts.admin')
@section('content')
<div class="content">
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    Dashboard
                </div>

                <div class="card-body">
                    @if(session('status'))
                    <div class="alert alert-success" role="alert">
                        {{ session('status') }}
                    </div>
                    @endif

                    <h4>Selamat datang di Absensi</h4>
                    <h3 style="font-weight: bold;">PT. Top Indo Maju</h3>
                </div>

                <center>
                <div class="card border-dark mb-3" style="max-width: 18rem;">
                    <div class="card-header">{{ Auth::user()->name }}</div>
                    <div class="card-body text-dark">
                      <h5 class="card-title">{{ Auth::user()->jabatan }}</h5>
                      <p class="card-text">{{ Auth::user()->outlet }}</p>
                    </div>
                  </div>
                </center>

                 

            </div>
        </div>
    </div>
   

</div>
@endsection
@section('scripts')
@parent

@endsection