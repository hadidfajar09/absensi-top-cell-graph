@extends('layouts.admin')
@section('content')
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    Izin Form
                </div>

                <div class="box-body">
                    <div class="table-responsive col-md-6">
                     <form action="#" method="post" enctype="multipart/form-data">
                       @csrf
                       <br><br>
                                   <div class="form-group">
                                       <h5>Alasan Izin<span class="text-danger">*</span></h5>
                                       <div class="controls">
                                           <input type="text" name="coupon_name" id="coupon_name" class="form-control" value="{{ old('coupon_name') }}">
                                         
                                       </div>
                                   </div>
   
                                   <div class="form-group">
                                    <h5>Bukti<span class="text-danger" style="font-size: 10px;">*Opsional</span></h5>
                                      <div class="custom-file">
                                        <input type="file" class="custom-file-input" name="product_thumbnail" id="product_thumbnail" onchange="mainThumbnail(this)" required="">
                                        <label class="custom-file-label" for="customFile">Choose Image</label>
                                        <img src="" alt="" id="mainThumb">
                                      </div>
                                  </div>
   
                                  <div class="form-group">
                                    <h5>Durasi<span class="text-danger" style="font-size: 10px;">*</span></h5>
                                    <input class="form-control datetime {{ $errors->has('time_start') ? 'is-invalid' : '' }}" type="text" name="time_start" id="time_start" required>
                                    @if($errors->has('time_start'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('time_start') }}
                                        </div>
                                    @endif
                                </div>
   
   
                           <div class="text-xs-right">
                               <input type="submit" class="btn btn-rounded btn-info mb-5" value="Kirim">
                            </div>
                        
                      </form>
                    </div>
                </div>


            </div>
        </div>
    </div>
@endsection
@section('scripts')
@parent

@endsection