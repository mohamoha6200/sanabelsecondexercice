import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanabelsecondexercice/components/models/LetterBalloon.dart';
import 'package:sanabelsecondexercice/components/widgets/Balloon.dart';
import 'package:sanabelsecondexercice/components/widgets/PerrineAppBar.dart';
import 'package:sanabelsecondexercice/components/widgets/secondDrawer.dart';
import 'package:sanabelsecondexercice/pages/Exercice2.dart';
import 'package:sanabelsecondexercice/pages/Exercice3.dart';
import 'package:sanabelsecondexercice/pages/Exercice4.dart';
import 'package:sanabelsecondexercice/pages/Exercice5.dart';
import 'package:sanabelsecondexercice/pages/Exercice6.dart';
import 'package:sanabelsecondexercice/pages/ExerciceSeven.dart';
import 'package:sanabelsecondexercice/theme/style.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<LettreBalloon> letters = [
    new LettreBalloon(
        letter: 'أ', letterColor: 'red', balloonColor: 'purpleaccent'),
    new LettreBalloon(
        letter: 'ب', letterColor: 'yellow', balloonColor: 'green'),
    new LettreBalloon(
        letter: 'ت', letterColor: 'white', balloonColor: 'orange'),
    new LettreBalloon(letter: 'ث', letterColor: 'red', balloonColor: 'blue'),
    new LettreBalloon(
        letter: 'ج', letterColor: 'orange', balloonColor: 'blueaccent'),
    new LettreBalloon(
        letter: 'ج', letterColor: 'orange', balloonColor: 'blueaccent'),
    new LettreBalloon(
        letter: 'ح', letterColor: 'orange', balloonColor: 'yellow'),
    new LettreBalloon(
        letter: 'خ', letterColor: 'yellow', balloonColor: 'purple'),
    new LettreBalloon(
        letter: 'د', letterColor: 'red', balloonColor: 'purpleaccent'),
    new LettreBalloon(
        letter: 'ذ', letterColor: 'yellow', balloonColor: 'green'),
    new LettreBalloon(
        letter: 'ذ', letterColor: 'yellow', balloonColor: 'green'),
    new LettreBalloon(
        letter: 'ر', letterColor: 'white', balloonColor: 'orange'),
    new LettreBalloon(letter: 'ز', letterColor: 'red', balloonColor: 'blue'),
    new LettreBalloon(
        letter: 'س', letterColor: 'orange', balloonColor: 'blueaccent'),
    new LettreBalloon(
        letter: 'ش', letterColor: 'orange', balloonColor: 'yellow'),
    new LettreBalloon(
        letter: 'ش', letterColor: 'orange', balloonColor: 'yellow'),
    new LettreBalloon(
        letter: 'ص', letterColor: 'yellow', balloonColor: 'purple'),
    new LettreBalloon(
        letter: 'ض', letterColor: 'red', balloonColor: 'purpleaccent'),
    new LettreBalloon(
        letter: 'ط', letterColor: 'yellow', balloonColor: 'green'),
    new LettreBalloon(
        letter: 'ظ', letterColor: 'white', balloonColor: 'orange'),
    new LettreBalloon(
        letter: 'ظ', letterColor: 'white', balloonColor: 'orange'),
    new LettreBalloon(letter: 'ع', letterColor: 'red', balloonColor: 'blue'),
    new LettreBalloon(
        letter: 'غ', letterColor: 'orange', balloonColor: 'blueaccent'),
    new LettreBalloon(
        letter: 'ف', letterColor: 'orange', balloonColor: 'yellow'),
    new LettreBalloon(
        letter: 'ق', letterColor: 'yellow', balloonColor: 'purple'),
    new LettreBalloon(
        letter: 'ق', letterColor: 'yellow', balloonColor: 'purple'),
    new LettreBalloon(
        letter: 'ك', letterColor: 'red', balloonColor: 'purpleaccent'),
    new LettreBalloon(
        letter: 'ل', letterColor: 'yellow', balloonColor: 'green'),
    new LettreBalloon(
        letter: 'م', letterColor: 'white', balloonColor: 'orange'),
    new LettreBalloon(letter: 'ن', letterColor: 'red', balloonColor: 'blue'),
    new LettreBalloon(letter: 'ن', letterColor: 'red', balloonColor: 'blue'),
    new LettreBalloon(
        letter: 'ه', letterColor: 'red', balloonColor: 'blueaccent'),
    new LettreBalloon(
        letter: 'و', letterColor: 'orange', balloonColor: 'yellow'),
    new LettreBalloon(
        letter: 'ي', letterColor: 'orange', balloonColor: 'purple'),
    new LettreBalloon(
        letter: 'ي', letterColor: 'orange', balloonColor: 'purple'),
  ];

  @override
  void initState() {
    super.initState();

    setState(() {});
  }

  Widget childWidget() {
    Size screenSize = MediaQuery.of(context).size;
    Widget conditional;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        child: new GridView.count(
          // shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          crossAxisCount: 4,

          children: List.generate(letters.length, (i) {
            var a = i + 1;

            if ((a % 5 != 0)) {
              conditional = InkWell(
                onTap: () {
                  print('to ex 3');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    // return ExerciceFive(subQuestion:letters[a-1].letter);
                    // return ExerciceFour(subQuestion: letters[a - 1].letter);
                    //return ExerciceSeven();
                    return ExerciceThree();
                  }));
                },
                child: Balloon(
                    letter: letters[a - 1].letter,
                    letterColor: letters[a - 1].letterColor,
                    balloonColor: letters[a - 1].balloonColor),
              );
            } else {
              conditional = InkWell(
                child: Padding(
                  padding: EdgeInsets.all(screenSize.width / 60),
                  child: Container(
                    child: Image.asset(
                      'assets/recap.png',
                    ),
                  ),
                ),
              );
            }
            return conditional;
          }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundMainColor,
        appBar: PerrineAppBar(height: 80, title: 'الْخرُوفُ الْعَرَبِيَّةُ',menuIcon:true),
        drawer: AppDrawer(),
        body: childWidget());
  }
}
