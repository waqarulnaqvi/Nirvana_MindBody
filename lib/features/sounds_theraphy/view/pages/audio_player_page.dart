import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:nirvanafit/core/constants/static_assets.dart';
import 'package:nirvanafit/core/theme/app_styles.dart';
import 'package:nirvanafit/features/sounds_theraphy/data/audio_player_contents.dart';
import 'package:nirvanafit/features/sounds_theraphy/viewmodel/providers/audio_player_provider.dart';
import 'package:nirvanafit/shared/view/widgets/global_widgets.dart';
import 'package:nirvanafit/shared/view/widgets/reusable_app_bar.dart';
import 'package:provider/provider.dart';

import '../widgets/rotating_audio_disk.dart';

class AudioPlayerPage extends StatefulWidget {
  const AudioPlayerPage({super.key});

  @override
  State<AudioPlayerPage> createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  final AudioPlayer _player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _player.setUrl('https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/soothing%20music%2Flofihiphopmusic.mp3?alt=media&token=abe32a93-68d8-4ae1-8f83-ff28bd6f7ceb');
    // _player.setAsset(StaticAssets.soothingMusicMp3);
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: ReusableAppBar(
        text: 'Audio Player',
        isCenterText: false,
      ),
      body: Consumer<AudioPlayerProvider>(builder: (context, provider, child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              spacerH(30),
              Text(
                'Indian Classic Music',
                style: AppStyles.descriptionPrimary(
                    context: context,
                    color: theme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              spacerH(5),
              Text(
                'Nirvana MindBody',
                style: AppStyles.headingPrimary(
                    context: context,
                    color: theme.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              spacerH(40),
              SizedBox(
                height: w * 0.7,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: RotatingAudioDisk(
                        image: audioPlayerList[index].imageUrl,
                      ),
                    );
                  },
                  itemCount: audioPlayerList.length,
                ),
              ),
              spacerH(40),
            Slider(
              min: 0,
              max: (_player.duration?.inSeconds ?? 1).toDouble(),
              value: provider.position.inSeconds
                  .clamp(0, (_player.duration?.inSeconds ?? 0))
                  .toDouble(),
              onChanged: (value) async {
                _player.seek(Duration(seconds: value.toInt()));
              },
            ),

            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('0:00',
                        style: AppStyles.descriptionPrimary(
                            context: context,
                            color: theme.primary,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    Text(_player.duration?.toString().split('.')[0] ?? '0:00:00',
                        // "${_player.duration?.inMinutes.toString().padLeft(2, '0') ?? "00"}:"
                        //     "${_player.duration?.inSeconds.toString()?? "00"}",

                        style: AppStyles.descriptionPrimary(
                            context: context,
                            color: theme.primary,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              audioController( provider),
            ],
          ),
        );
      }),
    );
  }

  Widget audioController( AudioPlayerProvider provider) {
    final theme = Theme.of(context).colorScheme;
    final color = theme.onSurface;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            onTap: () {
              final RenderBox renderBox =
              context.findRenderObject() as RenderBox; // Get button position
              final Offset position = renderBox.localToGlobal(Offset.zero);
              final Size size = renderBox.size;

              showMenu<double>(
                context: context,
                position: RelativeRect.fromLTRB(
                    position.dx, position.dy + size.height, position.dx + size.width, 0),
                items: provider.speedOptions
                    .map((speed) => PopupMenuItem<double>(
                  onTap: () {
                    provider.playbackSpeed = speed;
                    _player.setSpeed(speed);
                  },
                  value: speed,
                  child: Text(speed == 1.0
                      ? "${speed}x  (Normal)"
                      :
                    "${speed}x",
                    style: AppStyles.descriptionPrimary(
                        context: context,
                        color:speed==provider.playbackSpeed? theme.primary:color,
                        fontWeight: FontWeight.bold),
                  ),
                ))
                    .toList(),
              ).then((speed) {
                if (speed != null) {
                  // Handle speed selection
                  print("Selected speed: $speed");
                }
              });
            },
            child: staticImage(
                assetName: StaticAssets.speedometerIconAudioPlayer,
                color: color,
                width: 30),
          ),

          spacerW(15),
          TextButton(
              onPressed: () {},
              child: staticImage(
                  assetName: StaticAssets.previousIconAudioPlayer,
                  color: color,
                  width: 30)),
          spacerW(5),
          TextButton(
              onPressed: () {
                provider.isPlaying
                    ? provider.isPlaying = false
                    : provider.isPlaying = true;

                provider.isPlaying ? _player.play() : _player.pause();
              },
              child: staticImage(
                  assetName: provider.isPlaying
                      ? StaticAssets.pauseIconAudioPlayer
                      : StaticAssets.playIconAudioPlayer,
                  color: color,
                  width: 70)),
          spacerW(5),
          TextButton(
              onPressed: () {},
              child: staticImage(
                  assetName: StaticAssets.forwardIconAudioPlayer,
                  color: color,
                  width: 30)),
          spacerW(15),
          InkWell(
              onTap: () {
                provider.repeatMode =
                    provider.repeatMode == RepeatMode.repeatFalse
                        ? RepeatMode.repeatAll
                        : provider.repeatMode == RepeatMode.repeatAll
                            ? RepeatMode.repeatOnce
                            : RepeatMode.repeatFalse;

                _player.setLoopMode(provider.repeatMode == RepeatMode.repeatFalse
                    ? LoopMode.off
                    : provider.repeatMode == RepeatMode.repeatAll
                        ? LoopMode.all
                        : LoopMode.one);
              },
              child: staticImage(
                  assetName: provider.repeatMode == RepeatMode.repeatFalse
                      ? StaticAssets.repeatFalseIconAudioPlayer
                      : provider.repeatMode == RepeatMode.repeatAll
                          ? StaticAssets.repeatAllIconAudioPlayer
                          : StaticAssets.repeatOnceIconAudioPlayer,
                  color: color,
                  width: 25)),
        ],
      ),
    );
  }
}

// StreamBuilder<PlayerState>(
//   stream: _player.playerStateStream,
//   builder: (context, snapshot) {
//     final playing = snapshot.data?.playing ?? false;
//     return IconButton(
//       icon: Icon(playing ? Icons.pause : Icons.play_arrow),
//       iconSize: 64,
//       onPressed: () {
//         if (playing) {
//           _player.pause();
//         } else {
//           _player.play();
//         }
//       },
//     );
//   },
// ),
