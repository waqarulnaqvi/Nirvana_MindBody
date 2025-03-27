import 'package:flutter/material.dart';

import '../../../../shared/view/widgets/reusable_app_bar.dart';

class AudioVideoPlayerPage extends StatelessWidget {
  final int index;
  const AudioVideoPlayerPage({super.key, this.index=0});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return DefaultTabController(length: 2, child:
    Scaffold(
      appBar: const ReusableAppBar(text: 'Sessions',isCenterText: false,),
    body: Column(
      children: [
        // TabBar(tabs: )
      ],
    ),
    )
    );
  }
}
