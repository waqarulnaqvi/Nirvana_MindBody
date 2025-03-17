import 'package:flutter/material.dart';
import '../../data/faq_contents.dart';
import '../../model/faq_model.dart';

class FaqProvider extends ChangeNotifier {
  List<FAQModel> _filteredFaq = faqContentsList;

  //Getter
  List<FAQModel> get filteredFaq => _filteredFaq;

  //Setter
  set filteredFaq(List<FAQModel> value) {
    _filteredFaq = value;
    notifyListeners();
  }

  void filterFaq(String text) {
    filteredFaq = faqContentsList
        .where((faq) => faq.question.toLowerCase().contains(text.toLowerCase()))
        .toList();
  }
}
