import 'package:flutter/material.dart';
import 'package:nirvanafit/features/sounds_theraphy/view/widgets/containers/reusable_image_container.dart';
import 'package:nirvanafit/shared/view/widgets/reusable_app_bar.dart';
import 'package:provider/provider.dart';
import '../../../../core/routes/paths.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../shared/view/widgets/global_widgets.dart';
import '../../../../shared/view/widgets/text_view/reusable_text_field.dart';
import '../../viewmodel/providers/audio_player_provider.dart';
import '../../viewmodel/providers/content_filter_provider.dart';
import '../widgets/bottom_audio_player.dart';

class SoothingMusicPage extends StatefulWidget {
  const SoothingMusicPage({super.key});

  @override
  State<SoothingMusicPage> createState() => _SoothingMusicPageState();
}

class _SoothingMusicPageState extends State<SoothingMusicPage> {
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
        text: "Soothing Music",
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
                            uProvider.filterSoothingMusicList(value);
                          },
                        ),
                      ),
                      Visibility(
                        visible: searchController.text.isNotEmpty,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 25, right: 35, top: 15),
                          child: Text(
                            'Search Results (${provider.filteredSoothingMusicList.length})',
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
                      provider.filteredSoothingMusicList.isEmpty
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
                                  final sm =
                                      provider.filteredSoothingMusicList[index];

                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, Paths.audioPlayerPage,
                                            arguments: index);
                                        // arguments:{
                                        //    'index':index,
                                        //  });
                                      },
                                      child: ReusableImageContainer(
                                        imageUrl: sm.imageUrl,
                                        title: sm.title,
                                        time: sm.time,
                                      ),
                                    ),
                                  );
                                },
                                itemCount:
                                    provider.filteredSoothingMusicList.length,
                              ),
                            ),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    child: BottomAudioPlayer(bottomPadding: 0, height: 100),
                  )
                ],
              )),
      // bottomNavigationBar: BottomAudioPlayer(bottomPadding: 0,height: 100,),
    );
  }
}
