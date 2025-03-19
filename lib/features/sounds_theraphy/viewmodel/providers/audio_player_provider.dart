import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../data/audio_player_contents.dart';

class AudioPlayerProvider extends ChangeNotifier {
  final AudioPlayer _player = AudioPlayer();
  bool _isPlaying = false;
  bool _isRunBackground = false;
  RepeatMode _repeatMode = RepeatMode.repeatFalse;
  Duration _position = Duration.zero;
  double _playbackSpeed = 1.0;
  final List<double> _speedOptions = [0.25, 0.5, 1.0, 1.5, 1.75, 2.0];
  final List _playlist = audioPlayerList;
  int _currentIndex = 0;
  PageController _pageController = PageController();


  // Getter:
  int get currentIndex => _currentIndex;

  bool get isRunBackground => _isRunBackground;

  AudioPlayer get player => _player;

  bool get isPlaying => _isPlaying;

  RepeatMode get repeatMode => _repeatMode;

  Duration get position => _position;

  double get playbackSpeed => _playbackSpeed;

  List<double> get speedOptions => _speedOptions;

  List get playlist => _playlist;

  PageController get pageController => _pageController;

  // Setter:
  set isRunBackground(bool value) {
    _isRunBackground = value;
    notifyListeners();
  }

  set isPlaying(bool value) {
    _isPlaying = value;
    notifyListeners();
  }

  set pageController(PageController value) {
    _pageController = value;
    notifyListeners();
  }

  set currentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  set repeatMode(RepeatMode value) {
    _repeatMode = value;
    notifyListeners();
  }

  set position(Duration value) {
    _position = value;
    notifyListeners();
  }

  set playbackSpeed(double value) {
    _playbackSpeed = value;
    notifyListeners();
  }

  //Methods
  void playerPosition() {
    _player.positionStream.listen((Duration newPosition) {
      _position = newPosition;
      notifyListeners();
    });
  }

  void initAudio([int index= 0]) async {
    await _player.setUrl(_playlist[index].audioUrl);
    notifyListeners();
  }



  void newAudio(int index)  {
    if (_isPlaying) {
      _isPlaying = false;
      _player.stop();
    }
    _isPlaying = true;
    initAudio(index);
    _position = Duration.zero;
    _player.play();
    _currentIndex = index;
    _isPlaying = true;
    notifyListeners();
  }
}

//Enum
enum RepeatMode { repeatFalse, repeatAll, repeatOnce }
