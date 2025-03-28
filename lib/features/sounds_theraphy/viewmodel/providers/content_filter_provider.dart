import 'package:flutter/material.dart';
import 'package:nirvanafit/features/sounds_theraphy/data/meditation_session_contents.dart';
import '../../data/binaural_beats_contents.dart';
import '../../data/faq_contents.dart';
import '../../data/soothing_music_contents.dart';
import '../../model/audio_model.dart';
import '../../model/faq_model.dart';

class ContentFilterProvider extends ChangeNotifier {
  List<FAQModel> _filteredFaq = faqContentsList;
  List<AudioModel> _filteredBinauralBeatsList = binauralBeatsContentsList;
  List<AudioModel> _filteredSoothingMusicList = soothingMusicContentsList;
  List<AudioModel> _filteredMeditationSessionList =
      meditationSessionContentsList;

  //Getter
  List<FAQModel> get filteredFaq => _filteredFaq;

  List<AudioModel> get filteredBinauralBeatsList => _filteredBinauralBeatsList;

  List<AudioModel> get filteredSoothingMusicList => _filteredSoothingMusicList;

  List<AudioModel> get filteredMeditationSessionList =>
      _filteredMeditationSessionList;

  //Setter
  set filteredFaq(List<FAQModel> value) {
    _filteredFaq = value;
    notifyListeners();
  }

  set filteredBinauralBeatsList(List<AudioModel> value) {
    _filteredBinauralBeatsList = value;
    notifyListeners();
  }

  set filteredSoothingMusicList(List<AudioModel> value) {
    _filteredSoothingMusicList = value;
    notifyListeners();
  }

  set filteredMeditationSessionList(List<AudioModel> value) {
    _filteredMeditationSessionList = value;
    notifyListeners();
  }

  //Methods
  void filterFaq(String text) {
    filteredFaq = faqContentsList
        .where((faq) => faq.question.toLowerCase().contains(text.toLowerCase()))
        .toList();
  }

  void filterBinauralBeatsList(String text) {
    filteredBinauralBeatsList = binauralBeatsContentsList
        .where((bb) => bb.title.toLowerCase().contains(text.toLowerCase()))
        .toList();
  }

  void filterSoothingMusicList(String text) {
    filteredSoothingMusicList = soothingMusicContentsList
        .where((sm) => sm.title.toLowerCase().contains(text.toLowerCase()))
        .toList();
  }

  void filterMeditationSessionList(String text) {
    filteredMeditationSessionList = meditationSessionContentsList
        .where((ms) => ms.title.toLowerCase().contains(text.toLowerCase()))
        .toList();
  }
}
