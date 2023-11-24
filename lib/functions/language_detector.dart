String detectLanguage({required String string}) {
  String languageCodes = 'kz';

  final RegExp persian = RegExp(r'^[\u0600-\u06FF]+');
  final RegExp english = RegExp(r'^[a-zA-Z]+');
  if (english.hasMatch(string)) languageCodes = 'en';
  if (persian.hasMatch(string)) languageCodes = 'fa';

  return languageCodes;
}
