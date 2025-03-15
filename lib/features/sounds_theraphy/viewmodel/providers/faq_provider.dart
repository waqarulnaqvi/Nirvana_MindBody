import 'package:flutter/material.dart';
import '../../model/faq_contents.dart';

class FaqProvider extends ChangeNotifier {
  List<FAQContents> _filteredFaq = faqContentsList;

  //Getter
  List<FAQContents> get filteredFaq => _filteredFaq;

  //Setter
  set filteredApps(List<FAQContents> value) {
    _filteredFaq = value;
    notifyListeners();
  }
}
