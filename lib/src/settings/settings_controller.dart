import 'package:flutter/material.dart';
import 'settings_service.dart';

/// A class that many Widgets can interact with to read user settings, update
/// user settings, or listen to user settings changes.
///
/// Controllers glue Data Services to Flutter Widgets. The SettingsController
/// uses the SettingsService to store and retrieve user settings.
class SettingsController with ChangeNotifier {
  SettingsController(this._settingsService);

  // Make SettingsService a private variable so it is not used directly.
  final SettingsService _settingsService;

  // Make these private variables so it is not updated directly without
  // also persisting the changes with the SettingsService.
  late ThemeMode _themeMode;
  late List<Map> _appHistory;

  // Allow Widgets to read the settings.
  ThemeMode get themeMode => _themeMode;
  List<Map> get appHistory => _appHistory;

  /// Load the user's settings from the SettingsService.
  Future<void> loadSettings() async {
    _themeMode = await _settingsService.themeMode();
    _appHistory = await _settingsService.appHistory();
    // Important! Inform listeners a change has occurred.
    notifyListeners();
  }

  /// Update and persist the ThemeMode based on the user's selection.
  Future<bool> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return false;

    // Do not perform any work if new and old ThemeMode are identical
    if (newThemeMode == _themeMode) return false;

    // Otherwise, store the new ThemeMode in memory
    _themeMode = newThemeMode;

    // Important! Inform listeners a change has occurred.
    notifyListeners();

    // Persist the changes to a local database or the internet using the
    // SettingService.
    return await _settingsService.updateThemeMode(newThemeMode);
  }

  Future<bool> updateAppHistory(List<Map> history) async {
    // if (history.isEmpty) return false;
    _appHistory = history;
    notifyListeners();
    return await _settingsService.updateAppHistory(history);
  }

  clearAppHistory() {
    _appHistory = [];
    notifyListeners();
    _settingsService.clearAppHistory();
  }
}
