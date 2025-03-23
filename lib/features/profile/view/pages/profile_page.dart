import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nirvanafit/core/constants/static_assets.dart';
import 'package:nirvanafit/core/local/db_helper.dart';
import 'package:nirvanafit/shared/view/widgets/global_widgets.dart';
import 'package:nirvanafit/shared/view/widgets/reusable_app_bar.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../sounds_theraphy/view/widgets/bottom_audio_player.dart';
import '../../../sounds_theraphy/viewmodel/providers/audio_player_provider.dart';
import '../widgets/drawer/custom_drawer.dart';
import '../widgets/more_apps_carousel.dart';

class ProfilePage extends StatefulWidget {

  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // DBHelper? dbHelper;
  // List<Map<String,dynamic>> provider.userAudioReport = [];
  // int time=0;
  @override
  void initState() {
    // dbHelper = DBHelper();
    // fetchprovider.userAudioReport();
    super.initState();
  }

  // void fetchprovider.userAudioReport() async {
  //   provider.userAudioReport =await dbHelper!.fetchAudio();
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    final theme=Theme.of(context).colorScheme;
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: CustomDrawer(h: h, w: w * 0.7),
      appBar: ReusableAppBar(
        text: 'Mindfulness Insights',
        // text: 'Profile',
        isCenterText: false,
        isMenu: true,
        onPressed: () {
          _scaffoldKey.currentState!.openEndDrawer();
        },
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Consumer(
      builder: (context, AudioPlayerProvider provider, child) {
        return provider.userAudioReport.isEmpty ?
        Center(
          child: Text("No Mindfulness Report Available",
            style: AppStyles.headingPrimary(
                context: context, color: theme.onSurface, fontSize: 18),),
        )
            : ListView.builder(
          padding: EdgeInsets.only(top: 20, bottom: 100),
          itemCount: provider.userAudioReport.length,
          itemBuilder: (context, index) {
            List time = provider.userAudioReport[index][DBHelper
                .columnAudioTime].split(":");

            if (time.length < 3) {
              time = [time[0], time[0], time[0]];
            }

            return ListTile(
              leading: ClipOval(
                child: staticImage(
                    assetName: provider.userAudioReport[index][DBHelper
                        .columnAudioImageUrl], width: 60, height: 60),
              ),
              title: Text(provider.userAudioReport[index][DBHelper
                  .columnAudioTitle], style: AppStyles.headingPrimary(
                  context: context, color: theme.onSurface, fontSize: 18),),
              subtitle: Text("Spend time : ${time[0] == "0"
                  ? ""
                  : "${time[0]} h :"} ${time[1] == "00"
                  ? ""
                  : "${time[1]} m :"} ${time[2].toString().split(".")[0]} s",
                style: AppStyles.descriptionPrimary(
                    context: context, color: theme.onSurface),),
            );
          },
        );
      }
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
          //   bool check = await dbHelper!.addAudio(title: "bbbeats", time: time.toString(), imageUrl: StaticAssets.minimalismMusicSM);
          //   time++;
          //   if (check) {
          //     fetchprovider.userAudioReport();
          //   }
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
