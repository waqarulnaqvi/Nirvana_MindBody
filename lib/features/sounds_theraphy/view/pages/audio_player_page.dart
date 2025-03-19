import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:nirvanafit/core/constants/static_assets.dart';
import 'package:nirvanafit/core/theme/app_styles.dart';
import 'package:nirvanafit/features/sounds_theraphy/viewmodel/providers/audio_player_provider.dart';
import 'package:nirvanafit/shared/view/widgets/global_widgets.dart';
import 'package:nirvanafit/shared/view/widgets/reusable_app_bar.dart';
import 'package:provider/provider.dart';

import '../widgets/rotating_audio_disk.dart';

class AudioPlayerPage extends StatefulWidget {
  final int index;
  const AudioPlayerPage({super.key,this.index=0});

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
  provider.playerPosition();
  provider.initAudio(widget.index);
  provider.currentIndex = widget.index;
  provider.pageController=PageController(initialPage: widget.index);
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
                    provider.currentIndex = index;
                    // if(index==provider.playlist.length){
                    //     pageController.jumpToPage(0);
                    // }
                    // provider.player.setUrl(provider.playlist[index].audioUrl);
                    provider.playerPosition();
                    provider.newAudio(index);

                  },
                  itemBuilder: (_,index){
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
                    Text(player.position.toString().split('.')[0] ,
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
    final player = provider.player;
    final pageController = provider.pageController;
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
                    player.setSpeed(speed);
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
              );
                  // .then((speed) {
                // if (speed != null) {
                //   Handle speed selection
                  // print("Selected speed: $speed");
                // }
              // });
            },
            child: staticImage(
                assetName: StaticAssets.speedometerIconAudioPlayer,
                color: color,
                width: 30),
          ),

          spacerW(15),
          TextButton(
              onPressed: () {
                provider.currentIndex = (provider.currentIndex - 1).clamp(0, provider.playlist.length - 1);
                pageController.jumpToPage(provider.currentIndex);
                provider.newAudio(provider.currentIndex);
              },
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

                provider.isPlaying ? player.play() : player.pause();
              },
              child: staticImage(
                  assetName: provider.isPlaying
                      ? StaticAssets.pauseIconAudioPlayer
                      : StaticAssets.playIconAudioPlayer,
                  color: color,
                  width: 70)),
          spacerW(5),
          TextButton(
              onPressed: () {
                provider.currentIndex = (provider.currentIndex + 1).clamp(0, provider.playlist.length - 1);
                pageController.jumpToPage(provider.currentIndex);
                provider.newAudio(provider.currentIndex);
              },
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

                player.setLoopMode(provider.repeatMode == RepeatMode.repeatFalse
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

// @override
// void dispose() {
//   _player.dispose();
//   super.dispose();
// }