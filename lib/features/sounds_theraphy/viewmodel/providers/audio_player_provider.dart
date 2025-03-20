import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
// import 'package:audio_service/audio_service.dart';
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

  //
  // AudioPlayerProvider() {
  //   _init();
  // }
  //
  // Future<void> _init() async {
  //   _audioHandler = await AudioService.init(
  //     builder: () => MyAudioHandler(),
  //     config: const AudioServiceConfig(
  //       androidNotificationChannelId: 'com.example.audio',
  //       androidNotificationChannelName: 'Audio Playback',
  //       androidNotificationOngoing: true,
  //     ),
  //   );
  // }


  @override
  void dispose() {
    _player.dispose(); // Dispose of the audio player
    _pageController.dispose(); // Dispose of the PageController
    super.dispose();
  }


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
    try {
      // await _audioHandler.setAudio(_playlist[index].audioUrl);
      await _player.setUrl(_playlist[index].audioUrl);
    }
    catch (e) {
      if(kDebugMode) {
        print("Error: $e");
      }
    }
    notifyListeners();
  }

  void skipForward([Duration duration = const Duration(seconds: 10)]) {
    if (_player.duration == null) return;
    final newPosition = _position + duration;
    _player.seek(newPosition > _player.duration! ? _player.duration! : newPosition);
  }

  void skipBackward([Duration duration = const Duration(seconds: 10)]) {
    if (_player.duration == null) return;
    final newPosition = _position - duration;
    _player.seek(newPosition < Duration.zero ? Duration.zero : newPosition);
  }




  void newAudio(int index)  {
    print("New Audio Index: $index");
    if (_isPlaying) {
      _isPlaying = false;
      _player.stop();
      notifyListeners();
      Future.delayed(Duration(milliseconds: 500), () {
        _isPlaying = true;
        notifyListeners();
      });
    }
    initAudio(index);
    _position = Duration.zero;
    _player.play();
    _currentIndex = index;
    // _isPlaying = true;
    notifyListeners();
  }

  void togglePlay() {
    if (_isPlaying) {
      _player.pause();
      _isPlaying = false;
      // _audioHandler.play();
    } else {
      _player.play();
      // _audioHandler.pause();
      _isPlaying = true;
    }
    notifyListeners();
  }

  void backgroundPlayer(){
    {
      _isRunBackground=false;
      _isPlaying=false;
      _player.stop();
      // _player.dispose();
      notifyListeners();
    }
  }

  void previousAudio(){
    if(_currentIndex != 0){
      _currentIndex = (_currentIndex - 1).clamp(0, _playlist.length - 1);
      pageController.jumpToPage(_currentIndex);
      newAudio(currentIndex);
      notifyListeners();
    }
  }

  void nextAudio() {
    if(_currentIndex != _playlist.length - 1) {
      _currentIndex = (_currentIndex + 1).clamp(0, _playlist.length - 1);
      pageController.jumpToPage(_currentIndex);
      print("Next Audio Index: $currentIndex");
      newAudio(currentIndex);
      notifyListeners();
    }
  }

  void currentRepeatMode() {
    switch (_repeatMode) {
      case RepeatMode.repeatFalse:
        _repeatMode = RepeatMode.repeatAll;
        _player.setLoopMode(LoopMode.all);
        break;
      case RepeatMode.repeatAll:
        _repeatMode = RepeatMode.repeatOnce;
        _player.setLoopMode(LoopMode.one);
        break;
      case RepeatMode.repeatOnce:
        _repeatMode = RepeatMode.repeatFalse;
        _player.setLoopMode(LoopMode.off);
        break;
    }
    notifyListeners();
  }

  void changeSpeed(double speed) {
    _playbackSpeed = speed;
    _player.setSpeed(speed);
    notifyListeners();
  }
}

//Enum
enum RepeatMode { repeatFalse, repeatAll, repeatOnce }




//
// class MyAudioHandler extends BaseAudioHandler with QueueHandler, SeekHandler {
//   final AudioPlayer _player = AudioPlayer();
//
//   MyAudioHandler() {
//     _player.playbackEventStream.listen((event) {
//       // playbackState.add(_player.playbackState);
//     });
//   }
//
//   @override
//   Future<void> play() async {
//     _player.play();
//   }
//
//   @override
//   Future<void> pause() async {
//     _player.pause();
//   }
//
//   @override
//   Future<void> stop() async {
//     _player.stop();
//   }
//
//   @override
//   Future<void> seek(Duration position) async {
//     _player.seek(position);
//   }
//
//   @override
//   Future<void> addQueueItem(MediaItem mediaItem) async {
//     queue.value = [...queue.value, mediaItem];
//   }
//
//   Future<void> setAudio(String url) async {
//     await _player.setUrl(url);
//   }
// }
