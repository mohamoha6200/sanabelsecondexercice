import 'dart:core';
import 'package:flame/flame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:provider/provider.dart';
import 'package:sanabelsecondexercice/components/providers/DrawerState.dart';
import 'package:sanabelsecondexercice/pages/NavigateLetter.dart';
import 'package:sanabelsecondexercice/pages/homeV2.dart';
import 'package:sanabelsecondexercice/theme/perrine.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResultSucessQuestion extends StatefulWidget {
  @override
  _ResultSucessQuestionState createState() => _ResultSucessQuestionState();
}

int myExercice;
String subQuestion = '';

class _ResultSucessQuestionState extends State<ResultSucessQuestion> {
  @override
  void initState() {
    super.initState();

    Flame.audio.play('goodComplete.mp3');

    Flame.audio.play('oueee.mp3');
    gettingLetter();
  }

  gettingLetter() async {
    final prefs = await SharedPreferences.getInstance();
    final myexercice =
        Provider.of<DrawerStateInfo>(context, listen: false).getCurrentDrawer;
    // prefs.getInt('currentExercice') ?? 0;
    setState(() {
      subQuestion = prefs.getString('currentLetter');
      myExercice = myexercice;
    });

    print("subQuestion in result === ");
    print(subQuestion);
    print("myexercice  in result=== ");
    print(myexercice);
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Material(
      type: MaterialType.transparency,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Dialog(
            child: Container(
              child: Image.asset(
                'assets/goodg.png',
                width: screenSize.width / 4,
                height: screenSize.height * 0.75,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            decoration:
                new BoxDecoration(color: Colors.transparent, boxShadow: [
              new BoxShadow(
                color: Color.fromRGBO(255, 235, 59, 0.75),
                blurRadius: 80.0,
              ),
            ]),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: ((subQuestion == 'أ' && myExercice == 3) ||
                      (subQuestion != 'أ' && myExercice == 4))
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop(true);

                    Navigator.of(context).pushReplacement(
                      PageTransition(
                        duration: Duration(milliseconds: 1000),
                        type: PageTransitionType.rippleMiddle,
                        child: HomePageV2(),
                      ),
                    );
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        margin: new EdgeInsets.symmetric(
                            horizontal: screenSize.width / 80),
                        child: Icon(
                          Icons.home,
                          size: screenSize.width / 32,
                          color: Colors.purple,
                        ),
                      ),
                      Container(
                        child: Text(
                          'إِلَى الْحُرُوفْ',
                          style: TextStyle(
                              color: Colors.purple,
                              fontSize: 25.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: screenSize.width / 80),
                  child: InkWell(
                    onTap: () {
                      Provider.of<DrawerStateInfo>(context, listen: false)
                          .setCurrentExercice(myExercice);
                      Navigator.of(context).pop(true);

                      // Navigator.pushReplacement(context,
                      //     MaterialPageRoute(builder: (BuildContext context) {
                      //   return NavigateLetter();
                      // }));
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                          margin: new EdgeInsets.symmetric(
                              horizontal: screenSize.width / 80),
                          child: Icon(
                            Icons.autorenew,
                            size: screenSize.width / 32,
                            color: Colors.purple,
                          ),
                        ),
                        Container(
                          child: Text(
                            'أعيد التمرين',
                            style: TextStyle(
                                color: Colors.purple,
                                fontSize: 25.0,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: !((subQuestion == 'أ' && myExercice == 3) ||
                      (subQuestion != 'أ' && myExercice == 4)),
                  child: InkWell(
                    onTap: () {
                      Provider.of<DrawerStateInfo>(context, listen: false)
                          .setCurrentExercice(myExercice + 1);
                      Navigator.of(context).pop(true);

                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return NavigateLetter();
                      }));
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                          child: Text(
                            'الْتَمْرِيِنُ التالي',
                            style: TextStyle(
                                color: Colors.purple,
                                fontSize: 25.0,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          margin: new EdgeInsets.symmetric(
                              horizontal: screenSize.width / 80),
                          child: Icon(
                            Icons.forward,
                            size: screenSize.width / 32,
                            color: Colors.purple,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
 