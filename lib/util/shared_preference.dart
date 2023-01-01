import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class AppSettings {
  Future<dynamic> getAppSettings() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? appTheme = prefs.getString("sett_theme");

    return {
      "appTheme": appTheme,
    };
  }

  Future<bool> setAppSetting(String setting) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("sett_theme", setting);

    // ignore: deprecated_member_use
    return prefs.commit();
  }

  void removeAppSettings() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("sett_theme");
  }
}
