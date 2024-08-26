import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

final logger = Logger();

// https://stackoverflow.com/a/29629114/5630225
// final helloWorld = 'hello world'.toCapitalized(); // 'Hello world'
// final helloWorld = 'hello world'.toUpperCase(); // 'HELLO WORLD'
// final helloWorldCap = 'hello world'.toTitleCase(); // 'Hello World'
extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

showAlert(BuildContext context, String message) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
