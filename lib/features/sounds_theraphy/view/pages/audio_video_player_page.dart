import 'package:flutter/material.dart';
import 'package:nirvanafit/features/sounds_theraphy/data/binaural_beats_contents.dart';
import 'package:nirvanafit/features/sounds_theraphy/data/soothing_music_contents.dart';
import 'package:nirvanafit/features/sounds_theraphy/view/pages/video_player_page.dart';
import 'package:nirvanafit/features/sounds_theraphy/viewmodel/providers/audio_player_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme/app_styles.dart';
import '../../../../shared/view/widgets/reusable_app_bar.dart';
import 'audio_player_page.dart';

class AudioVideoPlayerPage extends StatefulWidget {
  final int index;

  const AudioVideoPlayerPage({super.key, this.index = 0});

  @override
  State<AudioVideoPlayerPage> createState() => _AudioVideoPlayerPageState();
}

class _AudioVideoPlayerPageState extends State<AudioVideoPlayerPage>  with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener((){
      if(_tabController.index == 1){
        context.read<AudioPlayerProvider>().backgroundPlayer();
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final Orientation o=MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: (o.name=="portrait")? const ReusableAppBar(
        text: 'Audio & Video Player',
        isCenterText: false,
      ) : null,
      body: Column(
        children: [
          Visibility(
            visible: (o.name=="portrait"),
            child: TabBar(
              controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: theme.primary,
                labelStyle: AppStyles.headingPrimary(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    context: context,
                    color: theme.primary),
                tabs: [
                  Tab(text: 'Audio'),
                  Tab(text: 'Video'),
                ]),
          ),
          Expanded(
              child: TabBarView(
                  controller: _tabController,
                  children: [
            AudioPlayerPage(
              index: widget.index,
              isAppBar: false,
            ),
            VideoPlayerPage(
              index: widget.index,
            )
          ]))

          // TabBar(tabs: )
        ],
      ),
    );
  }
}
