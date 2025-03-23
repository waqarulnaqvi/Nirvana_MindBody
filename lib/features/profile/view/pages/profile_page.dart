import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nirvanafit/core/constants/static_assets.dart';
import 'package:nirvanafit/core/local/db_helper.dart';
import 'package:nirvanafit/shared/view/widgets/global_widgets.dart';
import 'package:nirvanafit/shared/view/widgets/reusable_app_bar.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../sounds_theraphy/view/widgets/bottom_audio_player.dart';
import '../widgets/drawer/custom_drawer.dart';
import '../widgets/more_apps_carousel.dart';

class ProfilePage extends StatefulWidget {

  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DBHelper? dbHelper;
  List<Map<String,dynamic>> userAudioReport = [];

  @override
  void initState() {
    dbHelper = DBHelper();
    fetchUserAudioReport();
    super.initState();
  }

  void fetchUserAudioReport() async {
    userAudioReport =await dbHelper!.fetchAudio();
    setState(() {});
  }

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
      body: Stack(
        children: [
          Positioned.fill(
            child:   ListView.builder(
              itemCount: userAudioReport.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: staticImage(assetName: userAudioReport[index][DBHelper.columnAudioImageUrl],width: 50,height: 50),
                  title: Text(userAudioReport[index][DBHelper.columnAudioTitle]),
                  subtitle: Text(userAudioReport[index][DBHelper.columnAudioTime]),
                );
              },
            ),
            // child: SingleChildScrollView(
            //     child: Column(
            //   children: [
            //
            //     // moreAppsCarousel(w: w, context: context)
            //
            //   ],
            // )),
          ),
          Positioned(
              bottom: 0,
              child: BottomAudioPlayer())
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 120.0),
        child: FloatingActionButton(
          onPressed: () async {
            bool check = await dbHelper!.addAudio(title: "bbbeats", time: "2:16:13", imageUrl: StaticAssets.minimalismMusicSM);
            if (check) {
              fetchUserAudioReport();
            }
          },
          child: Icon(Icons.add),
        ),
      ),
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
