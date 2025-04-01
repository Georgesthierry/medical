import 'package:flutter/material.dart';

class TabControllerProvider extends ChangeNotifier {
  int selectedIndex = 0;
  List<String> tabs = ["Complete", "Upcoming", "Cancelled"];

  void changeTab(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}