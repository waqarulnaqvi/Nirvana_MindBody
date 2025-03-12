// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:r2win/core/constants/prefs_keys.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:r2win/core/routes/paths.dart';
// import 'package:r2win/features/auth/presentation/pages/login_page.dart';
// import 'package:r2win/features/chat/presentation/pages/chatting_page.dart';
// import 'package:r2win/shared/presentation/widgets/navigation/bottom_nav_bar.dart';
// import '../../features/auth/data/models/user.dart';
//
// class AppRoutes {
//   static Route? onGenerateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case Paths.initial:
//         return MaterialPageRoute(builder: (context) => _handleInitialRoute());
//
//       case Paths.login:
//         return MaterialPageRoute(builder: (context) => LoginPage());
//
//       case Paths.bottomNavBar:
//         return MaterialPageRoute(
//           builder: (context) {
//             final args = settings.arguments as Map<String, dynamic>;
//             final User user = args["user"] as User;
//             final String token = args["token"] as String;
//             return BottomNavBar(user: user, token: token);
//           },
//         );
//
//       case Paths.chattingPage:
//         return MaterialPageRoute(builder: (context) {
//           final args = settings.arguments as Map<String, dynamic>;
//           final String number = args["number"] as String;
//           final String token = args["token"] as String;
//           final bool isToday = args['isToday'] as bool;
//           final String? personName = args['personName'] as String?;
//
//           // print("I am in chatting page Routes");
//           // print("Number: $number");
//           // print("Token: $token");
//
//           return ChattingPage(
//             number: number,
//             token: token,
//             isToday: isToday,
//             personName: personName,
//           );
//         });
//
//       default:
//         return MaterialPageRoute(builder: (context) => LoginPage());
//     }
//   }
//
//   static Widget _handleInitialRoute() {
//     return FutureBuilder<Widget>(
//       future: _getInitialRouteWidget(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Scaffold(body: Center(child: CircularProgressIndicator()));
//         }
//         return snapshot.data ?? LoginPage();
//       },
//     );
//   }
//
//   static Future<Widget> _getInitialRouteWidget() async {
//     final prefs = await SharedPreferences.getInstance();
//     final String? userJson = prefs.getString(PrefsKeys.user);
//     final String? token = prefs.getString(PrefsKeys.userToken);
//     final bool isLogin = prefs.getBool(PrefsKeys.isLoggedIn) ?? false;
//
//     if (isLogin && token != null && userJson != null) {
//       final User user = User.fromJson(jsonDecode(userJson));
//       return BottomNavBar(token: token, user: user);
//     }
//     return LoginPage();
//   }
// }
//
// //
// // import 'dart:convert';
// //
// // import 'package:flutter/material.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:r2win/core/routes/paths.dart';
// // import 'package:r2win/features/auth/presentation/pages/login_page.dart';
// // import 'package:r2win/features/chat/presentation/pages/chatting_page.dart';
// // import 'package:r2win/shared/presentation/widgets/navigation/bottom_nav_bar.dart';
// //
// // import '../../features/auth/data/models/user.dart';
// //
// // class AppRoutes {
// //   static Route? onGenerateRoute(RouteSettings settings) {
// //     switch (settings.name) {
// //       case Paths.initial:
// //         return _handleInitialRouteSync();
// //
// //       case Paths.login:
// //         return MaterialPageRoute(builder: (context) => LoginPage());
// //
// //       case Paths.bottomNavBar:
// //         return MaterialPageRoute(
// //           builder: (context) {
// //             final args = settings.arguments as Map<String, dynamic>;
// //
// //
// //               final User user = args["user"] as User; // Cast it to User model
// //               final String token = args["token"] as String;
// //
// //             return BottomNavBar(
// //               user: user,
// //               token: token,
// //             );
// //           },
// //         );
// //
// //       case Paths.chattingPage:
// //         return MaterialPageRoute(builder: (context) => ChattingPage());
// //
// //       default:
// //         return MaterialPageRoute(builder: (context) => LoginPage());
// //     }
// //   }
// //
// //   static Route _handleInitialRouteSync() {
// //     final prefs = SharedPreferences.getInstance();
// //
// //     bool isLogin = false;
// //     String? token;
// //     User user = User();
// //
// //     prefs.then((preferences) {
// //       isLogin = preferences.getBool("isLogin") ?? false;
// //       token = preferences.getString("token");
// //       user = User.fromJson(jsonDecode(preferences.getString("user") ?? ""));
// //     });
// //
// //     return MaterialPageRoute(
// //       builder: (context) => isLogin ? BottomNavBar(token: token ?? "", user: user,) : LoginPage(),
// //     );
// //   }
// // }
