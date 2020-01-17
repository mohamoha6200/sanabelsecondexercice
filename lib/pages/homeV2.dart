import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:provider/provider.dart';
import 'package:sanabelsecondexercice/components/models/LetterBalloon.dart';
import 'package:sanabelsecondexercice/components/providers/DrawerState.dart';
import 'package:sanabelsecondexercice/components/widgets/Balloon.dart';
import 'package:sanabelsecondexercice/components/widgets/ExerciceDrawer.dart';
import 'package:sanabelsecondexercice/components/widgets/HomeDrawer.dart';
import 'package:sanabelsecondexercice/theme/perrine.dart';
import 'package:sanabelsecondexercice/theme/style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'Exercice4v3.dart';

class HomePageV2 extends StatefulWidget {
  @override
  _HomePageV2State createState() => _HomePageV2State();
}

class _HomePageV2State extends State<HomePageV2> {
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
        letter: 'ح', letterColor: 'orange', balloonColor: 'yellow'),
    new LettreBalloon(
        letter: 'خ', letterColor: 'yellow', balloonColor: 'purple'),
    new LettreBalloon(
        letter: 'د', letterColor: 'red', balloonColor: 'purpleaccent'),
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
    new LettreBalloon(
        letter: 'ض', letterColor: 'red', balloonColor: 'purpleaccent'),
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
    new LettreBalloon(
        letter: 'ك', letterColor: 'red', balloonColor: 'purpleaccent'),
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
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int recapIndex;

  @override
  void initState() {
    super.initState();
    recapIndex = 0;
    initializePrefs();
  }

  Widget childWidget() {
    Widget conditional;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        child: AnimationLimiter(
          child: new GridView.count(
            // shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            crossAxisCount: 4,

            children: List.generate(
              letters.length+1,
              (i) {
                print(i);
                if (i != letters.length) {
                  conditional = AnimationConfiguration.staggeredGrid(
                    position: i,
                    duration: const Duration(milliseconds: 2000),
                    columnCount: 4,
                    child: FlipAnimation(
                      child: InkWell(
                        onTap: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();

                          await prefs.setString(
                              'currentLetter', letters[i].letter);
                          print('got from shared in home');
                          // print(prefs.getString('currentLetter'));
                          Provider.of<DrawerStateInfo>(context, listen: false)
                              .setCurrentExercice(1);
                          await prefs.setInt('currentExercice', 1);
                          Navigator.of(context).push(
                            PageTransition(
                              duration: Duration(milliseconds: 2000),
                              type: PageTransitionType.rippleMiddle,
                              child: ExerciceFourV3(),
                              // (letters[a - 1].letter != 'أ')
                              //     ? ExerciceFive() // 7 cards and 4 boxes only Ba
                              //     : ExerciceEight(), // circles
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
                            letter: letters[i].letter,
                            letterColor: letters[i].letterColor,
                            balloonColor: letters[i].balloonColor),
                      ),
                    ),
                  );
                } else {
                  conditional = AnimationConfiguration.staggeredGrid(
                    position: i,
                    duration: const Duration(milliseconds: 1000),
                    columnCount: 4,
                    child: ScaleAnimation(
                      child: FadeInAnimation(
                        child: InkWell(
                          child: Container(
                            child: Image.asset(
                              'assets/recap1.png',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return conditional;
              },
            ),
          ),
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
       drawer: HomeDrawer(),
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

  initializePrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // await prefs.setString('currentLetter', 'ب');
    // print('got from shared in home');
    await prefs.setInt('currentExercice', 1);
    print(prefs.getString('currentLetter'));
    print(prefs.getInt('currentExercice'));
  }
}
