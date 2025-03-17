import 'package:flutter/material.dart';
import 'package:nirvanafit/core/theme/app_styles.dart';
import 'package:nirvanafit/features/sounds_theraphy/viewmodel/providers/faq_provider.dart';
import 'package:nirvanafit/shared/view/widgets/containers/reusable_folded_corner_container.dart';
import 'package:nirvanafit/shared/view/widgets/reusable_app_bar.dart';
import 'package:provider/provider.dart';
import '../../../../shared/view/widgets/global_widgets.dart';
import '../../../../shared/view/widgets/text_view/reusable_text_field.dart';
import '../../model/faq_model.dart';

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
    final List<FAQModel> filteredFAQ =
        context.watch<FaqProvider>().filteredFaq;
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: ReusableAppBar(
        text: 'FAQs',
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
              hintText: 'Search by Question',
              onChanged: (value) {
                uProvider.filterFaq(value);
              },
            ),
          ),
          spacerH(15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Text(
              'Binaural Beats & Soothing Music FAQs',
              style: AppStyles.headingPrimary(
                  context: context,
                  color: theme.onSurface,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),

          Visibility(
            visible: searchController.text.isNotEmpty,
            child: Padding(
              padding: const EdgeInsets.only(left: 35, right: 35, top: 10),
              child: Text(
                'Search Results (${filteredFAQ.length})',
                style: AppStyles.descriptionPrimary(
                    context: context,
                    color: theme.primary,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          spacerH(10),
          filteredFAQ.isEmpty
              ? SizedBox(
                  width: w,
                  height: h - 300,
                  child: Center(
                      child: Text(
                    'No question found',
                    style: AppStyles.descriptionPrimary(
                        context: context, color: theme.onSurface),
                  )))
              : Expanded(
                child: ListView.builder(
                    itemCount: filteredFAQ.length,
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    itemBuilder: (context, index) {
                      final e = filteredFAQ[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20, left: 20),
                        child: ReusableFoldedCornerContainer(
                          question: e.question,
                          answer: e.answer,
                          color: e.color,
                        ),
                      );
                    },
                  ),
              ),
        ],
      ),
    );
  }
}
