import 'package:flutter/foundation.dart';

class AppUrl {
  static const Map _envUrl = {
    "dev": "https://niaje.martin.co.ke:5305", // Needs to be different, of course
    "prod": "https://niaje.martin.co.ke:5305",
  };

  static final String _apiBaseURL = "${_envUrl[kDebugMode ? 'dev' : 'prod']}/api/v1";

  static String get search => "$_apiBaseURL/openai/search"; // Search endpoint
}
