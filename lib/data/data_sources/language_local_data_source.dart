import 'dart:async';

import 'package:hive/hive.dart';
import 'package:movies_app/common/constance/app_string_constance.dart';

abstract class LanguageLocalDataSource {
  Future<void> updateLanguage(String languageCode);

  Future<String> getPreferredLanguage();
}

class LanguageLocalDataSourceImpl extends LanguageLocalDataSource {
  @override
  Future<String> getPreferredLanguage() async {
    final languageCode = await Hive.openBox(AppStringConstance.kLanguageBox);
    return languageCode.get(AppStringConstance.appLanguageKey)??'en';
  }

  @override
  Future<void> updateLanguage(String languageCode) async {
    final languageBox = await Hive.openBox(AppStringConstance.kLanguageBox);
    unawaited(
      languageBox.put(AppStringConstance.appLanguageKey, languageCode),
    );
  }
}
