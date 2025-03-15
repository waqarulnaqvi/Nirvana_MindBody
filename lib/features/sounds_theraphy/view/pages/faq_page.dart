import 'package:flutter/material.dart';
import 'package:nirvanafit/core/theme/app_styles.dart';
import 'package:nirvanafit/features/sounds_theraphy/model/faq_contents.dart';
import 'package:nirvanafit/features/sounds_theraphy/viewmodel/providers/faq_provider.dart';
import 'package:nirvanafit/shared/view/widgets/containers/reusable_folded_corner_container.dart';
import 'package:nirvanafit/shared/view/widgets/reusable_app_bar.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/app_gradients.dart';
import '../../../../shared/view/widgets/containers/reusable_stylish_container.dart';
import '../../../../shared/view/widgets/global_widgets.dart';
import '../../../../shared/view/widgets/text_view/reusable_text_field.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    final double h = MediaQuery.of(context).size.height;
    final uProvider = context.read<FaqProvider>();
    final List<FAQContents> filteredFAQ = context.watch<FaqProvider>().filteredFaq;
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: ReusableAppBar(text: 'FAQs', isCenterText: false,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            spacerH(30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ReusableTextField(
                controller: searchController,
                hintText: 'Search by App Name',
                onChanged:(value){
                  // uProvider.filterApps(value);
                },
              ),
            ),
            spacerH(),
            filteredFAQ.isEmpty
                ? SizedBox(
                width: w,
                height: h-200,
                child: Center(child: Text('No apps found',style: AppStyles.descriptionPrimary(context: context,color: theme.onSurface),)))
                : ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredFAQ.length,
              itemBuilder: (context, index) {
                final e = filteredFAQ[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20,left: 20),
                  child: ReusableFoldedCornerContainer(),
                  // child: ReusableStylishContainer(
                  //   h: 350,
                  //   w: w,
                  //   colors: AppGradients.skyBlueMyAppGradient,
                  //   isCarousel: false,
                  //   title: e.question,
                  //   description: e.answer,
                  //   image: "",
                  //   onTap: () {
                  //     // openUrl(url: e.url, context: context);
                  //   },
                  // ),
                );
              },
            ),
            spacerH(100),
          ],
        ),
      ),
    );
  }
}