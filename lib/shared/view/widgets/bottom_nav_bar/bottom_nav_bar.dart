import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nirvanafit/features/exercises/view/pages/exercises_page.dart';
import 'package:nirvanafit/features/meditations/view/pages/meditations_page.dart';
import 'package:nirvanafit/features/profile/view/pages/profile_page.dart';
import 'package:nirvanafit/features/sounds_theraphy/view/pages/sounds_therapy_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int _currentIndex = 0;
  final List<Widget> bottomBarPages = [
    SoundsTherapyPage(),
    MeditationsPage(),
    ExercisesPage(),
    ProfilePage(),
  ];


  List<Widget> _buildBottomBarItems(Color color) =>  [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(FontAwesomeIcons.music,color:  color ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.self_improvement,size: 30,color:  color),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          Icons.directions_run_outlined,
          color:  color,
          size: 30,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child:  Icon(
          Icons.person,
          color:  color,
          size: 30,
        ),
      ),
    ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child:  bottomBarPages[_currentIndex],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CurvedNavigationBar(
              height: 65,
              buttonBackgroundColor: Theme.of(context).colorScheme.primary,
              backgroundColor: Colors.transparent,
              color: Theme.of(context).colorScheme.primary,
              items: _buildBottomBarItems(theme.surface),
              index: _currentIndex,
              onTap: (index) => setState(() => _currentIndex = index),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: CurvedNavigationBar(
      //   height: 65,
      //   buttonBackgroundColor: Theme.of(context).colorScheme.primary,
      //   backgroundColor:Colors.transparent,
      //   color: Theme.of(context).colorScheme.primary,
      //   items: _buildBottomBarItems(theme.surface),
      //   index: _currentIndex,
      //   onTap: (index) => setState(() => _currentIndex = index),
      // ),
    );
  }
}
