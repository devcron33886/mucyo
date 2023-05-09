<?php

namespace App\Filament\Widgets;

use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Card;

class StatsOverview extends BaseWidget
{
    protected function getCards(): array
    {
        return [
            Card::make('Unique views','129.7k')
                ->description('+32k increase')
                ->chart([7,4,2,45,43,77])
                ->descriptionIcon('heroicon-s-trending-up'),
            Card::make('Bounce Rate','12%')
                ->description('+32k increase')
                ->chart([7,4,2,45,43,77])
                ->descriptionIcon('heroicon-s-trending-down'),
            Card::make('Page popularity','129.7k')
                ->description('+32k increase')
                ->chart([7,4,2,45,43,77])
                ->descriptionIcon('heroicon-s-trending-up'),
        ];
    }
}
