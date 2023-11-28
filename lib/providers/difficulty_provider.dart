import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kf/providers/words_provider.dart';

enum Difficulty {
  none,
  a1,
  a2,
  b1,
  b2,
}

enum Show {
  content,
}

class ShowMoreNotifier extends StateNotifier<Map<Show, bool>> {
  ShowMoreNotifier() : super({Show.content: true});

  void toggleHide(Show content, bool isActive) {
    state = {
      ...state,
      content: isActive,
    };
  }
}

final showMoreProvider =
    StateNotifierProvider<ShowMoreNotifier, Map<Show, bool>>(
        (ref) => ShowMoreNotifier());

class DifficultyNotifier extends StateNotifier<Map<Difficulty, bool>> {
  DifficultyNotifier()
      : super({
          Difficulty.a1: false,
          Difficulty.a2: false,
          Difficulty.b1: false,
          Difficulty.b2: false,
        });

  void setFilter(Difficulty difficulty, bool isActive) {
    state = {
      ...state,
      difficulty: isActive,
    };
  }

  void setFilters(Map<Difficulty, bool> chosenFilters) {
    state = chosenFilters;
  }
}

final filtersProvider =
    StateNotifierProvider<DifficultyNotifier, Map<Difficulty, bool>>(
  (ref) => DifficultyNotifier(),
);

final filteredWordsProvider = Provider((ref) {
  final words = ref.watch(wordsProvider);
  final activeFilters = ref.watch(filtersProvider);

  return words.where((word) {
    if (activeFilters[Difficulty.a1]! && word.diffuclty == 'A1') {
      return true;
    }
    if (activeFilters[Difficulty.a2]! && word.diffuclty == 'A2') {
      return true;
    }
    if (activeFilters[Difficulty.b1]! && word.diffuclty == 'B1') {
      return true;
    }
    if (activeFilters[Difficulty.b2]! && word.diffuclty == 'B2') {
      return true;
    }
    return false;
  }).toList();
});
