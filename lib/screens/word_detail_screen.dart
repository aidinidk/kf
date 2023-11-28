import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kf/data/words_list.dart';
import 'package:kf/models/word.dart';
import 'dart:math';

import 'package:kf/providers/difficulty_provider.dart';

class WordDetail extends ConsumerStatefulWidget {
  const WordDetail({super.key, required this.word});
  final Word word;
  @override
  ConsumerState<WordDetail> createState() => _WordDetailState();
}

class _WordDetailState extends ConsumerState<WordDetail> {
  @override
  Widget build(BuildContext context) {
    List<String> filterText = [];

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

    var hideMore = ref.watch(showMoreProvider);
    Widget content = AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'معنی: ${widget.word.meaning}',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'تلفظ: ${widget.word.pronounce}',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(
            height: 5,
          ),
          if (widget.word.descreption.isNotEmpty)
            Text(
              'توضیحات: ${widget.word.descreption}',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
        ],
      ),
    );
    if (!hideMore[Show.content]!) {
      content = Container();
    }

    if (activeFilters[Difficulty.a1]!) {
      filterText.add('A1');
    }
    if (activeFilters[Difficulty.a2]!) {
      filterText.add('A2');
    }
    if (activeFilters[Difficulty.b1]!) {
      filterText.add('B1');
    }
    if (activeFilters[Difficulty.b2]!) {
      filterText.add('B2');
    }

    final activeWords = filteredWords;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(widget.word.name),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: 500,
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).colorScheme.background,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          color: Theme.of(context).colorScheme.onBackground,
                          iconSize: 30,
                          onPressed: () {
                            ref.read(showMoreProvider.notifier).toggleHide(
                                Show.content, !hideMore[Show.content]!);
                          },
                          icon: Icon(!hideMore[Show.content]!
                              ? Icons.remove_red_eye_outlined
                              : Icons.remove_red_eye)),
                      Text(
                        widget.word.name.toLowerCase(),
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontSize: 30),
                      ),
                    ],
                  ),
                  if (widget.word.diffuclty.isNotEmpty)
                    Text(
                      widget.word.diffuclty,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                  const SizedBox(
                    height: 40,
                  ),
                  content,
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).colorScheme.surface),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      var randoNum = Random().nextInt(activeWords.length);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) =>
                              WordDetail(word: activeWords[randoNum])));
                    },
                    child: Text(
                      'کلمه شانسی؟',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface),
                    ),
                  ),
                  if (activeFilters[Difficulty.a1]! ||
                      activeFilters[Difficulty.a2]! ||
                      activeFilters[Difficulty.b1]! ||
                      activeFilters[Difficulty.b2]!)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '${filterText.toString()} :فیتلر شده با',
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
