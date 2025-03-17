import 'package:flutter/material.dart';
import 'package:nirvanafit/core/constants/static_assets.dart';
import 'package:nirvanafit/core/theme/app_styles.dart';
import 'package:nirvanafit/features/sounds_theraphy/data/soothing_music_contents.dart';
import 'package:nirvanafit/features/sounds_theraphy/view/widgets/containers/reusable_image_container.dart';
import 'package:nirvanafit/shared/view/widgets/reusable_app_bar.dart';

class SoothingMusicPage extends StatelessWidget {
  const SoothingMusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ReusableAppBar(
          text: "Soothing Music",
          isCenterText: false,
        ),
        body: ListView.builder(
          padding: const EdgeInsets.only(top: 10,bottom: 100),
          itemBuilder: (context, index) {
            final sm = soothingMusicContentsList[index];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: ReusableImageContainer(
                image: sm.image,
                title: sm.title,
                time: sm.time,
              ),
            );
          },
          itemCount: soothingMusicContentsList.length,
        ));
  }
}
