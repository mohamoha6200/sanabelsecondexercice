import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:sanabelsecondexercice/components/models/LetterBalloon.dart';
import 'package:sanabelsecondexercice/components/widgets/Balloon.dart';
import 'package:sanabelsecondexercice/components/widgets/PerrineAppBar.dart';
import 'package:sanabelsecondexercice/components/widgets/SanabelAppBar.dart';
import 'package:sanabelsecondexercice/components/widgets/secondDrawer.dart';
import 'package:sanabelsecondexercice/pages/DragToBoxExercice.dart';
import 'package:sanabelsecondexercice/pages/Exercice1.dart';
import 'package:sanabelsecondexercice/pages/Exercice2.dart';
import 'package:sanabelsecondexercice/pages/Exercice3.dart';
import 'package:sanabelsecondexercice/pages/Exercice4.dart';
import 'package:sanabelsecondexercice/pages/Exercice5.dart';
import 'package:sanabelsecondexercice/pages/Exercice6.dart';
import 'package:sanabelsecondexercice/pages/Exercice8.dart';
import 'package:sanabelsecondexercice/pages/ExerciceSeven.dart';
import 'package:sanabelsecondexercice/pages/NavigateLetter.dart';
import 'package:sanabelsecondexercice/theme/perrine.dart';
import 'package:sanabelsecondexercice/theme/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final GlobalKey _scaffoldKey = new GlobalKey();

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
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int recapIndex;

  @override
  void initState() {
    super.initState();
    recapIndex = 0;
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
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();

                  await prefs.setString('currentLetter', letters[a - 1].letter);
                  print('got from shared in home');
                  print(prefs.getString('currentLetter'));
                  Navigator.of(context).push(
                    PageTransition(
                      duration: Duration(milliseconds: 2000),
                      type: PageTransitionType.rippleMiddle,
                      child: ExerciceFour(),
                    ),
                  );

                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (BuildContext context) {
                  //   //   return ExerciceFive(subQuestion:letters[a-1].letter);  // 7 cards and 4 boxes only Ba
                  //   return ExerciceFour(
                  //       subQuestion: letters[a - 1]
                  //           .letter); // parametered listen and drag
                  //   //   return ExerciceThree(); //match right answer
                  //   //  return ExerciceSeven(); // click pic when u see letter
                  //   //  return ExerciceEight(subQuestion: letters[a - 1].letter); // drag cirlce to box
                  //   // return DragToExercice(subQuestion: letters[a-1].letter);
                  //   //return NavigateLetter(letter: letters[a-1].letter).redirectToExercice();
                  //   // return ExerciceSix(subQuestion: letters[a - 1].letter);
                  // }));
                },
                child: Balloon(
                    letter: letters[a - 1].letter,
                    letterColor: letters[a - 1].letterColor,
                    balloonColor: letters[a - 1].balloonColor),
              );
            } else {
              setState(() {
                if (recapIndex < 6) {
                  recapIndex++;
                }
              });
              conditional = InkWell(
                child: Container(
                  child: Image.asset(
                    'assets/recap$recapIndex.png',
                    fit: BoxFit.fitWidth,
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
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: backgroundMainColor,
      //  appBar: PerrineAppBar(height: 80, title: 'الْخرُوفُ الْعَرَبِيَّةُ',menuIcon:true , menuTap: _scaffoldKey.currentState.toggle()),
      // appBar: PreferredSize(
      //     preferredSize: Size.fromHeight(screenSize.height / 6.75),
      //     child: new SanabelAppBar(
      //       title: 'الْحُرُوفُ الْعَرَبِيَّةُ',
      //     )),
      // -----------------------------
      //   appBar: AppBar(
      //   title: Text("Change Hamburger Icon Example"),
      //   leading: IconButton(
      //     icon: Icon(Icons.person),
      //     onPressed: () {
      //       _scaffoldKey.currentState.openDrawer();
      //     },
      //   ),
      // ),
      // ------------------
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenSize.height / 6),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          // leading: new Icon(Icons.menu),
          automaticallyImplyLeading: false,

          // iconTheme: IconThemeData(color: mainColorText, size: 40),

          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: greenColor,
              size: 30,
            ),
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            },
          ),

          // titleSpacing: screenSize.height/2,

          flexibleSpace: Center(
            child: new Text(
              'الْحُرُوفُ الْعَرَبِيَّةُ',
              style: styleAppBarGreen,
            ),
          ),
        ),
      ),
      drawer: AppDrawer(),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/classroom3.png"),
            fit: BoxFit.fill,
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.25), BlendMode.dstATop),
          ),
        ),
        child: childWidget(),
      ),
    );
  }
}
