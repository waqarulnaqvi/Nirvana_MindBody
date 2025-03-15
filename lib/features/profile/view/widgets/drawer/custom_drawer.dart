import 'package:flutter/material.dart';
import 'package:nirvanafit/core/theme/app_gradients.dart';
import 'package:nirvanafit/features/profile/view/data/drawer_content.dart';
import 'package:nirvanafit/shared/view/widgets/global_widgets.dart';
import '../../../../../core/constants/static_assets.dart';
import 'drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({required this.h, required this.w, super.key});

  final double h;
  final double w;


  @override
  Widget build(BuildContext context) {

    // void _sendEmail(String path) async {
    //   // final String name = _nameController.text.trim();
    //   // final String mobile = _mobileController.text.trim();
    //   // final String message = _messageController.text.trim();
    //
    //   final Uri emailUri = Uri(
    //     scheme: 'mailto',
    //     path: path,
    //     // query: 'subject=Contact from $name&body=Name: $name\nMobile: $mobile\nMessage: $message',
    //     query: '',
    //   );
    //
    //   if (await canLaunchUrl(emailUri)) {
    //     await launchUrl(emailUri);
    //   } else {
    //     IconSnackBar.show(
    //       context,
    //       label: "Something went Wrong!",
    //       labelTextStyle: const TextStyle(color: Colors.white),
    //       snackBarType: SnackBarType.fail,
    //     );
    //   }
    // }

    return Container(
      width: w,
      height: h,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white, Color.fromARGB(255, 184, 241, 240)],
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: w,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      // bottomRight: Radius.circular(50),
                    ),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: AppGradients.skyBlueMyAppGradient),
                ),
                // padding: const EdgeInsets.,
                child: const Center(
                  child: CircleAvatar(
                    backgroundImage:
                    AssetImage(StaticAssets.appIcon),
                    radius: 45,
                  ),
                )),
            ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context,index){
              var value = drawerContentList(context)[index];
              return DrawerTile(
                onTap: value.onTap,
                icon: value.icon,
                title: value.title,
              );
            },itemCount: drawerContentList(context).length,),
            spacerH(160),
          ],
        ),
      ),
    );
  }
}

//Email sender code
//  final Email email = Email(
//                   body: 'Please provide your feedback here.',
//                   subject: 'Feedback',
//                   recipients: ['syedwaqarul786@gmail.com'],
//                   isHTML: false,
//                 );
//
//                 try {
//                   await FlutterEmailSender.send(email);
//                   // ScaffoldMessenger.of(context).showSnackBar(
//                   //   SnackBar(content: Text('Email sent successfully!')),
//                   // );
//                 } on PlatformException catch (e) {
//                   if (e.code == 'not_available') {
//                     IconSnackBar.show(
//                       context,
//                       label: "No email clients found! Please install an email app.",
//                       labelTextStyle: const TextStyle(color: Colors.white),
//                       snackBarType: SnackBarType.alert,
//                     );
//
//                   } else {
//                     IconSnackBar.show(
//                       context,
//                       label: 'Failed to send email: ${e.message}',
//                       labelTextStyle: const TextStyle(color: Colors.white),
//                       snackBarType: SnackBarType.fail,
//                     );
//                   }
//                 } catch (error) {
//
//                   IconSnackBar.show(
//                     context,
//                     label: 'An unexpected error occurred: $error',
//                     labelTextStyle: const TextStyle(color: Colors.white),
//                     snackBarType: SnackBarType.fail,
//                   );
//
//                 }