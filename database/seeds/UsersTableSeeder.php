<?php

use App\User;
use Illuminate\Database\Seeder;

class UsersTableSeeder extends Seeder
{
    public function run()
    {
        $users = [
            [
                'id'             => 1,
                'name'           => 'HRD',
                'email'          => 'hrd@top.com',
                'password'       => '$2y$10$Vr/mYRcIkhXVoBryt538Au/B/X64uDT91KtDJVrbIQc5IRp2IdPVS', //password
                'jabatan'        => 'HRD',
                'outlet'        => 'Head Office',
                'remember_token' => null,
                'created_at' => now()
            ]
        ];

        for($i = 1; $i <= 10; $i++)
        {
            array_push($users, [
                'id'             => $i+1,
                'name'           => 'karyawan ' . $i,
                'email'          => 'karyawan' . $i . '@top' . $i . '.com',
                'jabatan'        => 'Pegawai',
                'outlet'        => 'Head Office',
                'password'       => '$2y$10$Vr/mYRcIkhXVoBryt538Au/B/X64uDT91KtDJVrbIQc5IRp2IdPVS',
                'remember_token' => null,
                'created_at' => now()
            ]);
        }

        User::insert($users);
    }
}
