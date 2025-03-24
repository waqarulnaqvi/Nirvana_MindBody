import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:just_audio/just_audio.dart';
import 'package:nirvanafit/core/constants/prefs_keys.dart';
import 'package:nirvanafit/core/local/prefs_helper.dart';
import '../../../../core/local/db_helper.dart';
import '../../data/audio_player_contents.dart';

class AudioPlayerProvider extends ChangeNotifier {
  final AudioPlayer _player = AudioPlayer();
  bool _isAnimateController = true;
  bool _isPlaying = false;
  bool _isRunBackground = false;
  bool _ignoreController = false;
  RepeatMode _repeatMode = RepeatMode.repeatFalse;
  Duration _position = Duration.zero;
  double _playbackSpeed = 1.0;
  final List<double> _speedOptions = [0.25, 0.5, 1.0, 1.5, 1.75, 2.0];
  final List _playlist = audioPlayerList;
  int _currentIndex = 0;
  DBHelper? dbHelper;
  PrefsHelper? prefsHelper;
  Duration _timeSpend = Duration.zero;
  Duration _totalTimeSpend = Duration.zero;
  late List<Map<String,dynamic>> _userAudioReport;
  Timer? _timer;
  bool _isInternetConnected = true;
  final internetChecker = InternetConnectionChecker.createInstance();
  PageController _pageController = PageController();
  late final ConcatenatingAudioSource _allAudio;

  //
  AudioPlayerProvider() {
    dbHelper = DBHelper();
    prefsHelper = PrefsHelper();
    _fetchAudioReport();
    _init();
    _initializeTotalTimeSpend();
    _monitorInternetConnection();
  }

  // Check internet connection
  void _monitorInternetConnection() {
   internetChecker.onStatusChange.listen((status){
     _isInternetConnected =status==InternetConnectionStatus.connected;
   });
  }



  Future<void> _initializeTotalTimeSpend() async {
    final storedTime = await prefsHelper?.getStringValue(PrefsKeys.totalTimeSpend);

    if (storedTime != null && storedTime.isNotEmpty) {
      final parts = storedTime.split(':').map(int.tryParse).toList();

      if (parts.length == 3 && parts.every((e) => e != null)) {
        _totalTimeSpend = Duration(hours: parts[0]!, minutes: parts[1]!, seconds: parts[2]!);
      }
      else{
        _totalTimeSpend = Duration.zero;
      }

    }

    notifyListeners();
  }

  Future<void> _init() async {
    _allAudio = ConcatenatingAudioSource(
      children: audioPlayerList
          .map((e) => AudioSource.uri(Uri.parse(e.audioUrl)))
          .toList(),
    );

    await _player.setAudioSource(_allAudio);
    _player.setLoopMode(LoopMode.off);
    _player.setSpeed(_playbackSpeed);
    playerPosition();

    // Listen for changes in the current playing index

    // Ensure we listen only when required

    _player.sequenceStateStream.listen((sequenceState) {
      if (sequenceState?.currentIndex != null && !_ignoreController) {
        _currentIndex = sequenceState!.currentIndex;

        if (_pageController.hasClients) {
          if (_isAnimateController) {
            _pageController.animateToPage(_currentIndex,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn);
          }
          else {
            _pageController.jumpToPage(_currentIndex);
          }
        }
        // if (!_ignoreController) {
        //   _ignoreController = true; // Prevent multiple subscriptions
        // }
      }
    });

    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _player.stop(); // Stop the audio player
    _player.dispose(); // Dispose of the audio player
    _pageController.dispose(); // Dispose of the PageController
    super.dispose();
  }

  //Local DB SqFLite
  void addAudioToLocalDB()
  {
    dbHelper!.addAudio(title: audioPlayerList[currentIndex].title , time: _timeSpend, imageUrl: audioPlayerList[currentIndex].imageUrl);
    prefsHelper!.setStringValue(PrefsKeys.totalTimeSpend, _totalTimeSpend.toString().split(".")[0]);
    _timeSpend = Duration.zero;
  }

  Future<void> _fetchAudioReport() async {
    _userAudioReport =await dbHelper!.fetchAudio();
    notifyListeners();
  }



  // Getter:
  bool get isInternetConnected => _isInternetConnected;

  bool get isAnimateController => _isAnimateController;

  Duration get totalAudioTime => _totalTimeSpend;

  bool get ignoreController => _ignoreController;

  List<Map<String,dynamic>> get userAudioReport => _userAudioReport;

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

  set isInternetConnected(bool value) {
    _isInternetConnected = value;
    notifyListeners();
  }

