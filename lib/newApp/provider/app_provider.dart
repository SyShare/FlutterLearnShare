

import 'package:flutter/material.dart';
import 'package:flutter_one/newApp/theme/theme_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier{


  AppProvider() {
    checkTheme();
  }
  Key? key = UniqueKey();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  ThemeData theme = ThemeConfig.lightTheme;

  // change the Theme in the provider and SharedPreferences
  void setTheme(value, c) async {
    theme = value;
    // SharedPreferences.getInstance().then((value) => {
    //   value.setString('theme', c),
    //    notifyListeners()
    // });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', c);
    notifyListeners();
  }

  ThemeData getTheme(value) {
    return theme;
  }

  Future<ThemeData> checkTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ThemeData t;
    String r = prefs.getString('theme') ?? 'light';

    if (r == 'light') {
      t = ThemeConfig.lightTheme;
      setTheme(ThemeConfig.lightTheme, 'light');
    } else {
      t = ThemeConfig.darkTheme;
      setTheme(ThemeConfig.darkTheme, 'dark');
    }

    return t;
  }



}