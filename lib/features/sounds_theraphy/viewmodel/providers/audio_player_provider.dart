
import 'package:flutter/material.dart';

class AudioPlayerProvider extends ChangeNotifier{
  bool _isPlaying = false;
  RepeatMode _repeatMode = RepeatMode.repeatFalse;
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;
  double _playbackSpeed = 1.0;
  final List<double> _speedOptions = [ 0.5, 1.0,  1.5, 1.75, 2.0];
  // Getter:
  bool get isPlaying => _isPlaying;
  RepeatMode get repeatMode => _repeatMode;
  Duration get position => _position;
  Duration get duration => _duration;
  double get playbackSpeed => _playbackSpeed;
  List<double> get speedOptions => _speedOptions;

  // Setter:
  set isPlaying(bool value){
    _isPlaying = value;
    notifyListeners();
  }
  set repeatMode(RepeatMode value){
    _repeatMode = value;
    notifyListeners();
  }
  set position(Duration value){
    _position = value;
    notifyListeners();
  }
  set duration(Duration value){
    _duration = value;
    notifyListeners();
  }
  set playbackSpeed(double value){
    _playbackSpeed = value;
    notifyListeners();
  }
}



//Enum
enum RepeatMode{
  repeatFalse,
  repeatAll,
  repeatOnce
}