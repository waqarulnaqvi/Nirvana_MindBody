import 'package:flutter/material.dart';
import '../../../../core/routes/paths.dart';
import '../../../../shared/view/widgets/global_widgets.dart';

class DrawerContents {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  DrawerContents({required this.title, required this.icon, required this.onTap});
}

List<DrawerContents> drawerContentsList(BuildContext context) => [
      DrawerContents(
          title: "Connect",
          icon: Icons.person,
          onTap: () {
            Navigator.pop(context);
          }),
      DrawerContents(
          title: "More apps",
          icon: Icons.shopping_cart,
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, Paths.moreAppsPage);
          }),
      DrawerContents(
          title: "Mail",
          icon: Icons.feedback_outlined,
          onTap: () {
            Navigator.pop(context);
          }),
      DrawerContents(
          title: "Share",
          icon: Icons.leaderboard,
          onTap: () {
            Navigator.pop(context);
          }),
      DrawerContents(
          title: "Rate",
          icon: Icons.description_outlined,
          onTap: () {
            Navigator.pop(context);
          }),
      DrawerContents(
          title: "Clear User Data",
          icon: Icons.cleaning_services_outlined,
          onTap: () {
            Navigator.pop(context);
          }),
      DrawerContents(
          title: "Privacy Policy",
          icon: Icons.privacy_tip,
          onTap: () {
            Navigator.pop(context);
            openUrl(
                url: 'https://mysteriouscoder.com/privacypolicy',
                context: context);
          }),
      DrawerContents(
          title: "Exit",
          icon: Icons.logout,
          onTap: () {
            Navigator.pop(context);
          }),
    ];
