import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  int _selectdMenuOpt = 0;
  int get selectedMenuOpt {
    return _selectdMenuOpt;
  }

  set selectedMenuOpt(int number) {
    _selectdMenuOpt = number;
    notifyListeners();
  }
}
