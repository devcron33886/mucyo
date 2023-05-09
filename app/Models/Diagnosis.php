<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Diagnosis extends Model
{
    use HasFactory;

    //for device
    public function device(): BelongsTo{
        return $this->belongsTo(Device::class);
    }

    //for owner
    public function owner(): BelongsTo{
        return $this->belongsTo(Owner::class);
    }

    //for user who diagnosed
    public function user(): BelongsTo{
        return $this->belongsTo(User::class);
    }
}
