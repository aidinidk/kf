import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kf/data/words_list.dart';
import 'package:kf/functions/language_detector.dart';
import 'package:kf/models/word.dart';
import 'package:kf/providers/difficulty_provider.dart';
import 'package:kf/screens/word_detail_screen.dart';

class WordList extends ConsumerWidget {
  const WordList({super.key, required this.query, required this.difficuulty});
  final String query;
  final String difficuulty;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Word> langFiltered = [];
    String lang = detectLanguage(string: query);
    var queryLower = query.toLowerCase();
    var filteredWords = mainData;
    final activeFilters = ref.watch(filtersProvider);
    if (activeFilters[Difficulty.a1]! ||
        activeFilters[Difficulty.a2]! ||
        activeFilters[Difficulty.b1]! ||
        activeFilters[Difficulty.b2]!) {
      filteredWords = ref.watch(filteredWordsProvider);
    } else {
      filteredWords = mainData;
    }

    final activeWords = filteredWords;

    if (lang == 'kz') {
      langFiltered = activeWords.where((word) {
        var newWord = word.name.toLowerCase();
        return newWord.contains(queryLower);
      }).toList();
    } else if (lang == 'fa') {
      langFiltered =
          activeWords.where((word) => word.meaning.contains(query)).toList();
    }

    Widget content = Center(
      child: Text(
        'هیچ موردی یافت نشد',
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
    );

    if (langFiltered.isNotEmpty) {
      content = CupertinoScrollbar(
        child: ListView.builder(
          itemCount: langFiltered.length,
          itemBuilder: (ctx, index) => InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => WordDetail(word: langFiltered[index])));
            },
            child: Card(
                child: Container(
              padding: const EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    langFiltered[index].name.toLowerCase(),
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    langFiltered[index].meaning,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                ],
              ),
            )),
          ),
        ),
      );
    }

    return content;
  }
}
