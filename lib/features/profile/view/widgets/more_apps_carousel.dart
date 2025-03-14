import "package:flutter/material.dart";
import "package:flutter_carousel_widget/flutter_carousel_widget.dart";
import "package:nirvanafit/core/constants/static_assets.dart";
import "package:nirvanafit/shared/view/widgets/containers/reusable_stylish_container.dart";
import "../../../../core/constants/constants.dart";
import "../../../../core/theme/app_gradients.dart";

class ReusableMoreAppsCarousel extends StatelessWidget {
  final Axis scrollDirection;
  final double viewportFraction;
  final double w;
  final bool infiniteScroll;

  ReusableMoreAppsCarousel(
      {required this.w,
      this.scrollDirection = Axis.horizontal,
      this.viewportFraction = 0.9,
      this.infiniteScroll = false,
      super.key});

  final List<String> title = [
    Constants.brainBooster,
    Constants.classicWingedBird,
    Constants.hindiShayariHub,
    Constants.mazedarHindiJokes,
    Constants.noteMaster,
    Constants.appTitle,
  ];

  final List<String> image = [
    StaticAssets.brainBoosterIcon,
    StaticAssets.classicWingedBirdIcon,
    StaticAssets.hindiShayariHubIcon,
    StaticAssets.mazedarHindiJokesIcon,
    StaticAssets.noteMasterIcon,
    StaticAssets.appIcon
  ];

  final List<String> subtitle = [
    Constants.brainBoosterDescription,
    Constants.classicWingedBirdDescription,
    Constants.hindiShayariHubDescription,
    Constants.mazedarHindiJokesDescription,
    Constants.noteMasterDescription,
    Constants.appDescription
  ];

  final List<List<Color>> color = [
    AppGradients.blueMyAppGradient,
    AppGradients.blueMyAppGradient,
    AppGradients.purpleMyAppGradient,
    AppGradients.orangeMyAppGradient,
    AppGradients.orangeMyAppGradient,
    AppGradients.skyBlueMyAppGradient,
  ];

  @override
  Widget build(BuildContext context) {
    return ExpandableCarousel(
      items: [0, 1, 2, 3, 4,5].map((i) {
        return ReusableStylishContainer(
          w: w,
          colors: color[i],
          title: title[i],
          description: subtitle[i],
          image: image[i],
        );
      }).toList(),
      options: ExpandableCarouselOptions(
        initialPage: 0,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 2),
        autoPlayAnimationDuration: const Duration(milliseconds: 500),
        scrollDirection: scrollDirection,
        viewportFraction: viewportFraction,
        aspectRatio: 1.1,
        enableInfiniteScroll: infiniteScroll,
      ),
    );
  }
}
