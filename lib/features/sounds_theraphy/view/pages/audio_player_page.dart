import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:nirvanafit/core/constants/static_assets.dart';
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
            return Scaffold(
              appBar: ReusableAppBar(text: 'Audio Player',isCenterText: false,),
              body: Column(
                children: [
            StreamBuilder<PlayerState>(
              stream: _player.playerStateStream,
              builder: (context, snapshot) {
                final playing = snapshot.data?.playing ?? false;
                return IconButton(
                  icon: Icon(playing ? Icons.pause : Icons.play_arrow),
                  iconSize: 64,
                  onPressed: () {
                    if (playing) {
                      _player.pause();
                    } else {
                      _player.play();
                    }
                  },
                );
              },
            ),
          ],
        ),
      );
    }
  }