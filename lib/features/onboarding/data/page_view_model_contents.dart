import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/constants/static_assets.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../shared/view/widgets/reusable_circular_image.dart';


List<PageViewModel> pageViewModelList(final ColorScheme theme,final BuildContext context) =>[
  PageViewModel(
    title: "Welcome to ${Constants.appTitle}",
    body: Constants.appDescription,
    image: ReusableCircularImage(width: 190,height: 190),
    decoration: pageDecoration(theme,context),
  ),
  PageViewModel(
    title: "Sounds Therapy",
    body:
    "This section enables users to explore and listen to binaural beats & soothing music designed to enhance productivity,focus and creativity through unique blends of frequencies & calming sounds.",
    image: ReusableCircularImage(width: 190,height: 190,image: StaticAssets.soundsTherapyBackground),
    decoration: pageDecoration(theme,context),
  ),
  PageViewModel(
    title: "Meditation",
    body:"This section enables users to access and play various meditation sounds for relaxation and focus during meditation sessions.",
    image: ReusableCircularImage(width: 190,height: 190,image: StaticAssets.meditationsBackground),
    decoration: pageDecoration(theme,context),
  ),

  PageViewModel(
    title: "Exercises",
    body:
    "This section enables users to access to a library of exercise video for different workouts and fitness routines, facilitating physical activity.",
    image: ReusableCircularImage(width: 190,height: 190,image: StaticAssets.exercisesBackground),
    decoration: pageDecoration(theme,context),
  ),
];


pageDecoration(final ColorScheme theme,final BuildContext context) => PageDecoration(
  titleTextStyle: AppStyles.headingPrimary(context: context,color: theme.onSurface,fontWeight: FontWeight.bold,fontSize: 24),
  bodyTextStyle: AppStyles.descriptionPrimary(context: context,color: theme.onSurface),
  pageColor: theme.surface,
  imagePadding: EdgeInsets.zero,
);