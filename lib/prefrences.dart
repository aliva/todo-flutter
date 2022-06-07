import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefrences {
  static Future<ThemeMode> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    switch (prefs.getString("theme_mode")) {
      case "dark":
        return ThemeMode.dark;
      case "light":
        return ThemeMode.light;
      case "system":
        return ThemeMode.system;
      default:
        return ThemeMode.system;
    }
  }
}
