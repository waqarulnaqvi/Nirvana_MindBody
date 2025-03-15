import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../shared/view/widgets/global_widgets.dart';

class DrawerContent{
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  DrawerContent({required this.title,required this.icon,required this.onTap});
}

List<DrawerContent> drawerContentList(BuildContext context)=>[
  DrawerContent(title: "Connect", icon: Icons.person, onTap: (){
    Navigator.pop(context);
  }),
  DrawerContent(title: "More apps", icon: Icons.shopping_cart, onTap: (){
    Navigator.pop(context);
  }),
  DrawerContent(title: "Mail", icon: Icons.feedback_outlined, onTap: (){
    Navigator.pop(context);
  }),
  DrawerContent(title: "Share", icon: Icons.leaderboard, onTap: (){
    Navigator.pop(context);
  }),
  DrawerContent(title: "Rate", icon: Icons.description_outlined, onTap: (){
    Navigator.pop(context);
  }),
  DrawerContent(title: "Clear User Data", icon: Icons.cleaning_services_outlined, onTap: (){
    Navigator.pop(context);
  }),
  DrawerContent(title: "Privacy Policy", icon: Icons.privacy_tip, onTap: (){
    Navigator.pop(context);
    openUrl( url: 'https://mysteriouscoder.com/privacypolicy', context: context);
  }),
  DrawerContent(title: "Exit", icon: Icons.logout, onTap: (){
    Navigator.pop(context);
  }),
];