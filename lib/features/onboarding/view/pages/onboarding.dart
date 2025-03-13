import 'package:flutter/material.dart';
import 'package:nirvanafit/core/constants/static_assets.dart';
import 'package:nirvanafit/core/theme/app_styles.dart';
import 'package:nirvanafit/shared/view/widgets/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';


class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  OnboardingState createState() => OnboardingState();
}

class OnboardingState extends State<Onboarding> {
  Future<void> _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenOnboarding', true);
    if (mounted) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavBar()));
    }
  }



  final introKey = GlobalKey<IntroductionScreenState>();




  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset(assetName, width: width);
  }


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;



    var pageDecoration = PageDecoration(
      titleTextStyle: AppStyles.headingPrimary(context: context,color: theme.onSurface,fontWeight: FontWeight.bold),
      bodyTextStyle: AppStyles.descriptionPrimary(context: context,color: theme.onSurface),
      bodyPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: theme.surface,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: false,
      // autoScrollDuration: 2000,
      infiniteAutoScroll: false,
      globalHeader: const Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
              padding: EdgeInsets.only(top: 16, right: 16),
              child: CircleAvatar(
                backgroundImage: AssetImage(StaticAssets.appIcon),
                radius: 30,
              )
          ),
        ),
      ),
      // ),
      pages: [
        PageViewModel(
          title: "Welcome to Nirvana MindBody",
          body:
          "Start your journey with fun and gamified aptitude preparation.",
          image: _buildImage(StaticAssets.soothingMusicBackground),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Say goodbye to boring Aptitude prep!",
          body:
          "Master your placement journey with gamified challenges made just for you, the Computer Science wizard of tomorrow.",
          image: _buildImage(StaticAssets.binauralBeatsBackground),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Because your time matters",
          body:
          "Quick sessions, fun quizzes, and real progress without pilling on extra stress. Learn smart, not hard!",
          image: _buildImage(StaticAssets.binauralBeatsBackground),
          decoration: pageDecoration,
        ),

        PageViewModel(
          title: "Level Up Your Game",
          body:
          "Challenge yourself, track your growth & ace your aptitude like a pro. Ready to make aptitude fun again?",
          image: _buildImage(StaticAssets.soothingMusicBackground),
          decoration: pageDecoration,
        ),
      ],
      onDone: () =>    _completeOnboarding(),
      onSkip: () =>    _completeOnboarding(), // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back,color: Colors.white,),
      skip:  Text('Skip', style: AppStyles.descriptionPrimary(context: context)),
      next: const Icon(Icons.arrow_forward,color: Colors.white,),
      done:  Text('Done', style: AppStyles.descriptionPrimary(context: context)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.white,
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
            Colors.blueAccent,
            Colors.blueAccent.withOpacity(0.7),
          ],
        ),
        shadows: [
          BoxShadow(
            color: Colors.blueAccent,
            offset: const Offset(0, 6),
            blurRadius: 0,
          ),
          BoxShadow(
            color: Colors.black54.withOpacity(0.4),
            offset: const Offset(0, 6),
            blurRadius: 0,
          )
        ],

        // color:  Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(45.0)),
        ),
      ),
    );
  }
}

