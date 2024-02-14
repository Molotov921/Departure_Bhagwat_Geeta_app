import 'package:departure_bhagavad_geeta/model/theme_model.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeModel themeModel = ThemeModel(isLight: true);

  void toggleTheme() {
    themeModel.isLight = !themeModel.isLight;
    notifyListeners();
  }
}
