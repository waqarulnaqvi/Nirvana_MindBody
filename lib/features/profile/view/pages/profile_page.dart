import 'package:flutter/material.dart';
import 'package:nirvanafit/shared/view/widgets/global_widgets.dart';
import 'package:nirvanafit/shared/view/widgets/reusable_app_bar.dart';
import '../../../../core/theme/app_styles.dart';
import '../widgets/drawer/custom_drawer.dart';
import '../widgets/more_apps_carousel.dart';

class ProfilePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: CustomDrawer(h: h, w: w * 0.7),
      appBar: ReusableAppBar(
        text: 'Profile',
        isCenterText: false,
        isMenu: true,
        onPressed: () {
          _scaffoldKey.currentState!.openEndDrawer();
        },
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [moreAppsCarousel(w: w, context: context)],
      )),
    );
  }

  Widget moreAppsCarousel({required double w, required BuildContext context}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 30.0),
          child: Text(
            "More Apps",
            style: AppStyles.headingPrimary(context: context),
          ),
        ),
        spacerH(10),
        ReusableMoreAppsCarousel(
          w: w,
        ),
      ],
    );
  }
}
