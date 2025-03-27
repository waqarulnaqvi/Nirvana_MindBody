import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nirvanafit/core/theme/app_gradients.dart';
import 'package:nirvanafit/features/sounds_theraphy/model/audio_player_model.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../viewmodel/providers/audio_player_provider.dart';

class VideoPlayerPage extends StatefulWidget {
  final int index;

  const VideoPlayerPage({super.key, required this.index});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  @override
  void initState() {
    super.initState();
    providerInitialize();
  }

  void providerInitialize() {
    final provider = Provider.of<AudioPlayerProvider>(context, listen: false);
    if (widget.index != provider.currentIndex) {
      provider.currentIndex = widget.index;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Orientation o = MediaQuery.of(context).orientation;
    final double w = MediaQuery.of(context).size.width;
    final double h = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        if (o.name == "landscape") {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ]);
          return false; // Prevents screen from popping
        }
        return true; // Allows back navigation if not in landscape
      },
      child: Scaffold(
          body: Consumer<AudioPlayerProvider>(
        builder: (context, provider, child) {
            final current=provider.playlist[widget.index] as AudioPlayerModel;
          return  Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: w,
                height: (o.name != "portrait") ? h : 300,
                child: YoutubeVideoPlayer(
                    videoId: current.youtubeUrl??'')),
            if (o.name == "portrait")
              Card(
                margin: const EdgeInsets.all(15),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                    width: w,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: AppGradients.skyBlueMyAppGradient),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Title : ${current.title}",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Text(
                          "Author: ${current.subtitle}",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    )),
              ),
          ],
        );
        }
      )),
    );
  }
}

class YoutubeVideoPlayer extends StatefulWidget {
  final String videoId;

  const YoutubeVideoPlayer({super.key, required this.videoId});

  @override
  State<YoutubeVideoPlayer> createState() => _YoutubeVideoPlayerState();
}

class _YoutubeVideoPlayerState extends State<YoutubeVideoPlayer> {
  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();
    String videoId = widget.videoId;

    if (videoId.contains("youtube.com/live")) {
      videoId = videoId.split("/live/")[1].split("?")[0];
    } else if (videoId.contains("youtu.be")) {
      videoId = videoId.split("youtu.be/")[1].split("?")[0];
    } else {
      int equalIndex = videoId.lastIndexOf("=");
      videoId = videoId.substring(equalIndex + 1);
    }

    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        isLive: false,
        autoPlay: true,
        // mute: true,
      ),
    );
    _controller!.addListener(() {
      // _controller!.cue(videoId);
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).colorScheme;
    return YoutubePlayer(
      controller: _controller!,
      showVideoProgressIndicator: true,
      progressIndicatorColor: theme.primary,
      progressColors: ProgressBarColors(
        playedColor: theme.primary,
        handleColor: theme.primary,
        bufferedColor: theme.primary,
      ),
      onEnded: (metaData) {},
    );
  }
}
