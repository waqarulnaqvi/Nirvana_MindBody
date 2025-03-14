import 'package:flutter/material.dart';
import 'package:nirvanafit/core/constants/prefs_keys.dart';
import 'package:nirvanafit/core/theme/app_styles.dart';
import 'package:nirvanafit/shared/view/widgets/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:nirvanafit/shared/view/widgets/reusable_circular_image.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../resources/page_view_model_list.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  OnboardingState createState() => OnboardingState();
}

class OnboardingState extends State<Onboarding> {
  final introKey = GlobalKey<IntroductionScreenState>();
  int currentPage = 0;

  Future<void> _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(PrefsKeys.isSeenOnBoard, true);
    if (mounted) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavBar()));
    }
  }




  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;


    return IntroductionScreen(
      key: introKey,
      // globalBackgroundColor: Colors.white,
      allowImplicitScrolling: false,
      // autoScrollDuration: 2000,
      infiniteAutoScroll: false,
      globalHeader : currentPage!=0 ? Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
              padding: EdgeInsets.only(top: 16, right: 16),
              child: ReusableCircularImage()
          ),
        ),
      ):null,
      // ),
      pages: pageViewModelList(theme,context),
      onDone: () =>    _completeOnboarding(),
      onSkip: () =>    _completeOnboarding(), // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back:  Icon(Icons.arrow_back,color:theme.surface ),
      skip:  Text('Skip', style: AppStyles.descriptionPrimary(context: context)),
      next:Icon(Icons.arrow_forward,color:theme.surface),
      done:  Text('Done', style: AppStyles.descriptionPrimary(context: context)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: DotsDecorator(
        size: Size(10.0, 10.0),
        color: theme.surface,
        activeColor: theme.onSurface,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator:  ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            theme.primary,
            theme.primary.withValues(alpha: 0.7),
          ],
        ),
        shadows: [
          BoxShadow(
            color : theme.primary,
            offset: const Offset(0, 6),
            blurRadius: 0,
          ),
          BoxShadow(
            color: Colors.black54.withValues(alpha: 0.4),
            offset: const Offset(0, 6),
            blurRadius: 0,
          )
        ],
        // color:  Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(45.0)),
        ),
      ),
      onChange: (index) {
        setState(() {
          currentPage = index;
        });
      },
    );
  }
}