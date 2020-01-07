import 'package:flutter/material.dart';
import 'package:sanabelsecondexercice/pages/DragToBoxExercice.dart';
import 'package:sanabelsecondexercice/pages/Exercice5.dart';
import 'package:sanabelsecondexercice/pages/Exercice8.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavigateLetter {
  SharedPreferences prefs;
  
  Future<String> getLetter() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('currentLetter');
  }
  redirectToExercice() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String letter = prefs.getString('currentLetter');
    if (letter != 'أ')  return ExerciceFive(); // 7 cards and 4 boxes only Ba
    else return ExerciceEight(); // circles
    
  }
}
