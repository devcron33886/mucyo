<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Owner extends Model
{
    use HasFactory;

    public function patients(): HasMany{
        return $this->HasMany(Patient::class);
    }

    public function devices(): HasMany{
        return $this->HasMany(Device::class);
    }
}
