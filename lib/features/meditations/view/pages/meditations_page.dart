import 'package:flutter/material.dart';
import 'package:nirvanafit/shared/view/widgets/global_widgets.dart';
import 'package:nirvanafit/shared/view/widgets/reusable_app_bar.dart';
import 'package:nirvanafit/shared/view/widgets/reusable_heading.dart';

class MeditationsPage extends StatelessWidget {
  const MeditationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ReusableAppBar(text: 'Meditations'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                spacerH(30),
                ReusableHeading(text: 'Meditations',icon: Icons.self_improvement,),
              ],
            ),
          ),
        ));
  }
}
