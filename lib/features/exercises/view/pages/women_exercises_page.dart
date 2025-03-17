import 'package:flutter/material.dart';

import '../../../../core/theme/app_gradients.dart';
import '../../../../shared/view/widgets/containers/reusable_challenges_container.dart';

class WomenExercisesPage extends StatelessWidget {
  const WomenExercisesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ReusableChallengesContainer(
                title: "FULL BODY 7X4 CHALLENGE",
                gradientColors: AppGradients.skyBlueMyAppGradient,
                image: "assets/images/exercises_challenges/full_body_workout_women.png"),
          )

        ],
      ),
    );
  }
}
