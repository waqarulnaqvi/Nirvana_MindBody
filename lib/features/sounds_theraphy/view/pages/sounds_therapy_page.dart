import 'package:flutter/material.dart';
import 'package:nirvanafit/shared/view/widgets/reusable_app_bar.dart';

class SoundsTherapyPage extends StatelessWidget {
  const SoundsTherapyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(text: 'Sounds Therapy'),
    );
  }
}
