import 'package:flutter/material.dart';
import 'package:kf/models/word.dart';

class WordDetail extends StatelessWidget {
  const WordDetail({super.key, required this.word});
  final Word word;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(word.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(word.name),
            Text(word.meaning),
          ],
        ),
      ),
    );
  }
}
