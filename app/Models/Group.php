<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Group extends Model
{
    protected $hidden = ['pivot'];

    use HasFactory;
    public function member(){
        return $this->belongsToMany(User::class, 'group_users', 'group_id', 'user_id');
    }

     public function groupadmin(){
        return $this->belongsTo(User::class, 'user_id',  'id');
    }
}
