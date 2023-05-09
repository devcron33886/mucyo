<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Support\Str;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Permission;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class RolesAndPermissionsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // reset cached roles and permissions
        app()[\Spatie\Permission\PermissionRegistrar::class]->forgetCachedPermissions();

        // Misc
        $miscPermission = Permission::create(['name' => 'N/A']);

        // USER MODEL
        $userPermission1 = Permission::create(['name' => 'create: user']);
        $userPermission2 = Permission::create(['name' => 'read: user']);
        $userPermission3 = Permission::create(['name' => 'update: user']);
        $userPermission4 = Permission::create(['name' => 'delete: user']);

        // ROLE MODEL
        $rolePermission1 = Permission::create(['name' => 'create: role']);
        $rolePermission2 = Permission::create(['name' => 'read: role']);
        $rolePermission3 = Permission::create(['name' => 'update: role']);
        $rolePermission4 = Permission::create(['name' => 'delete: role']);

        // PERMISSION MODEL
        $permission1 = Permission::create(['name' => 'create: permission']);
        $permission2 = Permission::create(['name' => 'read: permission']);
        $permission3 = Permission::create(['name' => 'update: permission']);
        $permission4 = Permission::create(['name' => 'delete: permission']);

        // DEVICE MODEL
        $devicePermission1 = Permission::create(['name' => 'create: device']);
        $devicePermission2 = Permission::create(['name' => 'read: device']);
        $devicePermission3 = Permission::create(['name' => 'update: device']);
        $devicePermission4 = Permission::create(['name' => 'delete: device']);

        // CLIENTS MODEL
        $clientPermission1 = Permission::create(['name' => 'create: client']);
        $clientPermission2 = Permission::create(['name' => 'read: client']);
        $clientPermission3 = Permission::create(['name' => 'update: client']);
        $clientPermission4 = Permission::create(['name' => 'delete: client']);

        // OWNER MODEL
        $ownerPermission1 = Permission::create(['name' => 'create: owner']);
        $ownerPermission2 = Permission::create(['name' => 'read: owner']);
        $ownerPermission3 = Permission::create(['name' => 'update: owner']);
        $ownerPermission4 = Permission::create(['name' => 'delete: owner']);

        // DIAGNOSIS MODEL
        $diagnosisPermission1 = Permission::create(['name' => 'create: diagnosis']);
        $diagnosisPermission2 = Permission::create(['name' => 'read: diagnosis']);
        $diagnosisPermission3 = Permission::create(['name' => 'update: diagnosis']);
        $diagnosisPermission4 = Permission::create(['name' => 'delete: diagnosis']);

        // ADMINS
        $adminPermission1 = Permission::create(['name' => 'read: admin']);
        $adminPermission2 = Permission::create(['name' => 'update: admin']);

        // CREATE ROLES
        $userRole = Role::create(['name' => 'user'])->syncPermissions([
            $miscPermission,
        ]);

        $superAdminRole = Role::create(['name' => 'super-admin'])->syncPermissions([
            $userPermission1,
            $userPermission2,
            $userPermission3,
            $userPermission4,
            $rolePermission1,
            $rolePermission2,
            $rolePermission3,
            $rolePermission4,
            $permission1,
            $permission2,
            $permission3,
            $permission4,
            $adminPermission1,
            $adminPermission2,
            $userPermission1,
            $clientPermission1,
            $clientPermission2,
            $clientPermission3,
            $clientPermission4,
            $ownerPermission1,
            $ownerPermission2,
            $ownerPermission3,
            $ownerPermission4,
            $devicePermission1,
            $devicePermission2,
            $devicePermission3,
            $devicePermission4,
            $diagnosisPermission1,
            $diagnosisPermission2,
            $diagnosisPermission3,
            $diagnosisPermission4,


        ]);
        $adminRole = Role::create(['name' => 'admin'])->syncPermissions([
            $userPermission1,
            $userPermission2,
            $userPermission3,
            $userPermission4,
            $rolePermission1,
            $rolePermission2,
            $rolePermission3,
            $rolePermission4,
            $permission1,
            $permission2,
            $permission3,
            $permission4,
            $adminPermission1,
            $adminPermission2,
            $userPermission1,
            $clientPermission1,
            $clientPermission2,
            $clientPermission3,
            $clientPermission4,
            $ownerPermission1,
            $ownerPermission2,
            $ownerPermission3,
            $ownerPermission4,
            $devicePermission1,
            $devicePermission2,
            $devicePermission3,
            $devicePermission4,
            $diagnosisPermission1,
            $diagnosisPermission2,
            $diagnosisPermission3,
            $diagnosisPermission4,
        ]);
        $moderatorRole = Role::create(['name' => 'moderator'])->syncPermissions([
            $userPermission2,
            $rolePermission2,
            $clientPermission2,
            $ownerPermission2, 
            $devicePermission2, 
            $diagnosisPermission2,
            $permission2,
            $adminPermission1,
        ]);
        $developerRole = Role::create(['name' => 'developer'])->syncPermissions([
            $adminPermission1,
        ]);

        // CREATE ADMINS & USERS
        User::create([
            'name' => 'super admin',
            'is_admin' => 1,
            'email' => 'super@admin.com',
            'email_verified_at' => now(),
            'password' => Hash::make('password'),
            'remember_token' => Str::random(10),
        ])->assignRole($superAdminRole);

        User::create([
            'name' => 'admin',
            'is_admin' => 1,
            'email' => 'admin@admin.com',
            'email_verified_at' => now(),
            'password' => Hash::make('password'),
            'remember_token' => Str::random(10),
        ])->assignRole($adminRole);

        User::create([
            'name' => 'moderator',
            'is_admin' => 1,
            'email' => 'moderator@admin.com',
            'email_verified_at' => now(),
            'password' => Hash::make('password'),
            'remember_token' => Str::random(10),
        ])->assignRole($moderatorRole);

        User::create([
            'name' => 'developer',
            'is_admin' => 1,
            'email' => 'developer@admin.com',
            'email_verified_at' => now(),
            'password' => Hash::make('password'),
            'remember_token' => Str::random(10),
        ])->assignRole($developerRole);

        for ($i=1; $i < 10; $i++) {
            User::create([
                'name' => 'Test '.$i,
                'is_admin' => 0,
                'email' => 'test'.$i.'@test.com',
                'email_verified_at' => now(),
                'password' => Hash::make('password'), // password
                'remember_token' => Str::random(10),
            ])->assignRole($userRole);
        }
    }
}
