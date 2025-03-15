import 'package:flutter/material.dart';
import 'package:nirvanafit/shared/view/widgets/global_widgets.dart';
import 'package:nirvanafit/shared/view/widgets/reusable_app_bar.dart';
import 'package:nirvanafit/shared/view/widgets/text_view/reusable_text_field.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../shared/view/widgets/containers/reusable_stylish_container.dart';
import '../../viewmodel/providers/more_apps_provider.dart';
import '../data/more_apps_contents.dart';

class MoreAppsPage extends StatefulWidget {
  const MoreAppsPage({super.key});

  @override
  State<MoreAppsPage> createState() => _MoreAppsPageState();
}

class _MoreAppsPageState extends State<MoreAppsPage> {
  final TextEditingController searchController = TextEditingController();


  // @override
  // void initState() {
  //   super.initState();
  //   searchController.addListener(_onSearchChanged);
  // /* 1) Registers a callback function (listener) that is called every time the object's state changes.
  //  2) Useful for reacting to changes in TextEditingController, AnimationController, ChangeNotifier, etc.
  // */
  // }


  // void _onSearchChanged() {
  //   Provider.of<MoreAppsProvider>(context, listen: false)
  //       .filterApps(searchController.text);
  // }

  @override
  void dispose() {
    // searchController.removeListener(_onSearchChanged);
    /*
    1)Unregisters the callback function when it's no longer needed.
    2)This prevents memory leaks and unnecessary updates.
     */
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    final double h = MediaQuery.of(context).size.height;
    final uProvider = context.read<MoreAppsProvider>();
    final List<MoreAppsContents> filteredApps = context.watch<MoreAppsProvider>().filteredApps;
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: ReusableAppBar(text: 'More Apps', isCenterText: false,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              spacerH(30),
              ReusableTextField(
                controller: searchController,
                hintText: 'Search by App Name',
                onChanged:(value){
                  uProvider.filterApps(value);
                },
              ),
              spacerH(),
              filteredApps.isEmpty
                  ? SizedBox(
                  width: w,
                  height: h-200,
                  child: Center(child: Text('No apps found',style: AppStyles.descriptionPrimary(context: context,color: theme.onSurface),)))
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: filteredApps.length,
                      itemBuilder: (context, index) {
                        final e = filteredApps[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: ReusableStylishContainer(
                            h: 350,
                            w: w,
                            colors: e.colors,
                            isCarousel: false,
                            title: e.title,
                            description: e.description,
                            image: e.image,
                            onTap: () {
                              openUrl(url: e.url, context: context);
                            },
                          ),
                        );
                      },
                    ),
              spacerH(100),
            ],
          ),
        ),
      ),
    );
  }
}