import 'package:flutter/material.dart';
import 'package:nirvanafit/features/profile/model/drawer_model.dart';
import '../../../../core/routes/paths.dart';
import '../../../../shared/view/widgets/global_widgets.dart';

List<DrawerModel> drawerContentsList(BuildContext context) => [
  DrawerModel(
      title: "Connect",
      icon: Icons.person,
      onTap: () {
        Navigator.pop(context);
      }),
  DrawerModel(
      title: "More apps",
      icon: Icons.shopping_cart,
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, Paths.moreAppsPage);
      }),
  DrawerModel(
      title: "Mail",
      icon: Icons.feedback_outlined,
      onTap: () {
        Navigator.pop(context);
      }),
  DrawerModel(
      title: "Share",
      icon: Icons.leaderboard,
      onTap: () {
        Navigator.pop(context);
      }),
  DrawerModel(
      title: "Rate",
      icon: Icons.description_outlined,
      onTap: () {
        Navigator.pop(context);
      }),
  DrawerModel(
      title: "Clear User Data",
      icon: Icons.cleaning_services_outlined,
      onTap: () {
        Navigator.pop(context);
      }),
  DrawerModel(
      title: "Privacy Policy",
      icon: Icons.privacy_tip,
      onTap: () {
        Navigator.pop(context);
        openUrl(
            url: 'https://mysteriouscoder.com/privacypolicy',
            context: context);
      }),
  DrawerModel(
      title: "Exit",
      icon: Icons.logout,
      onTap: () {
        Navigator.pop(context);
      }),
];
