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
    // return ThemeMode.system;
  }

  Future<dynamic> getSettings() async {
    return await AppSettings().getAppSettings();
    // if (settings['appTheme'] != null) {
    //   widget.controller.updateThemeMode(settings['appTheme'] == 'light'
    //       ? ThemeMode.light
    //       : settings['appTheme'] == 'dark'
    //           ? ThemeMode.dark
    //           : ThemeMode.system);
    //   setState(() {});
    // }
  }

  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> updateThemeMode(ThemeMode theme) async {
    // Use the shared_preferences package to persist settings locally or the
    // http package to persist settings over the network.
    await AppSettings().setAppSetting(theme.name);
  }
}
