import 'package:flutter/material.dart';
import 'package:nirvanafit/core/constants/static_assets.dart';
import 'package:nirvanafit/core/theme/app_styles.dart';
import 'package:nirvanafit/features/sounds_theraphy/view/widgets/animated_text.dart';
import 'package:nirvanafit/features/sounds_theraphy/viewmodel/providers/audio_player_provider.dart';
import 'package:nirvanafit/shared/view/widgets/global_widgets.dart';
import 'package:nirvanafit/shared/view/widgets/reusable_app_bar.dart';
import 'package:nirvanafit/shared/view/widgets/reusable_heading.dart';
import 'package:provider/provider.dart';
import '../../../../shared/view/widgets/buttons/reusable_image_button.dart';
import '../widgets/rotating_audio_disk.dart';

class AudioPlayerPage extends StatefulWidget {
  final int index;
  final bool isAppBar;

  const AudioPlayerPage({super.key, this.index = 0, this.isAppBar=true});

  @override
  State<AudioPlayerPage> createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      providerInitialize();
    });
    // _player.setAsset(StaticAssets.soothingMusicMp3);
  }

  void providerInitialize() {
    final provider = Provider.of<AudioPlayerProvider>(context, listen: false);
    if (widget.index != provider.currentIndex) {
      provider.playerPosition();
      provider.newAudio(widget.index);
      provider.currentIndex = widget.index;
      provider.isAnimateController = false;
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
      appBar: widget.isAppBar? ReusableAppBar(
        text: 'Audio Player',
        isCenterText: false,
      ):null,
      body: Consumer<AudioPlayerProvider>(builder: (context, provider, child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              spacerH(30),
              AnimatedText(
                text: "${provider.playlist[currentIndex].title}",
                  style: AppStyles.descriptionPrimary(
                    context: context,
                    color: theme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ), oldFontSize: 20, newFontSize: 22,),
              spacerH(5),

              AnimatedText(
                text: "${provider.playlist[currentIndex].subtitle}",
                style: AppStyles.headingPrimary(
                    context: context,
                    color: theme.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold), oldFontSize: 18, newFontSize: 20,
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

              spacerH(30),
              Slider(
                min: 0,
                max: (player.duration?.inSeconds ?? 1).toDouble(),
                value: player.position.inSeconds.toDouble(),
                onChanged: (value) async {
                  if(provider.isInternetConnected) {
                    player.seek(Duration(seconds: value.toInt()));
                    provider.position = Duration(seconds: value.toInt());
                  }
                  else{
                    provider.reusableSnackBar(context);
                  }
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
              _audioController(provider),
              spacerH(10),
              _internetConnectivity(w: w, theme: theme,provider: provider),
              spacerH(),

            ],
          ),
        );
      }),
    );
  }

  Widget _audioController(AudioPlayerProvider provider) {
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
              onTap: () => provider.skipBackward(context: context),
              url: StaticAssets.skipBackwardIconAudioPlayer,
              width: 35),
          spacerW(15),

          // Previous Audio Icon
          ReusableImageButton(
            onTap:() =>provider.previousAudio(context),
            url: StaticAssets.previousIconAudioPlayer,
            color: provider.currentIndex == 0 ? Colors.grey : color,
          ),
          spacerW(15),

          // Play Audio Icon
          ReusableImageButton(
            onTap: () async {
              provider.togglePlay(context);
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
              onTap: () =>provider.nextAudio(context),
              url: StaticAssets.forwardIconAudioPlayer,
              color: provider.currentIndex == provider.playlist.length - 1
                  ? Colors.grey
                  : color),
          spacerW(15),

          // Skip Forward
          ReusableImageButton(
              onTap:() => provider.skipForward(context: context),
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
  
  Widget _internetConnectivity({required double w,required ColorScheme theme,required AudioPlayerProvider provider}) {
    return  provider.isInternetConnected ? Container() :
        Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: w,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: theme.surface,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: theme.primary, width: 2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableHeading(text: "No Internet Connection", icon: Icons.wifi_off,color: theme.primary, fontSize: 18),
            spacerH(4),
            Text("It looks like you're offline",style: AppStyles.descriptionPrimary(context: context,color: theme.primary),),
          ],
        ),
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
