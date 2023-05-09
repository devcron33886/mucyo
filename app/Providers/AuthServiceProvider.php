<?php

namespace App\Providers;

use App\Models\Team;
use App\Models\User;
use App\Models\Client;
use App\Models\Device;
use App\Models\Diagnosis;
use App\Policies\RolePolicy;
use App\Policies\TeamPolicy;
use App\Policies\UserPolicy;
use App\Policies\ClientPolicy;
use App\Policies\DevicePolicy;
use App\Policies\DiagnosisPolicy;
use App\Policies\PermissionPolicy;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        Team::class => TeamPolicy::class,
        Permission::class=> PermissionPolicy::class,
        Role::class=>RolePolicy::class,
        User::class=> UserPolicy::class,
        Client::class=> ClientPolicy::class,
        Owner::class=> OwnerPolicy::class,
        Device::class=> DevicePolicy::class,
        Diagnosis::class=> DiagnosisPolicy::class,
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        //
    }
}
