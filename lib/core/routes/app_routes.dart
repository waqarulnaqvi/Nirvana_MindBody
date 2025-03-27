import 'package:flutter/material.dart';
import 'package:nirvanafit/core/local/prefs_helper.dart';
import 'package:nirvanafit/core/routes/paths.dart';
import 'package:nirvanafit/features/onboarding/view/pages/onboarding_page.dart';
import 'package:nirvanafit/features/profile/view/pages/more_apps_page.dart';
import 'package:nirvanafit/features/sounds_theraphy/view/pages/faq_page.dart';
import 'package:nirvanafit/shared/view/widgets/bottom_nav_bar/bottom_nav_bar.dart';
import '../../features/sounds_theraphy/view/pages/audio_player_page.dart';
import '../../features/sounds_theraphy/view/pages/audio_video_player_page.dart';
import '../../features/sounds_theraphy/view/pages/binaural_beats_page.dart';
import '../../features/sounds_theraphy/view/pages/meditation_session_page.dart';
import '../../features/sounds_theraphy/view/pages/soothing_music_page.dart';
import '../constants/prefs_keys.dart';

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Paths.initial:
        return MaterialPageRoute(builder: (context) => _handleInitialRoute());

      case Paths.moreAppsPage:
        return MaterialPageRoute(builder: (context) => MoreAppsPage());

      case Paths.faqPage:
        return MaterialPageRoute(builder: (context) => FaqPage());

      case Paths.onboardingPage:
        return MaterialPageRoute(builder: (context) => OnboardingPage());

      case Paths.bottomNavBar:
        return MaterialPageRoute(builder: (context) => BottomNavBar());

      case Paths.soothingMusicPage:
        return MaterialPageRoute(builder: (context) => SoothingMusicPage());

      case Paths.binauralBeatsPage:
        return MaterialPageRoute(builder: (context) => BinauralBeatsPage());

      case Paths.meditationSessionPage:
        return MaterialPageRoute(builder: (context) => MeditationSessionPage());

      case Paths.audioVideoPlayerPage:
        return MaterialPageRoute(builder: (context) {
          final index=settings.arguments as int?;
          return AudioVideoPlayerPage(
            index: index ?? 0,
          );
        });


      case Paths.audioPlayerPage:
        return MaterialPageRoute(builder: (context) {
          final index=settings.arguments as int?;
          return AudioPlayerPage(
            index: index ?? 0,
          );
        });


      default:
        return MaterialPageRoute(builder: (context) => BottomNavBar());
    }
  }

  static Widget _handleInitialRoute() {
    return FutureBuilder<Widget>(
      future: _getInitialRouteWidget(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        return snapshot.data ?? BottomNavBar();
      },
    );
  }

  static Future<Widget> _getInitialRouteWidget() async {
    PrefsHelper prefs=PrefsHelper();
    final bool isBottomNav=await prefs.getBoolValue(PrefsKeys.isSeenOnBoard);
    if (isBottomNav) {
      return BottomNavBar();
    }
    return OnboardingPage();
  }
}

// final prefs = await SharedPreferences.getInstance();
// final bool isBottomNav = prefs.getBool(PrefsKeys.isSeenOnBoard) ?? false;