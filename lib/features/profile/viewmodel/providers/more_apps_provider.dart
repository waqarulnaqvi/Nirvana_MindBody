import 'package:flutter/material.dart';
import '../../view/data/more_apps_contents.dart';

class MoreAppsProvider extends ChangeNotifier{
  List<MoreAppsContents> _filteredApps = moreAppsContentsList;

  //Getter
  List<MoreAppsContents> get filteredApps => _filteredApps;

  //Setter
  set filteredApps(List<MoreAppsContents> value) {
    _filteredApps = value;
    notifyListeners();
  }

  //Methods
  void filterApps(String text){
    filteredApps = moreAppsContentsList
        .where((app) => app.title
        .toLowerCase()
        .contains(text.toLowerCase()))
        .toList();
  }
}

// void _filterApps() {
//   setState(() {
//     filteredApps = moreAppsContentsList
//         .where((app) => app.title
//             .toLowerCase()
//             .contains(searchController.text.toLowerCase()))
//         .toList();
//   });
// }
