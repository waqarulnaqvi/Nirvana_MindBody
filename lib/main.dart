import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:nirvanafit/core/constants/constants.dart';
import 'package:nirvanafit/core/routes/app_routes.dart';
import 'package:nirvanafit/core/theme/app_theme.dart';
import 'package:nirvanafit/core/utils/util.dart';
import 'package:nirvanafit/features/sounds_theraphy/viewmodel/providers/audio_player_provider.dart';
import 'package:nirvanafit/features/sounds_theraphy/viewmodel/providers/content_filter_provider.dart';
import 'core/routes/paths.dart';
import 'features/profile/viewmodel/providers/more_apps_provider.dart';
import 'package:provider/provider.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.mysteriouscoder.nirvanamindbody.audio',
    androidNotificationChannelName: 'Audio Playback',
    androidNotificationOngoing: true,
  );



  await _loadFonts();


  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
  ));
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => MoreAppsProvider()),
    ChangeNotifierProvider(create: (_) => ContentFilterProvider()),
    ChangeNotifierProvider(create: (_) => AudioPlayerProvider()),
  ], child: const MyApp()));
}

Future<void> _loadFonts() async {
  // Load Poppins font
  final fontLoaderPoppins = FontLoader('Poppins')
    ..addFont(rootBundle.load('assets/fonts/Poppins-Regular.ttf'));

  // Load Montserrat font
  final fontLoaderMontserrat = FontLoader('Montserrat')
    ..addFont(rootBundle.load('assets/fonts/Montserrat-Regular.ttf'));

  // Load both fonts
  await Future.wait([
    fontLoaderPoppins.load(),
    fontLoaderMontserrat.load(),
  ]);
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
      theme: theme.light(),
      darkTheme: theme.dark(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: Paths.initial,
    );
  }
}
