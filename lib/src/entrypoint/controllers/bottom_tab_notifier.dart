import 'package:flutter/widgets.dart';

class TabIndexNotifier with ChangeNotifier{
  int _index =0;
  int get index => _index;

  void setIndex(int index){
    _index = index;
    notifyListeners();
  }
}