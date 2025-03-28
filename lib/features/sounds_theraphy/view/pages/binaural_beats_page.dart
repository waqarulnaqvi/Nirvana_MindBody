import 'package:flutter/material.dart';
import 'package:nirvanafit/features/sounds_theraphy/data/soothing_music_contents.dart';
import 'package:nirvanafit/features/sounds_theraphy/viewmodel/providers/audio_player_provider.dart';
import 'package:nirvanafit/features/sounds_theraphy/viewmodel/providers/content_filter_provider.dart';
import 'package:nirvanafit/shared/view/widgets/reusable_app_bar.dart';
import 'package:provider/provider.dart';
import '../../../../core/routes/paths.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../shared/view/widgets/global_widgets.dart';
import '../../../../shared/view/widgets/text_view/reusable_text_field.dart';
import '../widgets/bottom_audio_player.dart';
import '../widgets/containers/reusable_image_container.dart';

class BinauralBeatsPage extends StatefulWidget {
  const BinauralBeatsPage({super.key});

  @override
  State<BinauralBeatsPage> createState() => _BinauralBeatsPageState();
}

class _BinauralBeatsPageState extends State<BinauralBeatsPage> {
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    final double h = MediaQuery.of(context).size.height;
    final theme = Theme.of(context).colorScheme;
    final uProvider = context.read<ContentFilterProvider>();
    final audioPlayerProvider = context.watch<AudioPlayerProvider>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: ReusableAppBar(
        text: "Binaural Beats",
        isCenterText: false,
      ),
      body: Consumer<ContentFilterProvider>(
        builder: (context, provider, child) => Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spacerH(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ReusableTextField(
                    controller: searchController,
                    hintText: 'Search by Title',
                    onChanged: (value) {
                      uProvider.filterBinauralBeatsList(value);
                    },
                  ),
                ),
                Visibility(
                  visible: searchController.text.isNotEmpty,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 35, top: 15),
                    child: Text(
                      'Search Results (${provider.filteredBinauralBeatsList.length})',
                      style: AppStyles.headingPrimary(
                          context: context,
                          fontSize: 18,
                          color: theme.primary,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                spacerH(10),
                provider.filteredBinauralBeatsList.isEmpty
                    ? SizedBox(
                        width: w,
                        height: h - 300,
                        child: Center(
                            child: Text(
                          'No Playlist Found',
                          style: AppStyles.descriptionPrimary(
                              context: context, color: theme.onSurface),
                        )))
                    : Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.only(
                              top: 5,
                              bottom: audioPlayerProvider.isRunBackground
                                  ? 160
                                  : 100),
                          itemBuilder: (context, index) {
                            final bb =
                                provider.filteredBinauralBeatsList[index];

                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: InkWell(
                                onTap: () {
                                  int idx =
                                      soothingMusicContentsList.length + index;

                                  Navigator.pushNamed(
                                      context, Paths.audioPlayerPage,
                                      arguments: idx);
                                  // 'index':index,
                                  // arguments:{
                                  //   'index':index,
                                  // });
                                },
                                child: ReusableImageContainer(
                                  imageUrl: bb.imageUrl,
                                  title: bb.title,
                                  time: bb.time,
                                ),
                              ),
                            );
                          },
                          itemCount: provider.filteredBinauralBeatsList.length,
                        ),
                      ),
              ],
            ),
            Positioned(
                bottom: 0,
                child: BottomAudioPlayer(
                  bottomPadding: 0,
                  height: 100,
                )),
          ],
        ),
      ),
    );
  }
}
