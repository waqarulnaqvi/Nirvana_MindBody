import 'package:flutter/material.dart';
import 'package:nirvanafit/features/exercises/view/pages/men_exercises_page.dart';
import 'package:nirvanafit/features/exercises/view/pages/women_exercises_page.dart';
import 'package:nirvanafit/shared/view/widgets/reusable_app_bar.dart';

import '../../../../core/theme/app_styles.dart';
import '../../../sounds_theraphy/view/widgets/bottom_audio_player.dart';

class ExercisesPage extends StatelessWidget {
  const ExercisesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const ReusableAppBar(text: 'Exercises'),
        body: Stack(
          children: [
            Positioned.fill(
              child: Column(
                children: [
                  TabBar(
                    labelStyle: AppStyles.headingPrimary(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        context: context,
                        color: theme.primary),
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: [
                      Tab(text: 'Men'),
                      Tab(text: 'Women'),
                    ],
                  ),
                  Expanded(
                    child: const TabBarView(
                      children: [MenExercisesPage(), WomenExercisesPage()],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(bottom: 0, child: BottomAudioPlayer())
          ],
        ),
      ),
    );
  }
}
