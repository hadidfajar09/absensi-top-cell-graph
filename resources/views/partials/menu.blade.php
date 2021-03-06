<div class="sidebar">
    <nav class="sidebar-nav">

        <ul class="nav">
            <li class="nav-item">
                <a href="{{ route("admin.home") }}" class="nav-link">
                    <i class="nav-icon fas fa-fw fa-tachometer-alt">

                    </i>
                    {{ trans('global.dashboard') }}
                </a>
            </li>
            @can('user_management_access')
                <li class="nav-item nav-dropdown">
                    <a class="nav-link  nav-dropdown-toggle" href="#">
                        <i class="fa-fw fas fa-users nav-icon">

                        </i>
                        {{ trans('cruds.userManagement.title') }}
                    </a>
                    <ul class="nav-dropdown-items">
                        @can('permission_access')
                            <li class="nav-item">
                                <a href="{{ route("admin.permissions.index") }}" class="nav-link {{ request()->is('admin/permissions') || request()->is('admin/permissions/*') ? 'active' : '' }}">
                                    <i class="fa-fw fas fa-unlock-alt nav-icon">

                                    </i>
                                    {{ trans('cruds.permission.title') }}
                                </a>
                            </li>
                        @endcan
                        @can('role_access')
                            <li class="nav-item">
                                <a href="{{ route("admin.roles.index") }}" class="nav-link {{ request()->is('admin/roles') || request()->is('admin/roles/*') ? 'active' : '' }}">
                                    <i class="fa-fw fas fa-briefcase nav-icon">

                                    </i>
                                    {{ trans('cruds.role.title') }}
                                </a>
                            </li>
                        @endcan
                        @can('user_access')
                            <li class="nav-item">
                                <a href="{{ route("admin.users.index") }}" class="nav-link {{ request()->is('admin/users') || request()->is('admin/users/*') ? 'active' : '' }}">
                                    <i class="fa-fw fas fa-user nav-icon">

                                    </i>
                                    {{ trans('cruds.user.title') }}
                                </a>
                            </li>

                            <li class="nav-item">
                                <a href="{{ route("admin.users.izin") }}" class="nav-link {{ request()->is('admin/users') || request()->is('admin/users/izin') ? '' : '' }}">
                                    <i class="fa-fw fas fa-info nav-icon">

                                    </i>
                                    {{ trans('cruds.user.izin') }}
                                </a>
                            </li>

                            <li class="nav-item">
                                <a href="{{ route("admin.users.shift") }}" class="nav-link {{ request()->is('admin/users') || request()->is('admin/users/shift') ? '' : '' }}">
                                    <i class="fa-fw fas fa-id-card nav-icon">

                                    </i>
                                    {{ trans('cruds.user.shift') }}
                                </a>
                            </li>
                        @endcan
                    </ul>
                </li>
            @endcan
            @can('time_entry_access')
                <li class="nav-item">
                    <a href="{{ route("admin.time-entries.index") }}" class="nav-link {{ request()->is('admin/time-entries') || request()->is('admin/time-entries/*') ? 'active' : '' }}">
                        <i class="fa-fw fas fa-clock nav-icon">

                        </i>
                       Riwayat Kerja
                    </a>
                </li>
            @endcan
            @if (!auth()->user()->is_admin)

            <li class="nav-item">
                <a href="{{ route("admin.time-entries.page") }}" class="nav-link">
                    <i class="fa-fw fas fa-eye nav-icon">

                    </i>
                    <span>Absen</span>
                </a>
            </li>

            <li class="nav-item">
                <a href="{{ route("admin.users.izin.create") }}" class="nav-link">
                    <i class="fa-fw fas fa-pen nav-icon">

                    </i>
                    Izin
                </a>
            </li>
            @endif
            <li class="nav-item">
                <a href="{{ route("admin.reports.index") }}" class="nav-link {{ request()->is('admin/reports') || request()->is('admin/reports/*') ? 'active' : '' }}">
                    <i class="fa-fw fas fa-calendar nav-icon">

                    </i>
                    Statistik
                </a>
            </li>

            

            <li class="nav-item">
                <a href="#" class="nav-link" onclick="event.preventDefault(); document.getElementById('logoutform').submit();">
                    <i class="nav-icon fas fa-fw fa-sign-out-alt">

                    </i>
                    {{ trans('global.logout') }}
                </a>
            </li>
        </ul>

    </nav>
    <button class="sidebar-minimizer brand-minimizer" type="button"></button>
</div>

@section('scripts')
@parent
{{-- <script>
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
</script> --}}
@endsection
