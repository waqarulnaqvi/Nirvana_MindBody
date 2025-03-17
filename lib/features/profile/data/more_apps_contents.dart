import 'package:nirvanafit/features/profile/model/more_apps_model.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/constants/static_assets.dart';
import '../../../../core/theme/app_gradients.dart';

List<MoreAppsModel> moreAppsContentsList=[
  MoreAppsModel(
      title: Constants.brainBooster,
      image: StaticAssets.brainBoosterIcon,
      description: Constants.brainBoosterDescription,
      colors: AppGradients.blueMyAppGradient,
      url: Constants.brainBoosterUrl
  ),
  MoreAppsModel(
      title: Constants.classicWingedBird,
      image: StaticAssets.classicWingedBirdIcon,
      description: Constants.classicWingedBirdDescription,
      colors: AppGradients.blueMyAppGradient,
      url: Constants.classicWingedBirdUrl
  ),
  MoreAppsModel(
      title: Constants.hindiShayariHub,
      image: StaticAssets.hindiShayariHubIcon,
      description: Constants.hindiShayariHubDescription,
      colors: AppGradients.purpleMyAppGradient,
      url: Constants.hindiShayariHubUrl
  ),
  MoreAppsModel(
      title: Constants.mazedarHindiJokes,
      image: StaticAssets.mazedarHindiJokesIcon,
      description: Constants.mazedarHindiJokesDescription,
      colors: AppGradients.orangeMyAppGradient,
      url: Constants.mazedarHindiJokesUrl
  ),
  MoreAppsModel(
      title: Constants.noteMaster,
      image: StaticAssets.noteMasterIcon,
      description: Constants.noteMasterDescription,
      colors: AppGradients.orangeMyAppGradient,
      url: Constants.noteMasterUrl
  ),
  MoreAppsModel(
      title: Constants.appTitle,
      image: StaticAssets.appIcon,
      description: Constants.appDescription,
      colors: AppGradients.skyBlueMyAppGradient,
      url: Constants.appUrl
  ),
];