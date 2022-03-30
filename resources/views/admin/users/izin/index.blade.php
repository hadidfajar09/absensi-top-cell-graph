@extends('layouts.admin')
@section('content')

<div class="card">
    <div class="card-header">
        Form Izin
    </div>

    <div class="card-body">
        <form method="POST" action="{{ route("admin.users.izin.store") }}" enctype="multipart/form-data">
            @csrf
            <div class="form-group">
                <label class="required" for="alasan">Alasan</label>
                <input class="form-control {{ $errors->has('name') ? 'is-invalid' : '' }}" type="text" name="alasan" id="alasan" value="{{ old('alasan', '') }}" required>
                @if($errors->has('alasan'))
                    <div class="invalid-feedback">
                        {{ $errors->first('alasan') }}
                    </div>
                @endif
                <span class="help-block">{{ trans('cruds.user.fields.name_helper') }}</span>
            </div>
        
            
            <div class="form-group">
                <label class="required" for="rentang">Sampai</label>
                <input class="form-control {{ $errors->has('rentang') ? 'is-invalid' : '' }}" type="date" name="rentang" id="rentang" min="{{ Carbon\Carbon::now()->format('Y-m-d') }}">
                @if($errors->has('rentang'))
                    <div class="invalid-feedback">
                        {{ $errors->first('rentang') }}
                    </div>
                @endif
                <span class="help-block">{{ trans('cruds.timeEntry.fields.time_end_helper') }}</span>
            </div>

            <div class="form-group">
                <label for="outlet">Bukti (opsional)</label>
                <input class="form-control {{ $errors->has('outlet') ? 'is-invalid' : '' }}" type="file" name="bukti" id="bukti">
                @if($errors->has('bukti'))
                    <div class="invalid-feedback">
                        {{ $errors->first('bukti') }}
                    </div>
                @endif
                
            </div>

       
            <div class="form-group">
                <button class="btn btn-danger" type="submit">
                    Kirim
                </button>
            </div>
        </form>
    </div>
</div>



@endsection