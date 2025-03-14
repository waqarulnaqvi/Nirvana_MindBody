import 'package:flutter/material.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/constants/static_assets.dart';
import '../../../../core/theme/app_gradients.dart';

class MoreAppsCarouselContents{
  final String title;
  final String image;
  final String description;
  final List<Color> colors;
  final String url;

  const MoreAppsCarouselContents({required this.title, required this.image, required this.description, required this.colors, required this.url});

}

List<MoreAppsCarouselContents> moreAppsCarouselContentsList=[
  MoreAppsCarouselContents(
    title: Constants.brainBooster,
    image: StaticAssets.brainBoosterIcon,
    description: Constants.brainBoosterDescription,
    colors: AppGradients.blueMyAppGradient,
    url: Constants.brainBoosterUrl
  ),
  MoreAppsCarouselContents(
    title: Constants.classicWingedBird,
    image: StaticAssets.classicWingedBirdIcon,
    description: Constants.classicWingedBirdDescription,
    colors: AppGradients.blueMyAppGradient,
    url: Constants.classicWingedBirdUrl
  ),
  MoreAppsCarouselContents(
    title: Constants.hindiShayariHub,
    image: StaticAssets.hindiShayariHubIcon,
    description: Constants.hindiShayariHubDescription,
    colors: AppGradients.purpleMyAppGradient,
    url: Constants.hindiShayariHubUrl
  ),
  MoreAppsCarouselContents(
    title: Constants.mazedarHindiJokes,
    image: StaticAssets.mazedarHindiJokesIcon,
    description: Constants.mazedarHindiJokesDescription,
    colors: AppGradients.orangeMyAppGradient,
    url: Constants.mazedarHindiJokesUrl
  ),
  MoreAppsCarouselContents(
    title: Constants.noteMaster,
    image: StaticAssets.noteMasterIcon,
    description: Constants.noteMasterDescription,
    colors: AppGradients.orangeMyAppGradient,
    url: Constants.noteMasterUrl
  ),
  MoreAppsCarouselContents(
    title: Constants.appTitle,
    image: StaticAssets.appIcon,
    description: Constants.appDescription,
    colors: AppGradients.skyBlueMyAppGradient,
    url: Constants.appUrl
  ),
];