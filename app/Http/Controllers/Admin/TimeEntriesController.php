<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\MassDestroyTimeEntryRequest;
use App\Http\Requests\StoreTimeEntryRequest;
use App\Http\Requests\UpdateTimeEntryRequest;
use App\TimeEntry;
use App\User;
use Gate;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class TimeEntriesController extends Controller
{
    public function index()
    {
        abort_if(Gate::denies('time_entry_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $timeEntries = TimeEntry::all();

        return view('admin.timeEntries.index', compact('timeEntries'));
    }

    public function create()
    {
        abort_if(Gate::denies('time_entry_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $users = User::all()->pluck('name', 'id')->prepend(trans('global.pleaseSelect'), '');

        return view('admin.timeEntries.create', compact('users'));
    }

    public function store(StoreTimeEntryRequest $request)
    {
        $timeEntry = TimeEntry::create($request->all());

        return redirect()->route('admin.time-entries.index');
    }

    public function edit(TimeEntry $timeEntry)
    {
        abort_if(Gate::denies('time_entry_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $users = User::all()->pluck('name', 'id')->prepend(trans('global.pleaseSelect'), '');

        $timeEntry->load('user');

        return view('admin.timeEntries.edit', compact('users', 'timeEntry'));
    }

    public function update(UpdateTimeEntryRequest $request, TimeEntry $timeEntry)
    {
        $timeEntry->update($request->all());

        return redirect()->route('admin.time-entries.index');
    }

    public function absenPage()
    {
        return view('admin.absen.index');
    }

    public function absenStore(Request $request)
    {
        
    }

    public function showCurrent()
    {
        $selfie_datang = 

        $timeEntry = TimeEntry::whereNull('time_end')
            ->whereHas('user', function ($query) {
                $query->where('id', auth()->id());
            })
            ->first();

        return response()->json(compact('timeEntry'));
    }

    public function updateCurrent()
    {
        $timeEntry = TimeEntry::whereNull('time_end')
            ->whereHas('user', function ($query) {
                $query->where('id', auth()->id());
            })
            ->first();

        if ($timeEntry)
        {
            // if(isset($_FILES["webcam"]["tmp_name"])){
            //     $tmpName = $_FILES["webcam"]["tmp_name"];
            //     $name_gen = hexdec(uniqid()).'.'.$tmpName->getClientOriginalExtension();    
            //     $tmpName->storeAs('img/selfie_pulang/',$name_gen);    
            //     $save_selfie_depan = 'img/selfie_pulang/'.$name_gen;    
            // }

            $timeEntry->update([
                'time_end' => now(),
                // 'selfie_pulang' => $save_selfie_depan
            ]);

            return response()->json([
                'status' => 'Telah Bekerja Selama [' . gmdate("H:i:s", $timeEntry->total_time) . '] Jam'
            ]);
        } else {

            // if(isset($_FILES["webcam"]["tmp_name"])){
            //     $tmpName = $_FILES["webcam"]["tmp_name"];
            //     $name_gen = hexdec(uniqid()).'.'.$tmpName->getClientOriginalExtension();    
            //     $tmpName->storeAs('img/selfie_masuk/',$name_gen);    
            //     $save_selfie_belakang = 'img/selfie_masuk/'.$name_gen;    
            // }

            auth()->user()->timeEntries()->create([
                'time_start' => now(),
                // 'selfie_pulang' => $save_selfie_belakang
            ]);

            return response()->json([
                'status' => 'Absen Masuk Berhasil'
            ]);
        };
    }

    public function show(TimeEntry $timeEntry)
    {
        abort_if(Gate::denies('time_entry_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $timeEntry->load('user');

        return view('admin.timeEntries.show', compact('timeEntry'));
    }

    public function destroy(TimeEntry $timeEntry)
    {
        abort_if(Gate::denies('time_entry_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $timeEntry->delete();

        return back();
    }

    public function massDestroy(MassDestroyTimeEntryRequest $request)
    {
        TimeEntry::whereIn('id', request('ids'))->delete();

        return response(null, Response::HTTP_NO_CONTENT);
    }
}
