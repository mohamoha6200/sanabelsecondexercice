import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:sanabelsecondexercice/pages/Exercice3.09-01.dart';
import 'package:sanabelsecondexercice/pages/Exercice3.dart';
import 'package:sanabelsecondexercice/pages/Exercice3.old.dart';
import 'package:sanabelsecondexercice/pages/Exercice4v2.dart';
import 'package:sanabelsecondexercice/pages/Exercice4v3.dart';
import 'package:sanabelsecondexercice/pages/Exercice9-4b.dart';
import 'package:sanabelsecondexercice/pages/ExerciceSeven.dart';
import 'package:sanabelsecondexercice/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:sanabelsecondexercice/pages/DragToBoxExercice.dart';
import 'package:sanabelsecondexercice/pages/Exercice5.dart';
import 'package:sanabelsecondexercice/pages/Exercice8.dart';

import 'homeV2.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class NavigateLetter {
//   SharedPreferences prefs;

//   Future<String> getLetter() async {
//      SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString('currentLetter');
//   }
//   redirectToExercice() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String letter = prefs.getString('currentLetter');
//     if (letter != 'أ')  return ExerciceFive(); // 7 cards and 4 boxes only Ba
//     else return ExerciceEight(); // circles

//   }
// }

class NavigateLetter extends StatefulWidget {
  @override
  _NavigateLetterState createState() => _NavigateLetterState();
}

class _NavigateLetterState extends State<NavigateLetter> {
  String subQuestion = '';
  SharedPreferences prefs;
  String subQuestionLatin = '';
  int currentExercice;

  @override
  void initState() {
    super.initState();

    gettingLetter();
  }

  gettingLetter() async {
    SharedPreferences.getInstance().then((onValue) async {
      prefs = onValue;
      setState(() {
        subQuestion = prefs.getString('currentLetter');
        currentExercice = prefs.getInt('currentExercice');
        // currentExercice++;
      });
      print("currentExercice  to drawer=== ");
      print(currentExercice);
      initializeSubQuestionLatin();

      // print("subQuestion === ");
      // print(subQuestion);
      // print("currentExercice === ");
      // print(currentExercice);
    });
    // SharedPreferences prefs =
    //                           await SharedPreferences.getInstance();
    // await prefs.setInt('currentExercice', currentExercice);
  }

  redirectToExercice() {
    String route = 'home';
    if (subQuestion != '' && currentExercice != null) {
      // if (subQuestion != 'أ') {

      // }
      route = '$subQuestionLatin-ex$currentExercice';
    }
    print('route=' + route);
    switch (route) {
      case 'home':
        return HomePageV2();
        break;
      case 'alif-ex1':
        return ExerciceFourV3(); // listen and drag
      case 'alif-ex2':
        return ExerciceEight();
        break; // circles
      case 'alif-ex3':
        return ExerciceSeven();
        break; // tap on card
      case 'ba-ex1':
        return ExerciceFourV3();
        break; // listen and drag
      case 'ba-ex2':
        return ExerciceThree(); 
        break; // match right answer
      case 'ba-ex3':
        return ExerciceFive();
        break; // 7 cards and 4 boxes only Ba(),
      case 'ba-ex4':
        return Exercice9();
        break; // tap on letters
      default:
        return HomePageV2();
    }
  }

  initializeSubQuestionLatin() {
    // SharedPreferences prefs = await SharedPreferences.getInstance();

    // await prefs.setInt('currentExercice', currentExercice);
    switch (subQuestion) {
      case 'أ':
        {
          setState(() {
            subQuestionLatin = 'alif';
          });
        }
        break;

      default:
        {
          setState(() {
            subQuestionLatin = 'ba';
          });
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    print('in NavigateLetter build');

    if (subQuestion != '' &&
        currentExercice != null &&
        subQuestionLatin != '') {
      return redirectToExercice();
    } else
      return HomePage();
  }
}
