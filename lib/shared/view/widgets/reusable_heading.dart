import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/theme/app_styles.dart';

class ReusableHeading extends StatelessWidget {
  final String text;
  final IconData icon;
  const ReusableHeading({super.key, required this.text, this.icon=FontAwesomeIcons.music});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,style: AppStyles.headingPrimary(context: context,color: theme.onSurface,fontWeight: FontWeight.bold),),
        Icon(FontAwesomeIcons.music,color: theme.onSurface,)
      ],
    );
  }
}