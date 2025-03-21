import 'package:flutter/material.dart';
import 'package:nirvanafit/core/constants/static_assets.dart';
import 'package:nirvanafit/core/theme/app_styles.dart';
import 'package:nirvanafit/features/sounds_theraphy/viewmodel/providers/audio_player_provider.dart';
import 'package:nirvanafit/shared/view/widgets/global_widgets.dart';
import 'package:nirvanafit/shared/view/widgets/reusable_app_bar.dart';
import 'package:provider/provider.dart';
import '../../../../shared/view/widgets/buttons/reusable_image_button.dart';
import '../widgets/rotating_audio_disk.dart';

class AudioPlayerPage extends StatefulWidget {
  final int index;

  const AudioPlayerPage({super.key, this.index = 0});

  @override
  State<AudioPlayerPage> createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  @override
  void initState() {
    super.initState();
    providerInitialize();
    // _player.setAsset(StaticAssets.soothingMusicMp3);
  }

  void providerInitialize() {
    final provider = Provider.of<AudioPlayerProvider>(context, listen: false);
    if (widget.index != provider.currentIndex) {
      provider.playerPosition();
      provider.newAudio(widget.index);
      provider.currentIndex = widget.index;
      provider.isAnimateController =false;
      provider.pageController = PageController(initialPage: widget.index);
    } else {
      provider.pageController = PageController(initialPage: widget.index);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final double w = MediaQuery.of(context).size.width;
    final provider = Provider.of<AudioPlayerProvider>(context);
    final player = provider.player;
    final currentIndex = provider.currentIndex;
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
                provider.playlist[currentIndex].title,
                style: AppStyles.descriptionPrimary(
                    context: context,
                    color: theme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              spacerH(5),
              Text(
                provider.playlist[currentIndex].subtitle,
                style: AppStyles.headingPrimary(
                    context: context,
                    color: theme.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              spacerH(40),
              SizedBox(
                height: w * 0.7,
                child: PageView.builder(
                  controller: provider.pageController,
                  itemCount: provider.playlist.length,
                  onPageChanged: (index) {
                    provider.ignoreController = true;
                    provider.currentIndex = index;
                    provider.playerPosition();
                    provider.newAudio(index);
                  },
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: RotatingAudioDisk(
                        image: provider.playlist[index].imageUrl,
                      ),
                    );
                  },
                ),
              ),

              // SizedBox(
              //   height: w * 0.7,
              //   child: ListView.builder(
              //     padding: const EdgeInsets.symmetric(horizontal: 40),
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: (context, index) {
              //       return Padding(
              //         padding: const EdgeInsets.only(right: 10),
              //         child: RotatingAudioDisk(
              //           image: audioPlayerList[index].imageUrl,
              //         ),
              //       );
              //     },
              //     itemCount: audioPlayerList.length,
              //   ),
              // ),
              spacerH(40),
              Slider(
                min: 0,
                max: (player.duration?.inSeconds ?? 1).toDouble(),
                value: player.position.inSeconds.toDouble(),
                onChanged: (value) async {
                  player.seek(Duration(seconds: value.toInt()));
                  provider.position = Duration(seconds: value.toInt());
                },
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(player.position.toString().split('.')[0],
                        style: AppStyles.descriptionPrimary(
                            context: context,
                            color: theme.primary,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    Text(player.duration?.toString().split('.')[0] ?? '0:00:00',
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
              audioController(provider),
            ],
          ),
        );
      }),
    );
  }

  Widget audioController(AudioPlayerProvider provider) {
    final theme = Theme.of(context).colorScheme;
    final color = theme.onSurface;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Speedometer Icon
          ReusableImageButton(
            onTap: () {
              final RenderBox renderBox = context.findRenderObject()
                  as RenderBox; // Get button position
              final Offset position = renderBox.localToGlobal(Offset.zero);
              final Size size = renderBox.size;

              showMenu<double>(
                context: context,
                position: RelativeRect.fromLTRB(position.dx,
                    position.dy + size.height, position.dx + size.width, 0),
                items: provider.speedOptions
                    .map((speed) => PopupMenuItem<double>(
                          onTap: () {
                            provider.changeSpeed(speed);
                          },
                          value: speed,
                          child: Text(
                            speed == 1.0 ? "${speed}x  (Normal)" : "${speed}x",
                            style: AppStyles.descriptionPrimary(
                                context: context,
                                color: speed == provider.playbackSpeed
                                    ? theme.primary
                                    : color,
                                fontWeight: FontWeight.bold),
                          ),
                        ))
                    .toList(),
              );
            },
            url: StaticAssets.speedometerIconAudioPlayer,
          ),
          spacerW(10),
          
          ReusableImageButton(
              onTap: provider.skipBackward,
              url: StaticAssets.skipBackwardIconAudioPlayer,
              width: 35),
          spacerW(15),

          // Previous Audio Icon
          ReusableImageButton(
              onTap: provider.previousAudio,
              url: StaticAssets.previousIconAudioPlayer,
              color: provider.currentIndex == 0 ? Colors.grey : color,),
          spacerW(15),

          // Play Audio Icon
          ReusableImageButton(
            onTap: () {
              provider.togglePlay();
              if (!provider.isRunBackground) {
                provider.isRunBackground = true;
              }
            },
            url: provider.isPlaying
                ? StaticAssets.pauseIconAudioPlayer
                : StaticAssets.playIconAudioPlayer,
            width: 70,
          ),
          spacerW(15),

          // Forward Audio Icon
          ReusableImageButton(
              onTap: provider.nextAudio,
              url: StaticAssets.forwardIconAudioPlayer,
              color: provider.currentIndex == provider.playlist.length - 1
                  ? Colors.grey
                  : color),
          spacerW(15),

          // Skip Forward
          ReusableImageButton(
              onTap: provider.skipForward,
              url: StaticAssets.skipForwardIconAudioPlayer,
              width: 35),
          spacerW(10),

          // Repeat Mode
          ReusableImageButton(
            onTap: () => provider.currentRepeatMode(context),
            url: provider.repeatMode == RepeatMode.repeatFalse
                ? StaticAssets.repeatFalseIconAudioPlayer
                : provider.repeatMode == RepeatMode.repeatAll
                    ? StaticAssets.repeatAllIconAudioPlayer
                    : StaticAssets.repeatOnceIconAudioPlayer,
            width: 25,
          )
        ],
      ),
    );
  }
}

class ReusableIconButton extends StatelessWidget {
  const ReusableIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
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

// @override
// void dispose() {
//   _player.dispose();
//   super.dispose();
// }

// if(index==provider.playlist.length){
//     pageController.jumpToPage(0);
// }
// provider.player.setUrl(provider.playlist[index].audioUrl);

// .then((speed) {
// if (speed != null) {
//   Handle speed selection
// print("Selected speed: $speed");
// }
// });
