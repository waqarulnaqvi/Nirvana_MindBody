import 'package:flutter/material.dart';
import 'package:nirvanafit/shared/view/widgets/reusable_app_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(text: 'Profile',isCenterText: false,
      isMenu: true,
      onPressed: (){},),
    );
  }
}
