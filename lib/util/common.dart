import 'package:logger/logger.dart';

final logger = Logger();

Future<Map<String, String>> requestHeaders({String? token}) async {
  return {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  };
}
