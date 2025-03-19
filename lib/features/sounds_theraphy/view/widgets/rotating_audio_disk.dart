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

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    ); //..repeat();
    // isPlaying();
  }

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
      if (audioProvider.isPlaying) {
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
            )
          ],
        ),
      );
    });
  }
}
