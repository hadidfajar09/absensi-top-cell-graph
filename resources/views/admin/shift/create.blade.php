@extends('layouts.admin')
@section('content')

<div class="card">
    <div class="card-header">
        Tambah Shift
    </div>

    <div class="card-body">
        <form method="POST" action="{{ route("admin.users.shift.store") }}" enctype="multipart/form-data">
            @csrf
            <div class="form-group">
                <label class="required" for="nama_shift">Nama Shift</label>
                <input class="form-control {{ $errors->has('shift') ? 'is-invalid' : '' }}" type="text" name="nama_shift" id="nama_shift" value="{{ old('nama_shift', '') }}" required>
                @if($errors->has('nama_shift'))
                    <div class="invalid-feedback">
                        {{ $errors->first('nama_shift') }}
                    </div>
                @endif
                <span class="help-block">{{ trans('cruds.user.fields.name_helper') }}</span>
            </div>
            
            <div class="form-group">
                <label class="required" for="masuk">Masuk</label>
                <input class="form-control {{ $errors->has('masuk') ? 'is-invalid' : '' }}" type="time" name="masuk" id="masuk" value="{{ old('masuk') }}" required>
                @if($errors->has('masuk'))
                    <div class="invalid-feedback">
                        {{ $errors->first('masuk') }}
                    </div>
                @endif
            </div>

            <div class="form-group">
                <label class="required" for="pulang">Pulang</label>
                <input class="form-control {{ $errors->has('pulang') ? 'is-invalid' : '' }}" type="time" name="pulang" id="pulang" value="{{ old('pulang') }}" required>
                @if($errors->has('pulang'))
                    <div class="invalid-feedback">
                        {{ $errors->first('pulang') }}
                    </div>
                @endif
                
            </div>

        
            <div class="form-group">
                <button class="btn btn-danger" type="submit">
                    {{ trans('global.save') }}
                </button>
            </div>
        </form>
    </div>
</div>



@endsection