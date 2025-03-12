import 'package:flutter/material.dart';
import 'package:nirvanafit/core/constants/constants.dart';
import 'package:nirvanafit/core/theme/app_theme.dart';
import 'package:nirvanafit/core/utils/util.dart';

void main() {
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
      home: Container(),

    );
  }

}