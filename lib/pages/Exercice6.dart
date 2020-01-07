import 'package:flame/flame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanabelsecondexercice/components/ExQuestionBar.dart';
import 'package:sanabelsecondexercice/components/widgets/ResultSuccessQuestion.dart';
import 'package:sanabelsecondexercice/components/widgets/Signature.dart';
import 'package:sanabelsecondexercice/components/widgets/letterOrText.dart';
import 'package:sanabelsecondexercice/theme/style.dart';

class ExerciceSix extends StatefulWidget {
  final String subQuestion ;

  const ExerciceSix({this.subQuestion}) ;

  @override
  _ExerciceSixState createState() => _ExerciceSixState();
}

class _ExerciceSixState extends State<ExerciceSix> {

  List<Offset> _points = <Offset>[];
  List<Offset> _truePoints = <Offset>[];

  static final GlobalKey _cardKey0 = GlobalKey();
  static final GlobalKey _cardKey1 = GlobalKey();
  static final GlobalKey _cardKey2 = GlobalKey();
  static final GlobalKey _cardKey3 = GlobalKey();
  static final GlobalKey _cardKey4 = GlobalKey();
  static final GlobalKey _cardKey5 = GlobalKey();
  static final GlobalKey _cardKey6 = GlobalKey();
  static final GlobalKey _cardKey7 = GlobalKey();
  static final GlobalKey _cardKey8 = GlobalKey();
  static final GlobalKey _cardKey9 = GlobalKey();
  static final GlobalKey _cardKey10 = GlobalKey();
  static final GlobalKey _cardKey11 = GlobalKey();
  static final GlobalKey _cardKey12 = GlobalKey();
  static final GlobalKey _cardKey13 = GlobalKey();

  List<GlobalKey> _cardKey = <GlobalKey>[
    _cardKey0,
    _cardKey1,
    _cardKey2,
    _cardKey3,
    _cardKey4,
    _cardKey5,
    _cardKey6,
    _cardKey7,
    _cardKey8,
    _cardKey9,
    _cardKey10,
    _cardKey11,
    _cardKey12,
    _cardKey13,
  ];

  Size cardSize;
  Offset cardPosition;

  Map<int, Map<int, List<String>>> answers = {
    0: {
      0: ['بَـ', 'ا', 'ع']
    },
    1: {
      0: ['ذُ', 'ج', 'ش']
    },
    2: {
      0: ['نــِ', 'ا', 'ب']
    },
    3: {
      1: ['ب', 'ـبِـ', 'ب']
    },
    4: {
      0: ['جُـ', 'ت', 'ب']
    },
    5: {
      2: ['ر', 'ي', 'ـبٌ']
    },
    6: {
      2: ['ا', 'ا', 'تٍ']
    },
    7: {
      2: ['ت', 'ا', 'بُ']
    },
    8: {
      1: ['س', 'ـتَـ', 'ر']
    },
    9: {
      1: ['ص', 'ـبَـ', 'ر']
    },
    10: {
      0: ['بُـ', 'د', 'ر']
    },
    11: {
      1: ['ب', 'ـنُـ', 'ت']
    },
    12: {
      0: ['تِـ', 'ب', 'ن']
    },
    13: {
      2: ['ن', 'ا', 'بٍ']
    },
  }; 

  var subQuestion;

  Map<int, Offset> indexOffsetsMap = {
    // 0: Offset(768.0, 97.2),
    // 1: Offset(576.0, 97.2),
    // 2: Offset(384.0, 97.2),
    // 3: Offset(192.0, 97.2),
    // 4: Offset(0.0, 97.2),
    // 5: Offset(768.0, 289.2),
    // 6: Offset(576.0, 289.2),
    // 7: Offset(384.0, 289.2),
    // 8: Offset(192.0, 289.2),
    // 9: Offset(0.0, 289.2)
  };
  List<int> rightCardsIndexes = [0, 3, 5, 7, 9, 10, 13];
  List<Offset> rightCards = [
    // Offset(768.0, 97.2),
    // Offset(0.0, 97.2),
    // Offset(384.0, 289.2)
  ];
  Map<Offset, bool> scoreMap = {};

  Offset currentRightCardPosition; 


  @override
  void initState() {
    super.initState();
      subQuestion = widget.subQuestion;

    WidgetsBinding.instance.addPostFrameCallback((_) => getSizeAndPosition());
    setState(() {
      print('init');
    });
  }

  bool pointsInrightCard(List<Offset> pointsList, List<Offset> rightCards) {
    bool insideOneAndOnlyCorrectAnswer = true;
    // print('pointsList');
    // print(pointsList);

    for (var i = 0; i < pointsList.length; i++) {
      if (pointsList[i] != null) {
        if (pointInRightCard(pointsList[i], rightCards) != 1) {
          insideOneAndOnlyCorrectAnswer = false;
          break;
        }
      }
    }

    return insideOneAndOnlyCorrectAnswer;
  }

