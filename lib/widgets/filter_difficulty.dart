import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kf/providers/difficulty_provider.dart';

class FilterDifficulty extends ConsumerWidget {
  const FilterDifficulty({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Column(
      children: [
        SwitchListTile(
          activeTrackColor: Theme.of(context).colorScheme.primary,
          value: activeFilters[Difficulty.a1]!,
          onChanged: (isChecked) {
            ref
                .read(filtersProvider.notifier)
                .setFilter(Difficulty.a1, isChecked);
          },
          title: Text(
            'A1',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          subtitle: Text(
            'A1 فقط کلمات گروه',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
        SwitchListTile(
          activeTrackColor: Theme.of(context).colorScheme.primary,
          value: activeFilters[Difficulty.a2]!,
          onChanged: (isChecked) {
            ref
                .read(filtersProvider.notifier)
                .setFilter(Difficulty.a2, isChecked);
          },
          title: Text(
            'A2',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          subtitle: Text(
            'A2 فقط کلمات گروه',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
        SwitchListTile(
          activeTrackColor: Theme.of(context).colorScheme.primary,
          value: activeFilters[Difficulty.b1]!,
          onChanged: (isChecked) {
            ref
                .read(filtersProvider.notifier)
                .setFilter(Difficulty.b1, isChecked);
          },
          title: Text(
            'B1',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          subtitle: Text(
            'B1 فقط کلمات گروه',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
        SwitchListTile(
          activeTrackColor: Theme.of(context).colorScheme.primary,
          value: activeFilters[Difficulty.b2]!,
          onChanged: (isChecked) {
            ref
                .read(filtersProvider.notifier)
                .setFilter(Difficulty.b2, isChecked);
          },
          title: Text(
            'B2',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          subtitle: Text(
            'B2 فقط کلمات گروه',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
      ],
    );
  }
}
