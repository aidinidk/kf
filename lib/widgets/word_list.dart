import 'package:flutter/material.dart';
import 'package:kf/data/words_list.dart';
import 'package:kf/functions/language_detector.dart';
import 'package:kf/models/word.dart';
import 'package:kf/screens/word_detail_screen.dart';

class WordList extends StatelessWidget {
  const WordList({super.key, required this.query, required this.difficuulty});
  final String query;
  final String difficuulty;

  @override
  Widget build(BuildContext context) {
    String lang = '';
    List<Word> langFiltered = [];

    lang = detectLanguage(string: query);

    if (lang == 'kz') {
      langFiltered =
          mainData.where((word) => word.name.contains(query)).toList();
    } else if (lang == 'en') {
      langFiltered =
          mainData.where((word) => word.meaning.contains(query)).toList();
    }

    return ListView.builder(
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
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                langFiltered[index].name,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              Text(langFiltered[index].meaning),
            ],
          ),
        )),
      ),
    );
  }
}
