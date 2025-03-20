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
import '../widgets/bottom_audio_player.dart';

class SoundsTherapyPage extends StatelessWidget {
  const SoundsTherapyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    final provider = Provider.of<AudioPlayerProvider>(context);

    return Scaffold(
      appBar: ReusableAppBar(text: 'Sounds Therapy'),
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
            
                    //Spacing for bottom audio player
                    provider.isRunBackground ? spacerH(200) : spacerH(120)
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              child: BottomAudioPlayer())
        ],
      ),
    );
  }
}
