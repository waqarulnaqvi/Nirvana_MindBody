import 'package:flutter/material.dart';
import '../../model/faq_contents.dart';

class FaqProvider extends ChangeNotifier {
  List<FAQContents> _filteredFaq = faqContentsList;

  //Getter
  List<FAQContents> get filteredFaq => _filteredFaq;

  //Setter
  set filteredFaq(List<FAQContents> value) {
    _filteredFaq = value;
    notifyListeners();
  }

  void filterFaq(String text) {
    filteredFaq = faqContentsList
        .where((faq) => faq.question.toLowerCase().contains(text.toLowerCase()))
        .toList();
  }
}
