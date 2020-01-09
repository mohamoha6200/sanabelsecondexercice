import 'package:flutter/material.dart';

class DrawerStateInfo with ChangeNotifier {
  int _currentExercice = 1;

  int get getCurrentDrawer => _currentExercice;

  void setCurrentExercice(int drawer) {
    _currentExercice = drawer;
    notifyListeners();
  }

  // void increment() {
  //   notifyListeners();
  // }
}