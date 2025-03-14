import 'package:flutter/material.dart';
import 'package:nirvanafit/core/constants/static_assets.dart';
import 'package:nirvanafit/core/theme/app_gradients.dart';
import 'package:nirvanafit/shared/view/widgets/containers/reusable_stylish_container2.dart';
import 'package:nirvanafit/shared/view/widgets/global_widgets.dart';
import 'package:nirvanafit/shared/view/widgets/reusable_app_bar.dart';
import 'package:nirvanafit/shared/view/widgets/reusable_heading.dart';
import '../../../../core/constants/constants.dart';
import '../../../../shared/view/widgets/containers/reusable_stylish_container.dart';

class SoundsTherapyPage extends StatelessWidget {
  const SoundsTherapyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: ReusableAppBar(text: 'Sounds Therapy'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spacerH(30),
                ReusableHeading(text: 'Soothing Music'),
                spacerH(),
                ReusableStylishContainer(
                  w: w,
                  colors: AppGradients.skyBlueMyAppGradient,
                  description: Constants.soothingMusicDescription,
                  image: StaticAssets.soundsTherapyBackground,
                  isCarousel: false,
                  buttonText: 'Get Started',
                  h: 300,
                  onTap: () {},
                ),
                spacerH(40),
                ReusableHeading(text: 'Binaural Beats'),
                spacerH(),
                ReusableStylishContainer(
                  w: w,
                  colors: AppGradients.skyBlueMyAppGradient,
                  description: Constants.binauralBeatsDescription,
                  image: StaticAssets.meditationsBackground,
                  isCarousel: false,
                  buttonText: 'Get Started',
                  h: 300,
                  onTap: () {},
                ),
                spacerH(),
                ReusableStylishContainer2(
                    title: "DOUBT ABOUT SOUND THERAPY?",
                    colors: AppGradients.skyBlueMyAppGradient,
                    image: StaticAssets.faqBackground,
                    onTap: () {},
                    description: Constants.faqDescription),
                spacerH(120),
              ],
            ),
          ),
        ));
  }
}
