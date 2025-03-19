import 'package:flutter/material.dart';
import 'package:nirvanafit/features/sounds_theraphy/model/binaural_beats_model.dart';
import 'package:nirvanafit/features/sounds_theraphy/model/soothing_music_model.dart';
import '../../data/binaural_beats_contents.dart';
import '../../data/faq_contents.dart';
import '../../data/soothing_music_contents.dart';
import '../../model/faq_model.dart';

class ContentFilterProvider extends ChangeNotifier {
  List<FAQModel> _filteredFaq = faqContentsList;
  List<BinauralBeatsModel> _filteredBinauralBeatsList = binauralBeatsContentsList;
  List<SoothingMusicModel> _filteredSoothingMusicList = soothingMusicContentsList;

  //Getter
  List<FAQModel> get filteredFaq => _filteredFaq;
  List<BinauralBeatsModel> get filteredBinauralBeatsList => _filteredBinauralBeatsList;
  List<SoothingMusicModel> get filteredSoothingMusicList => _filteredSoothingMusicList;

  //Setter
  set filteredFaq(List<FAQModel> value) {
    _filteredFaq = value;
    notifyListeners();
  }
  set filteredBinauralBeatsList(List<BinauralBeatsModel> value) {
    _filteredBinauralBeatsList = value;
    notifyListeners();
  }
  set filteredSoothingMusicList(List<SoothingMusicModel> value) {
    _filteredSoothingMusicList = value;
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
        .where((bb)=>bb.title.toLowerCase().contains(text.toLowerCase())).toList();
  }
  void filterSoothingMusicList(String text) {
    filteredSoothingMusicList = soothingMusicContentsList
        .where((sm)=>sm.title.toLowerCase().contains(text.toLowerCase())).toList();
  }

}
