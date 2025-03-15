import 'package:flutter/material.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/constants/static_assets.dart';
import '../../../../core/theme/app_gradients.dart';

class MoreAppsContents{
  final String title;
  final String image;
  final String description;
  final List<Color> colors;
  final String url;

  const MoreAppsContents({required this.title, required this.image, required this.description, required this.colors, required this.url});

}

List<MoreAppsContents> moreAppsContentsList=[
  MoreAppsContents(
    title: Constants.brainBooster,
    image: StaticAssets.brainBoosterIcon,
    description: Constants.brainBoosterDescription,
    colors: AppGradients.blueMyAppGradient,
    url: Constants.brainBoosterUrl
  ),
  MoreAppsContents(
    title: Constants.classicWingedBird,
    image: StaticAssets.classicWingedBirdIcon,
    description: Constants.classicWingedBirdDescription,
    colors: AppGradients.blueMyAppGradient,
    url: Constants.classicWingedBirdUrl
  ),
  MoreAppsContents(
    title: Constants.hindiShayariHub,
    image: StaticAssets.hindiShayariHubIcon,
    description: Constants.hindiShayariHubDescription,
    colors: AppGradients.purpleMyAppGradient,
    url: Constants.hindiShayariHubUrl
  ),
  MoreAppsContents(
    title: Constants.mazedarHindiJokes,
    image: StaticAssets.mazedarHindiJokesIcon,
    description: Constants.mazedarHindiJokesDescription,
    colors: AppGradients.orangeMyAppGradient,
    url: Constants.mazedarHindiJokesUrl
  ),
  MoreAppsContents(
    title: Constants.noteMaster,
    image: StaticAssets.noteMasterIcon,
    description: Constants.noteMasterDescription,
    colors: AppGradients.orangeMyAppGradient,
    url: Constants.noteMasterUrl
  ),
  MoreAppsContents(
    title: Constants.appTitle,
    image: StaticAssets.appIcon,
    description: Constants.appDescription,
    colors: AppGradients.skyBlueMyAppGradient,
    url: Constants.appUrl
  ),
];