import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:nirvanafit/shared/view/widgets/global_widgets.dart';
import '../../../../core/constants/static_assets.dart';
import '../../../../core/theme/app_styles.dart';


List<PageViewModel> pageViewModelList(final ColorScheme theme,final BuildContext context) =>[
  PageViewModel(
    title: "Welcome to Nirvana MindBody",
    body:
    "Start your journey with fun and gamified aptitude preparation.",
    image: staticImage(assetName: StaticAssets.binauralBeatsBackground,width: 100),
    decoration: pageDecoration(theme,context),
  ),
  PageViewModel(
    title: "Sounds Therapy",
    body:
    "This section enables users to explore and listen to binaural beats & soothing music designed to enhance productivity,focus and creativity through unique blends of frequencies & calming sounds.",
    image: staticImage(assetName: StaticAssets.soothingMusicBackground,width: 100),
    decoration: pageDecoration(theme,context),
  ),
  PageViewModel(
    title: "Meditation",
    body:"This section enables users to access and play various meditation sounds for relaxation and focus during meditation sessions.",
    image: staticImage(assetName: StaticAssets.binauralBeatsBackground,width: 100),
    decoration: pageDecoration(theme,context),
  ),

  PageViewModel(
    title: "Exercises",
    body:
    "This section enables users to access to a library of exercise video for different workouts and fitness routines, facilitating physical activity.",
    image: staticImage(assetName: StaticAssets.soothingMusicBackground,width: 100),
    decoration: pageDecoration(theme,context),
  ),
];


pageDecoration(final ColorScheme theme,final BuildContext context) => PageDecoration(
  titleTextStyle: AppStyles.headingPrimary(context: context,color: theme.onSurface,fontWeight: FontWeight.bold),
  bodyTextStyle: AppStyles.descriptionPrimary(context: context,color: theme.onSurface),
  pageColor: theme.surface,
  imagePadding: EdgeInsets.zero,
);