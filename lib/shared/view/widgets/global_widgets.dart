import 'package:flutter/material.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

// void openWhatsApp([String phone="918400002793"]) async {
//   String url = "https://wa.me/$phone"; // WhatsApp API link
//   Uri uri = Uri.parse(url);
//
//   if (await canLaunchUrl(uri)) {
//     await launchUrl(uri, mode: LaunchMode.externalApplication);
//   } else {
//     print("Could not launch $url");
//   }
// }

void openUrl(
    {required String url,
    required BuildContext context,
    String label = "Unable to open!"}) async {
  try {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      if (context.mounted) {
        IconSnackBar.show(context,
            label: label, snackBarType: SnackBarType.alert);
      }
    }
  } catch (e) {
    if (context.mounted) {
      IconSnackBar.show(context,
          label: "The link cannot be opened!", snackBarType: SnackBarType.fail);
    }
  }
}

Image staticImage(
        {required String assetName,
        double? width,
        double? height,
        BoxFit fit = BoxFit.cover}) =>
    Image.asset(assetName, width: width, height: height, fit: fit);

SizedBox spacerH([double height = 20]) => SizedBox(height: height);

SizedBox spacerW([double width = 20]) => SizedBox(width: width);
