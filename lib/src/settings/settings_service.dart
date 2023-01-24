import 'package:flutter/material.dart';
import 'package:niaje/util/shared_preference.dart';

/// A service that stores and retrieves user settings.
///
/// By default, this class does not persist user settings. If you'd like to
/// persist the user settings locally, use the shared_preferences package. If
/// you'd like to store settings on a web server, use the http package.
class SettingsService {
  /// Loads the User's preferred ThemeMode from local or remote storage.
  Future<ThemeMode> themeMode() async {
    dynamic settings = await getSettings();
    return (settings['appTheme'] == 'light'
        ? ThemeMode.light
        : settings['appTheme'] == 'dark'
            ? ThemeMode.dark
            : ThemeMode.system);
  }

  /// Loads the User's history from local or remote storage.
  Future<List<Map>> appHistory() async {
    dynamic settings = await getSettings();
    return settings['appHistory'];
  }

  Future<dynamic> getSettings() async {
    return await AppSettings().getAppSettings();
  }

  Future<bool> updateThemeMode(ThemeMode theme) async {
    return await AppSettings().setAppTheme(theme.name);
  }

  Future<bool> updateAppHistory(List<Map> history) async {
    return await AppSettings().setAppHistory(history);
  }

  clearAppHistory() {
    AppSettings().clearAppHistory();
  }
}
