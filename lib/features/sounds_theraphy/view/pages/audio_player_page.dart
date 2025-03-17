import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:nirvanafit/core/constants/static_assets.dart';
import 'package:nirvanafit/core/theme/app_styles.dart';
import 'package:nirvanafit/shared/view/widgets/global_widgets.dart';
import 'package:nirvanafit/shared/view/widgets/reusable_app_bar.dart';

class AudioPlayerPage extends StatefulWidget {
  const AudioPlayerPage({super.key});

  @override
  State<AudioPlayerPage> createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  final AudioPlayer _player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    // _player.setUrl(StaticAssets.soothingMusicMp3);
    _player.setAsset(StaticAssets.soothingMusicMp3);
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: ReusableAppBar(
        text: 'Audio Player',
        isCenterText: false,
      ),
      body: Column(
        children: [
          spacerH(),
           Text('Indian Classic Music',style: AppStyles.descriptionPrimary(context: context,color: theme.primary,fontWeight: FontWeight.bold,fontSize: 22),),
          spacerH(5),
          Text('Nirvana MindBody',style: AppStyles.headingPrimary(context: context,color: theme.primary,fontSize: 18,fontWeight: FontWeight.bold),),
          Stack(
            alignment: Alignment.center,
            children: [
              staticImage(assetName: StaticAssets.circularDiskAudioPlayer, width: 220),
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage(StaticAssets.loFIHipHopMusicSquareImageSM),fit: BoxFit.cover),
                ),
              )
            ],
          ),

          // StreamBuilder<PlayerState>(
          //   stream: _player.playerStateStream,
          //   builder: (context, snapshot) {
          //     final playing = snapshot.data?.playing ?? false;
          //     return IconButton(
          //       icon: Icon(playing ? Icons.pause : Icons.play_arrow),
          //       iconSize: 64,
          //       onPressed: () {
          //         if (playing) {
          //           _player.pause();
          //         } else {
          //           _player.play();
          //         }
          //       },
          //     );
          //   },
          // ),
          audioController(theme.onSurface),
        ],
      ),
    );
  }
  Widget audioController(Color color){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
              onPressed: () {},
              child: staticImage(
                  assetName: StaticAssets.previousIconAudioPlayer,
                  color: color,
                  width: 30)),
          TextButton(
              onPressed: () {},
              child: staticImage(
                  assetName: StaticAssets.playIconAudioPlayer,
                  color: color,
                  width: 70)),
          TextButton(
              onPressed: () {},
              child: staticImage(
                  assetName: StaticAssets.forwardIconAudioPlayer,
                  color: color,
                  width: 30)),
          spacerW(5),
          InkWell(
            onTap: (){},
            child: staticImage(
                assetName: StaticAssets.speedometerIconAudioPlayer,
                color: color,
                width: 30),
          ),
          TextButton(
              onPressed: () {},
              child: staticImage(
                  assetName: StaticAssets.repeatFalseIconAudioPlayer,
                  color: color,
                  width: 25)),
        ],
      ),
    );
  }
}
