import 'package:flutter/material.dart';
import 'package:nirvanafit/features/sounds_theraphy/view/widgets/rotating_audio_disk.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/static_assets.dart';
import '../../../../shared/view/widgets/global_widgets.dart';
import '../../viewmodel/providers/audio_player_provider.dart';

class BottomAudioPlayer extends StatelessWidget {
  final double bottomPadding;
  final double height;
  const BottomAudioPlayer({super.key, this.bottomPadding=80, this.height=160});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).colorScheme;
    final provider = Provider.of<AudioPlayerProvider>(context);
    final currentIndex= provider.currentIndex;
    final player = provider.player;
    final pageController = provider.pageController;
    final double w = MediaQuery.of(context).size.width;
    return provider.isRunBackground? Container(
      width: w,
      padding: EdgeInsets.only(bottom: bottomPadding),
      height: height,
      decoration: BoxDecoration(
        color: theme.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        border: Border.all(color: theme.primary,width: 2),
      ),
      child: Row(
        children: [
          spacerW(),
          SizedBox(
            height: 60,
            width: 60,
            child:  RotatingAudioDisk(
              image: provider.playlist[currentIndex].imageUrl,
            ),
          ),
          spacerW(),
          SizedBox(
            width: 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  provider.playlist[currentIndex].title,
                  style: TextStyle(
                    color: theme.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                spacerH(5),
                Text(
                  provider.playlist[currentIndex].subtitle,
                  style: TextStyle(
                    color: theme.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

              ],
            ),
          ),
          spacerW(10),
          InkWell(
              onTap: () {
                provider.isPlaying
                    ? provider.isPlaying = false
                    : provider.isPlaying = true;

                provider.isPlaying ? player.play() : player.pause();
              },
              child: staticImage(
                  assetName: provider.isPlaying
                      ? StaticAssets.pauseIconAudioPlayer
                      : StaticAssets.playIconAudioPlayer,
                  color: theme.onSurface,
                  width: 30)),
          spacerW(10),

          InkWell(
              onTap: provider.currentIndex != provider.playlist.length-1 ? () {
                // player.stop();
                // provider.isPlaying = false;
                provider.currentIndex = (provider.currentIndex + 1).clamp(0, provider.playlist.length - 1);
                pageController.jumpToPage(provider.currentIndex);
                provider.newAudio(provider.currentIndex);
              } : null,
              child: staticImage(
                  assetName: StaticAssets.forwardIconAudioPlayer,
                  color: provider.currentIndex == provider.playlist.length-1 ? Colors.grey : theme.onSurface,
                  width: 20)),
          spacerW(10),
          InkWell(
            onTap: () {
              provider.isRunBackground=false;
              provider.isPlaying=false;
              player.stop();
            },
            child: Icon(Icons.close,color: theme.onSurface,size: 30,),
          ),
          spacerW(5),

        ],
      ),
    ) : Container();
  }
}