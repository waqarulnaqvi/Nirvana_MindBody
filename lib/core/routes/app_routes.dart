import 'package:flutter/material.dart';
import 'package:nirvanafit/core/routes/paths.dart';
import 'package:nirvanafit/features/onboarding/view/pages/onboarding.dart';
import 'package:nirvanafit/features/profile/view/pages/more_apps_page.dart';
import 'package:nirvanafit/features/sounds_theraphy/view/pages/faq_page.dart';
import 'package:nirvanafit/shared/view/widgets/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    final prefs = await SharedPreferences.getInstance();
    final bool isBottomNav = prefs.getBool(PrefsKeys.isSeenOnBoard) ?? false;
    if (isBottomNav) {
      return FaqPage();
    }
    return Onboarding();
  }
}
