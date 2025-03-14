import 'package:flutter/material.dart';
import 'package:nirvanafit/core/theme/app_gradients.dart';
import 'package:nirvanafit/core/theme/app_styles.dart';
import 'package:nirvanafit/shared/view/widgets/global_widgets.dart';

class ReusableStylishContainer2 extends StatelessWidget {
  final String title;
  final String description;
  final List<Color> colors;
  final String image;
  final String buttonText;
  final VoidCallback onTap;

  const ReusableStylishContainer2(
      {required this.title,
      required this.colors,
      required this.image,
      super.key,
      this.buttonText = "Clarify Doubts",
      required this.onTap,
      required this.description});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only( top: 40),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              padding: const EdgeInsets.all(15),
              width: w,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: colors),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: w * 0.5,
                    child: Text(title,
                        style: AppStyles.headingPrimary(
                            context: context, color: Colors.white)),
                  ),
                  spacerH(15),
                  SizedBox(
                    width: w * 0.5,
                    child: Text(
                      description,
                      style: AppStyles.descriptionPrimary(
                          context: context, color: Colors.white, fontSize: 15),
                    ),
                  ),
                  spacerH(15),
                  Container(
                    width: w ,

                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: AppGradients.darkBlueGradient,
                      ),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: onTap,
                        borderRadius: BorderRadius.circular(10),
                        child: Center(
                          child: Text(buttonText,
                              style: AppStyles.descriptionPrimary(
                                  context: context,
                                  color: Colors.white,
                                  fontSize: 15)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: staticImage(assetName: image,height: 230),
        ),
      ],
    );
  }
}
