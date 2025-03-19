import 'package:flutter/material.dart';
import 'package:nirvanafit/features/sounds_theraphy/model/soothing_music_model.dart';
import 'package:nirvanafit/features/sounds_theraphy/view/widgets/containers/reusable_image_container.dart';
import 'package:nirvanafit/shared/view/widgets/reusable_app_bar.dart';
import 'package:provider/provider.dart';
import '../../../../core/routes/paths.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../shared/view/widgets/global_widgets.dart';
import '../../../../shared/view/widgets/text_view/reusable_text_field.dart';
import '../../viewmodel/providers/content_filter_provider.dart';

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
    final List<SoothingMusicModel> filterSMList =
        context.watch<ContentFilterProvider>().filteredSoothingMusicList;
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: ReusableAppBar(
          text: "Soothing Music",
          isCenterText: false,
        ),
        body: Column(
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
                padding: const EdgeInsets.only(left: 30, right: 35, top: 15),
                child: Text(
                  'Search Results (${filterSMList.length})',
                  style: AppStyles.descriptionPrimary(
                      context: context,
                      color: theme.primary,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            spacerH(10),

            filterSMList.isEmpty
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
                      padding: const EdgeInsets.only(top: 5, bottom: 100),
                      itemBuilder: (context, index) {
                        final sm = filterSMList[index];

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
                      itemCount: filterSMList.length,
                    ),
                  ),
          ],
        ));
  }
}
