<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\MassDestroyUserRequest;
use App\Http\Requests\StoreUserRequest;
use App\Http\Requests\UpdateUserRequest;
use App\Izin;
use App\Role;
use App\User;
use Gate;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class UsersController extends Controller
{
    public function index()
    {
        abort_if(Gate::denies('user_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $users = User::all();

        return view('admin.users.index', compact('users'));
    }

    public function create()
    {
        abort_if(Gate::denies('user_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $roles = Role::all()->pluck('title', 'id');

        return view('admin.users.create', compact('roles'));
    }

    public function store(StoreUserRequest $request)
    {
        $user = User::create($request->all());
        $user->roles()->sync($request->input('roles', []));

        return redirect()->route('admin.users.index');
    }

    public function edit(User $user)
    {
        abort_if(Gate::denies('user_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $roles = Role::all()->pluck('title', 'id');

        $user->load('roles');

        return view('admin.users.edit', compact('roles', 'user'));
    }

    public function update(UpdateUserRequest $request, User $user)
    {
        $user->update($request->all());
        $user->roles()->sync($request->input('roles', []));

        return redirect()->route('admin.users.index');
    }

    public function show(User $user)
    {
        abort_if(Gate::denies('user_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $user->load('roles');

        return view('admin.users.show', compact('user'));
    }

    public function destroy(User $user)
    {
        abort_if(Gate::denies('user_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $user->delete();

        return back();
    }

    public function massDestroy(MassDestroyUserRequest $request)
    {
        User::whereIn('id', request('ids'))->delete();

        return response(null, Response::HTTP_NO_CONTENT);
    }

    public function izinPage()
    {
        $izinList = Izin::all();

        return view('admin.izin.index', compact('izinList'));
    }

    public function IzinCreate()
    {

        return view('admin.users.izin.index');
    }

    public function izinStore(Request $request)
    {
        $validasi = $request->validate([
            'alasan' => 'required|max:255',
            'rentang' => 'required|max:255',
            'bukti' => 'image|mimes:jpg,png,jpeg|max:2048',
        ]);

        if($request->file('bukti')){
            $image = $request->file('bukti');
            $name_gen = hexdec(uniqid()).'.'.$image->getClientOriginalExtension();
            $image->storeAs('img/izin/',$name_gen);
            $save_url = 'img/izin/'.$name_gen;


            Izin::insert([
                'user_id' => Auth::user()->id,
                'alasan' => $request->alasan,
                'rentang' => $request->rentang,
                'bukti' => $save_url
            ]);
        }else{
            Izin::insert([
                'user_id' => Auth::user()->id,
                'alasan' => $request->alasan,
                'rentang' => $request->rentang,
            ]);
    
        }
    
        
        return redirect()->route('admin.home');
    }

    public function izinDelete($id)
    {
        
    }
}
