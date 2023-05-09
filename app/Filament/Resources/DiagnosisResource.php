<?php

namespace App\Filament\Resources;

use Filament\Forms;
use Filament\Tables;
use App\Models\Device;
use App\Models\Diagnosis;
use Filament\Resources\Form;
use Filament\Resources\Table;
use Filament\Resources\Resource;
use Illuminate\Database\Eloquent\Builder;
use App\Filament\Resources\DiagnosisResource\Pages;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use App\Filament\Resources\DiagnosisResource\RelationManagers;
use App\Models\Owner;
use Filament\Forms\Components\Select;

class DiagnosisResource extends Resource
{
    protected static ?string $model = Diagnosis::class;

    protected static ?string $navigationIcon = 'heroicon-o-home';
    protected static ?string $navigationGroup = 'WorkShop';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Select::make('device_id')
                    ->label('Device')
                    ->options(Device::all()->pluck('id', 'name'))
                    ->reactive(),
                Select::make('Owner')
                    ->label('Owner')
                    //->disabled()
                    ->options(function (callable $get){
                        $device=Device::find($get('owner_id'));
                        
                        if (!$device) {
                            return Owner::all()->pluck('name', 'id');}
                        return $device->owner->pluck('name', 'id');
                    }),
                // Forms\Components\Select::make('owner_id')
                //     ->relationship('owner', 'name')
                //     ->required(),
                Forms\Components\Select::make('user_id')
                    ->relationship('user', 'name')
                    ->required(),
                Forms\Components\Textarea::make('description')
                    ->required()
                    ->maxLength(65535),
                Forms\Components\TextInput::make('notes')
                    ->required()
                    ->maxLength(255),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('device.id'),
                Tables\Columns\TextColumn::make('owner.name'),
                Tables\Columns\TextColumn::make('user.name'),
                Tables\Columns\TextColumn::make('description'),
                Tables\Columns\TextColumn::make('notes'),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime(),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime(),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\DeleteBulkAction::make(),
            ]);
    }
    
    public static function getRelations(): array
    {
        return [
            //
        ];
    }
    
    public static function getPages(): array
    {
        return [
            'index' => Pages\ListDiagnoses::route('/'),
            'create' => Pages\CreateDiagnosis::route('/create'),
            'edit' => Pages\EditDiagnosis::route('/{record}/edit'),
        ];
    }    
}
