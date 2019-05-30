import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/china_language.dart';

class ChinaLanguage extends LocalizationsDelegate<ChinaLocalizations> {
  static ChinaLanguage delegate = ChinaLanguage();

  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    return ['en', 'zh'].contains(locale.languageCode);
    ;
  }

  @override
  Future<ChinaLocalizations> load(Locale locale) {
    return Future.value(new ChinaLocalizations(locale));
    // return new SynchronousFuture<ChinaLocalizations>(new ChinaLocalizations(locale));;
  }

  @override
  bool shouldReload(LocalizationsDelegate<ChinaLocalizations> old) {
    // TODO: implement shouldReload
    return false;
  }
}
