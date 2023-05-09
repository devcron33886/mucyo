<?php

namespace App\Filament\Resources\PermissionResource\Pages;

use App\Filament\Resources\OwnerResource;
use Filament\Pages\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateOwner extends CreateRecord
{
    protected static string $resource = PermissionResource::class;
}
