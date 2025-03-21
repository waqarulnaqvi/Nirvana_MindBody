import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:nirvanafit/core/theme/app_gradients.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/static_assets.dart';
import '../../../../shared/view/widgets/global_widgets.dart';
import '../../viewmodel/providers/audio_player_provider.dart';

class RotatingAudioDisk extends StatefulWidget {
  final String image;
  const RotatingAudioDisk({super.key, required this.image});

  @override
  State<RotatingAudioDisk> createState() => _RotatingAudioDiskState();
}

class _RotatingAudioDiskState extends State<RotatingAudioDisk>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isInternet = true;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    ); //..repeat();
   // isInternetConnected();
    // isPlaying();
  }

  // Future<void> isInternetConnected() async{
  //   var result=await Connectivity().checkConnectivity();
  //   if(result==ConnectivityResult.mobile || result==ConnectivityResult.wifi){
  //    isInternet=true;
  //   }
  //   else{
  //     isInternet=false;
  //   }
  // }


  // Future<bool> isInternetConnected() async {
  //   var connectivityResult = await Connectivity().checkConnectivity();
  //   if (connectivityResult == ConnectivityResult.mobile ||
  //       connectivityResult == ConnectivityResult.wifi) {
  //     return true; // Connected
  //   }
  //   return false; // No Internet
  // }

  // void isPlaying(){
  //   Provider.of<AudioPlayerProvider>(context, listen: false).isPlaying
  //       ? _controller.repeat()
  //       : _controller.stop();
  // }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    final theme = Theme.of(context).colorScheme;
    return Consumer<AudioPlayerProvider>(
        builder: (context, audioProvider, child) {
      if (audioProvider.isPlaying && audioProvider.player.duration != null) {
        _controller.duration=  Duration(seconds: 3~/audioProvider.playbackSpeed);
        _controller.repeat();
      } else {
        _controller.stop();
      }

      return RotationTransition(
        turns: _controller,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: w * 0.7,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: AppGradients.skyBlueMyAppGradient)
              ),
              child: staticImage(
                  assetName: StaticAssets.circularDiskAudioPlayer),
            ),
            Container(
              width: w * 0.4,
              height: w * 0.4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image:
                        AssetImage(widget.image),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: theme.surface,
                shape: BoxShape.circle,
              ),

            ),
            if((audioProvider.isPlaying && audioProvider.player.duration == null))
              SizedBox(
              height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: theme.primary,
                ),
              )
          ],
        ),
      );
    });
  }
}