  int pointInRightCard(Offset point, List<Offset> rightCards) {
    int nb = 0;
    Offset x;
    // print(point);

    for (var i = 0; i < rightCards.length; i++) {
      if (pointInOffset(point, rightCards[i]) == true) {
        nb++;
        x = rightCards[i];
      }
    }
    if (nb == 1) {
      setState(() {
        currentRightCardPosition = x;
        // print(
        //     'currentRightCardPosition=' + currentRightCardPosition.toString());
      });
    }
    return nb;
  }

  bool pointInOffset(Offset point, Offset cardOffset) {
    Size screenSize = MediaQuery.of(context).size;
    print(cardSize);
    // print(point);
    if ((point.dx >= cardOffset.dx) &&
        (point.dx <= cardOffset.dx + cardSize.width) &&
        (point.dy >= cardOffset.dy) &&
        (point.dy <= cardOffset.dy + cardSize.height)) {
      // print('true in pointInOffset');
      return true;
    } else {
      // print('false in pointInOffset');
      return false;
    }
  }


  getSizeAndPosition() {
    for (var index = 0; index < _cardKey.length; index++) {
      RenderBox _cardBox = _cardKey[index].currentContext.findRenderObject();
      setState(() {
        cardSize = _cardBox.size;
      });
      cardPosition = _cardBox.localToGlobal(Offset.zero);
      // print('cardSize [$index]' + cardSize.toString());
      // print('$index]' + cardPosition.toString());

      // print(cardPosition);
      indexOffsetsMap[index] = cardPosition;

      if (rightCardsIndexes.contains(index) == true) {
        rightCards..add(indexOffsetsMap[index]);
      }

      setState(() {});
    }

    // print(indexOffsetsMap);
    // print(rightCards);
  }

  Widget childWidget() {
    Size screenSize = MediaQuery.of(context).size;

    return GestureDetector(
        onPanUpdate: (DragUpdateDetails details) {
          setState(() {
            RenderBox object = context.findRenderObject();
            Offset _localPosition =
                object.globalToLocal(details.globalPosition);
            _points = new List.from(_points)..add(_localPosition);
            // print('_localPosition: ' + _localPosition.toString());
            // print('_points: ' + _points.toString());
          });
        },
        onPanEnd: (DragEndDetails details) {
          _points.add(null);
          if (pointsInrightCard(_points, rightCards) == true) {
            print('scoreMap length');
            print(scoreMap.length);
            print('scoreMap ');
            print(scoreMap);

            print('ended with true ');
            if (scoreMap[currentRightCardPosition] == null) {
              print('it is new');
              setState(() {
                _truePoints += _points;
                _points = [];
                scoreMap[currentRightCardPosition] = true;
              });
              if (scoreMap.length == rightCardsIndexes.length) {
                // print(_points);
                // audioCache.play('goodComplete.mp3', volume: 3);
                // Flame.bgm.play('goodComplete.mp3');

                showDialog(
                    context: context,
                    builder: (context) {
                      Future.delayed(Duration(seconds: 5), () {
                        Navigator.of(context).pop(true);
                      });
                      return Theme(
                        data: Theme.of(context).copyWith(
                            dialogBackgroundColor: Colors.transparent),
                        child: ResultSucessQuestion(),
                      );
                    });

                setState(() {
                  _points = [];
                  _truePoints = [];

                  scoreMap = {};
                });
              } else {
                // audioCache.play('good.mp3', volume: 3);
                // Flame.bgm.play('good.mp3');
                Flame.audio.play('good.mp3');
              }
            } else {
              print('its not new :p ');
            }

            print('scoreMap length');
            print(scoreMap.length);
            print('scoreMap ');
            print(scoreMap);
          } else {
            print('ended with false');
            setState(() {
              _points = [];
            });
            Flame.audio.play('error.mp3');
          }
        },
        child: new CustomPaint(
            painter: new Signature(points: _points,trues: _truePoints),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ExQuestionBar(
                  subQuestion: subQuestion, 
                  question: 'أَرَسْمِ دائرة حول الحرف    ',
                  kidPic: 'kids7.png',
                  logos: false,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: new GridView.count(
                    shrinkWrap: true,
                    childAspectRatio: 1.4,
                    physics: ClampingScrollPhysics(),
                    crossAxisCount: 5,
                    children: answers.keys.map((index) {
                      var key = answers[index].keys.toList()[0];
                      var value = answers[index].values.toList()[0];
    
                      return Center(
                        key: _cardKey[index],
                        // padding: const EdgeInsets.all(50.0),
                        child: LetterOrText(
                          pos: key,
                          textList: value,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundMainColor,
      // appBar: ExQuestionBar(),
      body: childWidget(),
      // bottomNavigationBar: Container(
      //   height: screenSize.height * 0.05,
      //   child: new FloatingActionButton(
      //       child: new Icon(Icons.clear),
      //       onPressed: () => {

      //             setState(() {
      //               _points = [];
      //               scoreMap = {};
      //             }),
      //           }),
      // ),
    );
  }
}
