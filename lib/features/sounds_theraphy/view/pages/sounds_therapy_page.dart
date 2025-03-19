import 'package:flutter/material.dart';
import 'package:nirvanafit/core/constants/static_assets.dart';
import 'package:nirvanafit/core/theme/app_gradients.dart';
import 'package:nirvanafit/shared/view/widgets/containers/reusable_stylish_container2.dart';
import 'package:nirvanafit/shared/view/widgets/global_widgets.dart';
import 'package:nirvanafit/shared/view/widgets/reusable_app_bar.dart';
import 'package:nirvanafit/shared/view/widgets/reusable_heading.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/routes/paths.dart';
import '../../../../shared/view/widgets/containers/reusable_stylish_container.dart';
import '../../viewmodel/providers/audio_player_provider.dart';
import '../widgets/rotating_audio_disk.dart';

class SoundsTherapyPage extends StatelessWidget {
  const SoundsTherapyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    var theme = Theme.of(context).colorScheme;
    final provider = Provider.of<AudioPlayerProvider>(context);
    final currentIndex= provider.currentIndex;
    final player = provider.player;
    final pageController = provider.pageController;
    final isPlaying = provider.isPlaying;
    return Scaffold(
        appBar: ReusableAppBar(text: 'Sounds Therapy'),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    spacerH(),
                    ReusableHeading(text: 'Soothing Music'),
                    spacerH(),
                    ReusableStylishContainer(
                      w: w,
                      colors: AppGradients.skyBlueMyAppGradient,
                      description: Constants.soothingMusicDescription,
                      image: StaticAssets.soundsTherapyBackground,
                      isCarousel: false,
                      isShowHeading: false,
                      buttonText: 'Get Started',
                      h: 300,
                      onTap: () {
                        Navigator.pushNamed(context, Paths.soothingMusicPage);
                      },
                    ),
                    spacerH(30),
                    ReusableHeading(text: 'Binaural Beats'),
                    spacerH(),
                    ReusableStylishContainer(
                      w: w,
                      colors: AppGradients.skyBlueMyAppGradient,
                      description: Constants.binauralBeatsDescription,
                      image: StaticAssets.meditationsBackground,
                      isCarousel: false,
                      isShowHeading: false,
                      buttonText: 'Get Started',
                      h: 300,
                      onTap: () {
                        Navigator.pushNamed(context, Paths.binauralBeatsPage);
                      },
                    ),
                    spacerH(30),
                    ReusableStylishContainer2(
                        title: "DOUBT ABOUT SOUND THERAPY?",
                        colors: AppGradients.skyBlueMyAppGradient,
                        image: StaticAssets.faqBackground,
                        onTap: () {
                          Navigator.pushNamed(context, Paths.faqPage);
                        },
                        description: Constants.faqDescription),
                    spacerH(120),
                  ],
                ),
              ),
            ),

            Positioned(
              bottom: 0,
                child: provider.isPlaying? Container(
                  width: w,
              padding: const EdgeInsets.only(bottom: 80),
              height: 160,
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
                              width: 35)),
                      spacerW(10),

                      InkWell(
                          onTap: provider.currentIndex != provider.playlist.length-1 ? () {
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
                          provider.isPlaying = false;
                          player.stop();
                        },
                        child: Icon(Icons.close,color: theme.onSurface,size: 30,),
                      ),
                      spacerW(5),

                    ],
                  ),
            ) : Container(),
            )
          ],
        ),

    );
  }
}
