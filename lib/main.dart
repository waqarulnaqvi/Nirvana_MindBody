import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nirvanafit/core/constants/constants.dart';
import 'package:nirvanafit/core/theme/app_theme.dart';
import 'package:nirvanafit/core/utils/util.dart';
import 'package:nirvanafit/shared/view/widgets/bottom_nav_bar/bottom_nav_bar.dart';

import 'features/onboarding/view/pages/onboarding.dart';

void main() {


  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(
      context,
      "Noto Music",
      "Noto Sans Display",
    );
   MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      title: Constants.appTitle,
      theme:theme.light(),
      darkTheme: theme.dark(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      home: Onboarding(),

    );
  }

}