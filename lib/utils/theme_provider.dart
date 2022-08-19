import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor:Color(0xff2B2B2B),
    backgroundColor: Color(0xff2B2B2B),
    cardColor: Color(0xff3B3B3B),
    focusColor: Colors.red,
    primaryColor: Colors.white,
     colorScheme: ColorScheme.light(),
  );

  static final lightTheme   = ThemeData(
    scaffoldBackgroundColor: Color.fromARGB(255, 252, 237, 99),
    backgroundColor: Colors.yellow,
    primaryColor: Colors.black,
    cardColor: Color.fromARGB(255, 255, 253, 253),
    focusColor: Colors.blue,
     colorScheme: ColorScheme.dark(),

  );
}
