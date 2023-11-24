import 'package:flutter/material.dart';
import 'package:kf/data/words_list.dart';
import 'package:kf/models/word.dart';
import 'package:kf/screens/word_detail_screen.dart';

class DifficultyScreen extends StatelessWidget {
  const DifficultyScreen({super.key, required this.difficulty});
  final String difficulty;

  @override
  Widget build(BuildContext context) {
    List<Word> difficultyFiltered =
        mainData.where((word) => word.diffuclty.contains(difficulty)).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(difficulty),
      ),
      body: ListView.builder(
        itemCount: difficultyFiltered.length,
        itemBuilder: (ctx, index) => InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => WordDetail(word: difficultyFiltered[index])));
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
                  difficultyFiltered[index].name,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
                Text(difficultyFiltered[index].meaning),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
