import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  int _selectMenuOp = 1;

  int get getSelectMenuOp {
    return _selectMenuOp;
  }

  set setSelectMenuOp(int selectMenuOp) {
    _selectMenuOp = selectMenuOp;
    notifyListeners();
  }
}
