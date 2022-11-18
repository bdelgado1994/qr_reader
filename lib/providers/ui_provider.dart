import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  int _selectdMenuOpt = 1;
  int get selectedMenuOpt {
    return _selectdMenuOpt;
  }

  set selectedMenuOpt(int i) {
    this._selectdMenuOpt = i;
    notifyListeners();
  }
}
