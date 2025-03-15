import 'package:flutter/material.dart';
import 'package:nirvanafit/shared/view/widgets/%20clipper/folded_corner_clipper.dart';

class ReusableFoldedCornerContainer extends StatelessWidget {
  const ReusableFoldedCornerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final double w = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Container(
          width: 16.0,
          height: 16.0,
          decoration: BoxDecoration(
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
            painter: FoldedCornerClipper(color: theme.primary),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'FAQs',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text('This is a FAQ page'),

                ]),
          ),
        ),
         SizedBox(
            width: 35,
           child: Divider(
              thickness: 2, // Set the thickness of the line
              color: Colors.black, // Set the color of the line
            ),
         ),
      ],
    );
  }
}
