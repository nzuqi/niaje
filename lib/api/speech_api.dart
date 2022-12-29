import 'package:flutter/cupertino.dart';
import 'package:niaje/util/common.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechApi {
  static final stt.SpeechToText speech = stt.SpeechToText();

  static Future<bool> toggleRecording({required Function(String text) onResult, required ValueChanged<bool> onListening}) async {
    if (speech.isListening) {
      speech.stop();
      return true;
    }

    final isAvailable = await speech.initialize(
      onStatus: (status) => onListening(speech.isListening),
      onError: (e) => logger.e(e),
    );

    if (isAvailable) {
      speech.listen(onResult: (value) => onResult(value.recognizedWords));
    }

    return isAvailable;
  }
}
