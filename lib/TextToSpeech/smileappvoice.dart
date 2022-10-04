import 'package:text_to_speech/text_to_speech.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SmileAppVoice{
  final String defaultLanguage = 'en-US';
  TextToSpeech tts = TextToSpeech();
  String text = '';
  double volume = 1; // Range: 0-1
  double rate = 1.0; // Range: 0-2
  double pitch = 1.0; // Range: 0-2

  String? language;
  String? languageCode;
  List<String> languages = <String>[];
  List<String> languageCodes = <String>[];
  String? voice;

  TextEditingController textEditingController = TextEditingController();


  Future<void> initLanguages() async {
    language = await tts.getDisplayLanguageByCode(defaultLanguage); // My CODE

    /// get voice
    voice = await getVoiceByLang(languageCode!);
  }

  Future<String?> getVoiceByLang(String lang) async {
    final List<String>? voices = await tts.getVoiceByLang(languageCode!);
    if (voices != null && voices.isNotEmpty) {
      return voices.first;
    }
    return null;
  }
  void speak({required String text}) {
      tts.setVolume(volume);
      tts.setRate(rate);
      if (languageCode != null) {
        tts.setLanguage(languageCode!);
      }
      tts.setPitch(pitch);
      tts.speak(text);
  }

}