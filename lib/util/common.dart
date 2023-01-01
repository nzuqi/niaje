import 'package:logger/logger.dart';

final logger = Logger();

Future<Map<String, String>> requestHeaders({String? token}) async {
  return {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  };
}

// https://stackoverflow.com/a/29629114/5630225
// final helloWorld = 'hello world'.toCapitalized(); // 'Hello world'
// final helloWorld = 'hello world'.toUpperCase(); // 'HELLO WORLD'
// final helloWorldCap = 'hello world'.toTitleCase(); // 'Hello World'
extension StringCasingExtension on String {
  String toCapitalized() => length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}
