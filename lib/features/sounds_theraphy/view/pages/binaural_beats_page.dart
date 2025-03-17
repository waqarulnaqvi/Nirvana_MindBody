import 'package:flutter/material.dart';
import 'package:nirvanafit/features/sounds_theraphy/data/binaural_beats_contents.dart';
import 'package:nirvanafit/shared/view/widgets/reusable_app_bar.dart';
import '../widgets/containers/reusable_image_container.dart';

class BinauralBeatsPage extends StatelessWidget {
  const BinauralBeatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(text: "Binaural Beats",isCenterText: false,),
        body: ListView.builder(
          padding: const EdgeInsets.only(top: 10,bottom: 100),
          itemBuilder: (context, index) {
            final sm = binauralBeatsContentsList[index];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: ReusableImageContainer(
                image: sm.image,
                title: sm.title,
                time: sm.time,
              ),
            );
          },
          itemCount: binauralBeatsContentsList.length,
        ));
  }
}