  set ignoreController(bool value) {
    _ignoreController = value;
    notifyListeners();
  }

  set isAnimateController(bool value) {
    _isAnimateController = value;
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

  // void changeAudioIndex([int index= 0]) async {
  //   try {
  //     if(index>=0 && index<_playlist.length){
  //       _currentIndex = index;
  //       await _player.seek(Duration.zero, index: index);
  //     }
  //     // await _audioHandler.setAudio(_playlist[index].audioUrl);
  //     // await _player.setUrl(_playlist[index].audioUrl);
  //   }
  //   catch (e) {
  //     if(kDebugMode) {
  //       print("Error: $e");
  //     }
  //   }
  //   notifyListeners();
  // }

  void skipForward([Duration duration = const Duration(seconds: 10)]) {
    if (_player.duration == null) return;
    final newPosition = _position + duration;
    _player.seek(
        newPosition > _player.duration! ? _player.duration! : newPosition);
  }

  void skipBackward([Duration duration = const Duration(seconds: 10)]) {
    if (_player.duration == null) return;
    final newPosition = _position - duration;
    _player.seek(newPosition < Duration.zero ? Duration.zero : newPosition);
  }

  void updateAudio(int index) {
    _currentIndex = index;
    _player.seek(Duration.zero, index: index); //Change the audio
    _position = Duration.zero;
  }

  void newAudio(int index) {
    // print("New Audio Index: $index");
    if (_isPlaying) {
      _isPlaying = false;
      _player.stop();
      notifyListeners();
      Future.delayed(Duration(milliseconds: 500), () {
        _isPlaying = true;
        updateAudio(index);
        _player.play();
        addAudioToLocalDB();
        _fetchAudioReport();
        notifyListeners();
      });
    } else {
      updateAudio(index);
    }
    // _isPlaying = true;
    notifyListeners();
  }


  void togglePlay() {
    if (_isPlaying) {
      _timer?.cancel();
      _player.pause();
      _isPlaying = false;
      // _audioHandler.play();
    } else {
      _player.play();
      // _audioHandler.pause();
      _isPlaying = true;
      _timer =Timer.periodic(Duration(seconds: 1), (timer) {
        _timeSpend += Duration(seconds: 1);
        _totalTimeSpend += Duration(seconds: 1);
      });
    }
    try {
      addAudioToLocalDB();
      _fetchAudioReport();
      // print("Fetched audio report: $_userAudioReport");
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching audio: $e");
      }
    }
    notifyListeners();
  }

  void backgroundPlayer()  {
    {
      _isRunBackground = false;
      _isPlaying = false;
      _player.stop();
      _fetchAudioReport();
      // _player.dispose();
      notifyListeners();
    }
  }

  void previousAudio() {
    addAudioToLocalDB();
    _fetchAudioReport();
    if (_ignoreController ) {
      _ignoreController = false;
    }
    if(!_isAnimateController){
      _isAnimateController = true;
    }

    if (_currentIndex != 0) {
      _currentIndex = (_currentIndex - 1).clamp(0, _playlist.length - 1);
      newAudio(currentIndex);
      notifyListeners();
    }
  }

  void nextAudio() {
    addAudioToLocalDB();
    _fetchAudioReport();
    if (_ignoreController ) {
      _ignoreController = false;
    }
    if(!_isAnimateController){
      _isAnimateController = true;
    }
    if (_currentIndex != _playlist.length - 1) {
      _currentIndex = (_currentIndex + 1).clamp(0, _playlist.length - 1);
      newAudio(currentIndex);
      notifyListeners();
    }
  }

  void currentRepeatMode(BuildContext context) {
    switch (_repeatMode) {
      case RepeatMode.repeatFalse:
        _repeatMode = RepeatMode.repeatAll;
        _player.setLoopMode(LoopMode.all);
        IconSnackBar.show(context,
            label: "Repeat all mode is enabled!",
            snackBarType: SnackBarType.success);
        break;
      case RepeatMode.repeatAll:
        _repeatMode = RepeatMode.repeatOnce;
        _player.setLoopMode(LoopMode.one);
        IconSnackBar.show(context,
            label: "Repeat one mode is enabled!",
            snackBarType: SnackBarType.success);

        break;
      case RepeatMode.repeatOnce:
        _repeatMode = RepeatMode.repeatFalse;
        _player.setLoopMode(LoopMode.off);
        IconSnackBar.show(context,
            label: "Repeat mode is off!", snackBarType: SnackBarType.success);

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
