import 'package:nirvanafit/core/local/db_helper.dart';

class AudioModel {
  final String title;
  final String time;
  final String imageUrl;

  AudioModel({
    required this.title,
    required this.time,
    required this.imageUrl,
  });

  factory AudioModel.fromMap(Map<String, dynamic> map) {
    return AudioModel(
      title: map[DBHelper.columnAudioTitle],
      time: map[DBHelper.columnAudioTime],
      imageUrl: map[DBHelper.columnAudioImageUrl],
    );
  }
}
