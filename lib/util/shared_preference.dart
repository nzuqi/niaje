import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class AppSettings {
  Future<dynamic> getAppSettings() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? appTheme = prefs.getString("sett_theme");
    List<String> appHistoryString = prefs.getStringList("sett_history") ?? [];
    List<Map> appHistory = [];
    if (appHistoryString.isNotEmpty) {
      for (var element in appHistoryString) {
        appHistory.add(json.decode(element));
      }
    }

    return {
      "appTheme": appTheme,
      "appHistory": appHistory,
    };
  }

  Future<bool> setAppTheme(String theme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("sett_theme", theme);

    // ignore: deprecated_member_use
    return prefs.commit();
  }

  Future<bool> setAppHistory(List<Map> history) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> messagesString = [];
    for (var element in history) {
      messagesString.add(json.encode(element));
    }
    prefs.setStringList("sett_history", messagesString);
    // ignore: deprecated_member_use
    return prefs.commit();
  }

  void removeAppSettings() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("sett_theme");
    prefs.remove("sett_history");
  }

  void clearAppHistory() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("sett_history");
  }
}
