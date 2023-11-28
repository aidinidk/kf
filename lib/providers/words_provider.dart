import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kf/data/words_list.dart';

final wordsProvider = Provider((ref) {
  return mainData;
});
