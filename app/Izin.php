<?php

namespace App;


use Illuminate\Database\Eloquent\Model;
use App\Traits\MultiTenantModelTrait;

class Izin extends Model
{
    use MultiTenantModelTrait;

    public $table = 'izins';

    protected $fillable = [
        'user_id',
        'alasan',
        'rentang',
        'bukti',
        'created_at',
        'updated_at',
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }
}
