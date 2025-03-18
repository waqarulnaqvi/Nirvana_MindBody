import 'package:nirvanafit/core/constants/constants.dart';
import 'package:nirvanafit/features/sounds_theraphy/data/soothing_music_contents.dart';
import 'package:nirvanafit/features/sounds_theraphy/model/audio_player_model.dart';


final List<AudioPlayerModel> audioPlayerList = List.generate(
  soothingMusicContentsList.length,
      (index) => AudioPlayerModel(
    title: soothingMusicContentsList[index].title,
    subtitle: Constants.appTitle,
    audioUrl: index % 2 == 0
        ? "assets/audio/alertnessandenergybeta.mp3"
        : "assets/audio/jazzmusic.mp3",
    imageUrl: soothingMusicContentsList[index].image,
  ),
);
