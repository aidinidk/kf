String detectLanguage({required String string}) {
  String languageCodes = 'kz';

  final RegExp persian = RegExp(r'^[\u0600-\u06FF]+');
  if (persian.hasMatch(string)) languageCodes = 'fa';

  return languageCodes;
}
