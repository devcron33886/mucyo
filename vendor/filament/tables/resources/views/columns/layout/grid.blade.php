<div {{ $attributes->merge($getExtraAttributes()) }}>
    @php
        $columns = $getGridColumns();
    @endphp

    <x-filament-support::grid
        :default="$columns['default'] ?? 1"
        :sm="$columns['sm'] ?? null"
        :md="$columns['md'] ?? null"
        :lg="$columns['lg'] ?? null"
        :xl="$columns['xl'] ?? null"
        :two-xl="$columns['2xl'] ?? null"
        :class="\Illuminate\Support\Arr::toCssClasses([
            (($columns['default'] ?? 1) === 1) ? 'gap-1' : 'gap-3',
            ($columns['sm'] ?? null) ? (($columns['sm'] === 1) ? 'sm:gap-1' : 'sm:gap-3') : null,
            ($columns['md'] ?? null) ? (($columns['md'] === 1) ? 'md:gap-1' : 'md:gap-3') : null,
            ($columns['lg'] ?? null) ? (($columns['lg'] === 1) ? 'lg:gap-1' : 'lg:gap-3') : null,
            ($columns['xl'] ?? null) ? (($columns['xl'] === 1) ? 'xl:gap-1' : 'xl:gap-3') : null,
            ($columns['2xl'] ?? null) ? (($columns['2xl'] === 1) ? '2xl:gap-1' : '2xl:gap-3') : null,
        ])"
    >
        <x-tables::columns.layout
            :components="$getComponents()"
            :record="$getRecord()"
            :record-key="$recordKey"
            grid
        />
    </x-filament-support::grid>
</div>
