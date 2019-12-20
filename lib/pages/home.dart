import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanabelsecondexercice/components/models/LetterBalloon.dart';
import 'package:sanabelsecondexercice/components/widgets/Balloon.dart';
import 'package:sanabelsecondexercice/components/widgets/PerrineAppBar.dart';
import 'package:sanabelsecondexercice/pages/Exercice3.dart';
import 'package:sanabelsecondexercice/theme/style.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<LettreBalloon> letters = [
    new LettreBalloon(letter: 'أ', letterColor: 'red', balloonColor: 'pink'),
    new LettreBalloon(
        letter: 'ب', letterColor: 'yellow', balloonColor: 'green'),
    new LettreBalloon(
        letter: 'ت', letterColor: 'white', balloonColor: 'orange'),
    new LettreBalloon(letter: 'ث', letterColor: 'red', balloonColor: 'blue'),
    new LettreBalloon(
        letter: 'ج', letterColor: 'orange', balloonColor: 'blueaccent'),
    new LettreBalloon(
        letter: 'ح', letterColor: 'orange', balloonColor: 'yellow'),
    new LettreBalloon(
        letter: 'خ', letterColor: 'yellow', balloonColor: 'purple'),
    new LettreBalloon(letter: 'د', letterColor: 'red', balloonColor: 'pink'),
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
        letter: 'ص', letterColor: 'yellow', balloonColor: 'purple'),
    new LettreBalloon(letter: 'ض', letterColor: 'red', balloonColor: 'pink'),
    new LettreBalloon(
        letter: 'ط', letterColor: 'yellow', balloonColor: 'green'),
    new LettreBalloon(
        letter: 'ظ', letterColor: 'white', balloonColor: 'orange'),
    new LettreBalloon(letter: 'ع', letterColor: 'red', balloonColor: 'blue'),
    new LettreBalloon(
        letter: 'غ', letterColor: 'orange', balloonColor: 'blueaccent'),
    new LettreBalloon(
        letter: 'ف', letterColor: 'orange', balloonColor: 'yellow'),
    new LettreBalloon(
        letter: 'ق', letterColor: 'yellow', balloonColor: 'purple'),
    new LettreBalloon(letter: 'ك', letterColor: 'red', balloonColor: 'pink'),
    new LettreBalloon(
        letter: 'ل', letterColor: 'yellow', balloonColor: 'green'),
    new LettreBalloon(
        letter: 'م', letterColor: 'white', balloonColor: 'orange'),
    new LettreBalloon(letter: 'ن', letterColor: 'red', balloonColor: 'blue'),
    new LettreBalloon(
        letter: 'ه', letterColor: 'red', balloonColor: 'blueaccent'),
    new LettreBalloon(
        letter: 'و', letterColor: 'orange', balloonColor: 'yellow'),
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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        child: new GridView.count(
          // shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          crossAxisCount: 4,
          children: List.generate(
            letters.length,
            (i) {
              var a = i + 1;
              if ((a % 5 == 0) && (a != 0)) {
                print(a);
                return InkWell(
                 
                  child: Container(
                    width: screenSize.width / 10,
                    height: screenSize.width / 10,
                    child: Image.asset(
                      'assets/recap.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              } else {
                return InkWell(
                   onTap: () {
                    print('to ex 3');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return ExerciceThree();
                    }));
                  },
                                  child: Balloon(
                      letter: letters[a - 1].letter,
                      letterColor: letters[a - 1].letterColor,
                      balloonColor: letters[a - 1].balloonColor),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundMainColor,
        appBar: PerrineAppBar(height: 80, title: 'الْخرُوفُ الْعَرَبِيَّةُ'),
        body: childWidget());
  }
}