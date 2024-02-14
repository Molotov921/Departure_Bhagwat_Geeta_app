import 'package:departure_bhagavad_geeta/model/lang_model.dart';
import 'package:flutter/material.dart';

class LangProvider extends ChangeNotifier {
  IsLangModel isLangModel = IsLangModel(isLang: false);

  void changeLang() {
    isLangModel.isLang = !isLangModel.isLang;
    notifyListeners();
  }
}
