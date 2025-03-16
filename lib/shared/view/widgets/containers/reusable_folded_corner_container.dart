import 'package:flutter/material.dart';
import 'package:nirvanafit/core/theme/app_styles.dart';
import 'package:nirvanafit/shared/view/widgets/global_widgets.dart';

import '../painter/folded_corner_painter.dart';

class ReusableFoldedCornerContainer extends StatelessWidget {
  final String question;
  final String answer;
  final Color color;

  const ReusableFoldedCornerContainer(
      {super.key,
      required this.question,
      required this.answer,
      required this.color});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Container(
          width: 16.0,
          height: 16.0,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(
              color: theme.onSurface,
              width: 3.0,
            ),
          ),
        ),
        SizedBox(
          width: 8,
          child: Divider(
            thickness: 2, // Set the thickness of the line
            color: theme.onSurface, // Set the color of the line
          ),
        ),
        Expanded(
          child: CustomPaint(
            painter: FoldedCornerPainter(color: color),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Text("Q: $question",
                          style: AppStyles.headingPrimary(
                              context: context,
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ),
                    spacerH(8),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text("Ans: $answer",
                          style: AppStyles.descriptionPrimary(
                              context: context,
                              color: Colors.black54,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                    ),
                  ]),
            ),
          ),
        ),
        SizedBox(
          width: 35,
          child: Divider(
            thickness: 2, // Set the thickness of the line
            color: theme.onSurface, // Set the color of the line
          ),
        ),
      ],
    );
  }
}
