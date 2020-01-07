import 'package:flame/flame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanabelsecondexercice/components/ExQuestionBar.dart';
import 'package:sanabelsecondexercice/components/widgets/ExerciceDrawer.dart';
import 'package:sanabelsecondexercice/components/widgets/ResultSuccessQuestion.dart';
import 'package:sanabelsecondexercice/components/widgets/exAppBar.dart';
import 'package:sanabelsecondexercice/components/widgets/letterOrText.dart';
import 'package:sanabelsecondexercice/theme/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Exercice9 extends StatefulWidget {
  @override
  _Exercice9State createState() => _Exercice9State();
}

class _Exercice9State extends State<Exercice9> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Map<String, bool> scoreMap = {};

  String subQuestion = '';

  Map<int, Map<int, List<String>>> answers = {
    0: {
      0: ['بِـ', 'ا', 'ع']
    },
    1: {
      0: ['ذُ', 'ج', 'ش']
    },
    2: {
      0: ['نــِ', 'ا', 'ب']
    },
    3: {
      2: ['ن', 'ا', 'بٌ']
    },
    4: {
      2: ['ر', 'ي', 'ـبٍ']
    },
    5: {
      0: ['جَـ', 'ت', 'ب']
    },
    6: {
      1: ['ب', 'ـبُـ', 'ب']
    },
    7: {
      1: ['ب', 'ـنِـ', 'ت']
    },
    8: {
      2: ['ا', 'ا', 'زُ']
    },
    9: {
      0: ['خَـ', 'ت', 'ب']
    },
    10: {
      0: ['بَـ', 'د', 'ر']
    },
    11: {
      1: ['ص', 'ـبِـ', 'ر']
    },
    12: {
      2: ['ر', 'ي', 'ـنٌ']
    },
    13: {
      0: ['ذِ', 'ج', 'ش']
    },
    14: {
      0: ['بُـ', 'ا', 'ع']
    },
    15: {
      1: ['ص', 'ـبَـ', 'ر']
    },
    16: {
      0: ['فَـ', 'ب', 'ن']
    },
    17: {
      2: ['ن', 'ا', 'تٌ']
    },
  };
  SharedPreferences prefs;
  List<int> rightCardsIndexes = [0, 3, 4, 6, 10, 11, 14, 15];

  @override
  void initState() {
    super.initState();
    gettingLetter();
  }

  gettingLetter() async {
    SharedPreferences.getInstance().then((onValue) {
      prefs = onValue;
      setState(() {
        subQuestion = prefs.getString('currentLetter');
      });
    });
    print("subQuestion === ");
    print(subQuestion);
  }

  Widget childWidget() {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // ExQuestionBar(
        //   subQuestion: subQuestion,
        //   question: 'أضغط عندما أرى حرف   ',
        //   kidPic: 'kids8.png',
        //   logos: false,
        // ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: new GridView.count(
            shrinkWrap: true,
            childAspectRatio: 1.07,
            physics: ClampingScrollPhysics(),
            crossAxisCount: 6,
            children: answers.keys.map((index) {
              var key = answers[index].keys.toList()[0];
              var value = answers[index].values.toList()[0];
              return scoreMap[index.toString()] != true
                  ? InkWell(
                      onTap: () {
                        if (rightCardsIndexes.contains(index) == true) {
                          setState(() {
                            scoreMap[index.toString()] = true;
                            print('true' + index.toString());
                          });

                          if (scoreMap.length == rightCardsIndexes.length) {
                            Future.delayed(Duration(seconds: 8), () {
                              setState(() {
                                scoreMap = {};
                              });
                            });
                            showDialog(
                                context: context,
                                builder: (context) {
                                  Future.delayed(Duration(seconds: 5), () {
                                    Navigator.of(context).pop(true);
                                  });
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                        dialogBackgroundColor:
                                            Colors.transparent),
                                    child: ResultSucessQuestion(),
                                  );
                                });
                          } else {
                            Flame.audio.play('treasure.mp3');
                            Future.delayed(Duration(seconds: 1), () {
                              Flame.audio.play('good.mp3');
                            });
                          }
                        } else {
                          Flame.audio.play('error.mp3');
                        }
                      },
                      child: Stack(
                        children: <Widget>[
                          Center(
                            child: new Image.asset(
                              'assets/emptyCard.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          Center(
                            child: LetterOrText(
                              pos: key,
                              textList: value,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Center(
                      child: new Image.asset(
                        'assets/correctAnswer.png',
                        fit: BoxFit.contain,
                      ),
                    );
            }).toList(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/classroom3.png"),
          fit: BoxFit.fill,
          colorFilter: new ColorFilter.mode(
              Colors.yellow.withOpacity(0.65), BlendMode.luminosity),
        ),
      ),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
        appBar: exAppBar(
          screenSize,
          _scaffoldKey,
          ExQuestionBar(
            subQuestion: subQuestion,
            question: 'أضغط عندما أرى حرف   ',
            kidPic: 'kids8.png',
            logos: false,
          ),
        ),
        drawer: AppDrawer(),
        body: childWidget(),
      ),
    );
  }
}
