import 'package:flutter/material.dart';
import 'package:nirvanafit/features/sounds_theraphy/view/widgets/rotating_audio_disk.dart';
import 'package:nirvanafit/shared/view/widgets/buttons/reusable_image_button.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/static_assets.dart';
import '../../../../shared/view/widgets/global_widgets.dart';
import '../../viewmodel/providers/audio_player_provider.dart';
import '../../../../core/routes/paths.dart';

class BottomAudioPlayer extends StatelessWidget {
  final double bottomPadding;
  final double height;

  const BottomAudioPlayer(
      {super.key, this.bottomPadding = 80, this.height = 160});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).colorScheme;

    final double w = MediaQuery.of(context).size.width;
    return Consumer(
      builder: (context, AudioPlayerProvider p, child) => p.isRunBackground
          ? Container(
              width: w,
              padding: EdgeInsets.only(bottom: bottomPadding),
              height: height,
              decoration: BoxDecoration(
                color: theme.surface,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                border: Border.all(color: theme.primary, width: 2),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Paths.audioPlayerPage,
                      arguments: p.currentIndex);
                },
                child: Row(
                  children: [
                    spacerW(),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: RotatingAudioDisk(
                        image: p.playlist[p.currentIndex].imageUrl,
                      ),
                    ),
                    spacerW(15),
                    SizedBox(
                      width: w*0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            p.playlist[p.currentIndex].title,
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
                            p.playlist[p.currentIndex].subtitle,
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
                    Spacer(),
                    //Play Button
                    ReusableImageButton(
                        onTap: p.togglePlay,
                        url: p.isPlaying
                            ? StaticAssets.pauseIconAudioPlayer
                            : StaticAssets.playIconAudioPlayer),
                    spacerW(10),
                    //Next Button
                    ReusableImageButton(
                      onTap: p.nextAudio,
                      url: StaticAssets.forwardIconAudioPlayer,
                      color: p.currentIndex == p.playlist.length - 1
                          ? Colors.grey
                          : theme.onSurface,
                      width: 20,
                    ),
                    spacerW(10),
                    //Close Button
                    InkWell(
                      onTap: p.backgroundPlayer,
                      child: Icon(
                        Icons.close,
                        color: theme.onSurface,
                        size: 30,
                      ),
                    ),
                    spacerW(10),
                  ],
                ),
              ),
            )
          : SizedBox(),
    );
  }
}
