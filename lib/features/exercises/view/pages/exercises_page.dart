import 'package:flutter/material.dart';
import 'package:nirvanafit/shared/view/widgets/reusable_app_bar.dart';

import '../../../../core/theme/app_styles.dart';

class ExercisesPage extends StatelessWidget {
  const ExercisesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const ReusableAppBar(text: 'Exercises'),
        body: Column(
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
                children: [
                  Center(child: Text('Men')),
                  Center(child: Text('Women')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
