<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Device extends Model
{
    use HasFactory;

    public function owner(): BelongsTo{
        return $this->belongsTo(Owner::class);
    }

    public function diagnoses(): HasMany{ 
        return $this->hasMany(Diagnosis::class);
    }
}
