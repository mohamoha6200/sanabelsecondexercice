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

  Map<int, Map<int, List<String>>> answers = {};
  Map<int, Map<int, List<String>>> initialAnswers = {};

  SharedPreferences prefs;
  List<int> rightCardsIndexes = [];

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
      initilizeCardsMap();
    });
    print("subQuestion === ");
    print(subQuestion);
  }

  initilizeCardsMap() {
    switch (subQuestion) {
      case 'ب':
        {
          setState(() {
            answers = {
              0: {
                0: ['بِــ', 'ا', 'ع']
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
                1: ['ب', 'ــبُـ', 'ب']
              },
              7: {
                1: ['ب', 'ــنِـ', 'ت']
              },
              8: {
                2: ['ا', 'ا', 'زُ']
              },
              9: {
                0: ['خَـ', 'ت', 'ب']
              },
              10: {
                0: ['بَــ', 'د', 'ر']
              },
              11: {
                1: ['ص', 'ــبِـ', 'ر']
              },
              12: {
                2: ['ر', 'ي', 'ـنٌ']
              },
              13: {
                0: ['ذِ', 'ج', 'ش']
              },
              14: {
                0: ['بُــ', 'ا', 'ع']
              },
              15: {
                1: ['ص', 'ــبَـ', 'ر']
              },
              16: {
                0: ['فَــ', 'ب', 'ن']
              },
              17: {
                2: ['ن', 'ا', 'تٌ']
              },
            };
            rightCardsIndexes = [0, 3, 4, 6, 10, 11, 14, 15];
            initialAnswers = shuffleMap(answers);
          });
        }
        break;
      case 'ت':
        {
          setState(() {
            answers = {
              0: {
                1: ['بِـ', 'ــتِـ', 'ع']
              },
              1: {
                0: ['قَــ', 'ج', 'ش']
              },
              2: {
                0: ['ثُــ', 'ا', 'ب']
              },
              3: {
                0: ['تَــ', 'ا', 'بٌ']
              },
              4: {
                1: ['بِـ', 'ــيُـ', 'ع']
              },
              5: {
                1: ['بِــ', 'ـتَـ', 'ع']
              },
              6: {
                2: ['ن', 'ا', 'ثٌ']
              },
              7: {
                2: ['ر', 'ي', 'ـتٍ']
              },
              8: {
                1: ['ب', 'ــقُـ', 'ت']
              },
              9: {
                0: ['ذِ', 'ج', 'ش']
              },
              10: {
                1: ['ب', 'ــثِـ', 'ت']
              },
              11: {
                0: ['بَــ', 'ج', 'ش']
              },
              12: {
                0: ['تِــ', 'ت', 'ب']
              },
              13: {
                2: ['بُــ', 'ا', 'هٌ']
              },
              14: {
                2: ['ر', 'ي', 'ــةٌ']
              },
              15: {
                1: ['ب', 'ــنُـ', 'ت']
              },
              16: {
                2: ['بُــ', 'ا', 'ةٌ']
              },
              17: {
                0: ['يُــ', 'ت', 'ب']
              },
            };
            rightCardsIndexes = [0, 3, 5, 7, 12, 14, 16];
            initialAnswers = shuffleMap(answers);
          });
        }
        break;
      case 'ث':
        {
          setState(() {
            answers = {
              0: {
                1: ['بِـ', 'ــتُـ', 'ع']
              },
              1: {
                1: ['بِـ', 'ــثَـ', 'ع']
              },
              2: {
                2: ['ر', 'ي', 'ـثٌ']
              },
              3: {
                2: ['ر', 'ي', 'ـشٌ']
              },
              4: {
                2: ['ن', 'ا', 'تٌ']
              },
              5: {
                1: ['بِـ', 'ــثِـ', 'ع']
              },
              6: {
                0: ['قَــ', 'ت', 'ب']
              },
              7: {
                0: ['ثُــ', 'ت', 'ب']
              },
              8: {
                2: ['ن', 'ا', 'ثٌ']
              },
              9: {
                0: ['بِــ', 'ــبِـ', 'ع']
              },
              10: {
                1: ['بِـ', 'ــفُـ', 'ع']
              },
              11: {
                2: ['ر', 'ي', 'ـتٍ']
              },
              12: {
                2: ['ر', 'ي', 'ـثٍ']
              },
              13: {
                1: ['بِـ', 'ـشِـ', 'ع']
              },
              14: {
                1: ['بِـ', 'ــثَـ', 'ع']
              },
              15: {
                2: ['ن', 'ا', 'بٌ']
              },
              16: {
                1: ['بِـ', 'ــنِـ', 'ع']
              },
              17: {
                2: ['ر', 'ي', 'ـقٌ']
              },
            };
            rightCardsIndexes = [1, 2, 5, 7, 8, 12, 14];
            initialAnswers = shuffleMap(answers);
          });
        }
        break;
      case 'ج':
        {
          setState(() {
            answers = {
              0: {
                0: ['خُــ', 'ت', 'ب']
              },
              1: {
                1: ['بِـ', 'ـجِـ', 'ع']
              },
              2: {
                0: ['بَــ', 'ت', 'ب']
              },
              3: {
                0: ['جُــ', 'ت', 'ب']
              },
              4: {
                2: ['ر', 'ي', 'ـجٌ']
              },
              5: {
                0: ['حِــ', 'ت', 'ب']
              },
              6: {
                1: ['بِـ', 'ـخَـ', 'ع']
              },
              7: {
                2: ['ر', 'ر', 'خٌ']
              },
              8: {
                1: ['بِـ', 'ـحَـ', 'ع']
              },
              9: {
                2: ['ن', 'ا', 'جٌ']
              },
              10: {
                0: ['جِــ', 'ت', 'ب']
              },
              11: {
                1: ['بِـ', 'ـبِـ', 'ع']
              },
              12: {
                0: ['حَــ', 'ت', 'ب']
              },
              13: {
                1: ['بِـ', 'ـجَـ', 'ع']
              },
              14: {
                1: ['بِـ', 'ـحُـ', 'ع']
              },
              15: {
                1: ['بِـ', 'ــبُـ', 'ع']
              },
              16: {
                2: ['ن', 'ا', 'خٌ']
              },
              17: {
                2: ['ن', 'ا', 'حٌ']
              },
            };
            rightCardsIndexes = [1, 3, 4, 9, 10, 13];
            initialAnswers = shuffleMap(answers);
          });
        }
        break;
      case 'ح':
        {
          setState(() {});
        }
        break;
      case 'خ':
        {
          setState(() {});
        }
        break;
      case 'د':
        {
          setState(() {});
        }
        break;
      case 'ذ':
        {
          setState(() {});
        }
        break;
      case 'ر':
        {
          setState(() {});
        }
        break;
      case 'ز':
        {
          setState(() {});
        }
        break;
      case 'س':
        {
          setState(() {});
        }
        break;
      case 'ش':
        {
          setState(() {});
        }
        break;
      case 'ص':
        {
          setState(() {});
        }
        break;
      case 'ض':
        {
          setState(() {});
        }
        break;
      case 'ط':
        {
          setState(() {});
        }
        break;
      case 'ظ':
        {
          setState(() {});
        }
        break;
      case 'ع':
        {
          setState(() {});
        }
        break;
      case 'غ':
        {
          setState(() {});
        }
        break;
      case 'ف':
        {
          setState(() {});
        }
        break;
      case 'ق':
        {
          setState(() {});
        }
        break;
      case 'ك':
        {
          setState(() {});
        }
        break;
      case 'ل':
        {
          setState(() {});
        }
        break;
      case 'م':
        {
          setState(() {});
        }
        break;
      case 'ن':
        {
          setState(() {});
        }
        break;
      case 'ه':
        {
          setState(() {});
        }
        break;
      case 'و':
        {
          setState(() {});
        }
        break;
      case 'ي':
        {
          setState(() {});
        }
        break;

      default:
        {
          setState(() {});
        }
    }
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
            children: initialAnswers.keys.map((index) {
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

Map<int, Map<int, List<String>>> shuffleMap(
    Map<int, Map<int, List<String>>> map) {
  Map<int, Map<int, List<String>>> result = {};
  var keys = map.keys.toList()..shuffle();
  var values = map.values.toList()..shuffle();
  for (var i = 0; i < keys.length; i++) {
    result[keys[i]] = values[i];
  }
  return result;
}
