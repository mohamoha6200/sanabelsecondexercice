import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanabelsecondexercice/components/ExQuestionBar.dart';
import 'package:sanabelsecondexercice/components/widgets/ResultSuccessQuestion.dart';
import 'package:sanabelsecondexercice/components/widgets/Signature.dart';
import 'package:sanabelsecondexercice/theme/style.dart';


class ExerciceTwo extends StatefulWidget {
  @override
  _ExerciceTwoState createState() => _ExerciceTwoState();
}

class _ExerciceTwoState extends State<ExerciceTwo> {
  final String subQuestion = 'ب';

  AudioCache audioCache = AudioCache();

  List<Offset> _points = <Offset>[];
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
  ];

  Size cardSize;
  Offset cardPosition;

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
  List<int> rightCardsIndexes = [0, 4, 7];
  List<Offset> rightCards = [
    // Offset(768.0, 97.2),
    // Offset(0.0, 97.2),
    // Offset(384.0, 289.2)
  ];
  Map<Offset, bool> scoreMap = {};

  Offset currentRightCardPosition;


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
        print(
            'currentRightCardPosition=' + currentRightCardPosition.toString());
      });
    }
    return nb;
  }

  bool pointInOffset(Offset point, Offset cardOffset) {
    Size screenSize = MediaQuery.of(context).size;
    print(screenSize.width/5);


    // print(point);
    if ((point.dx >= cardOffset.dx) &&
        (point.dx <= cardOffset.dx + screenSize.width / 5) &&
        (point.dy >= cardOffset.dy) &&
        (point.dy <= cardOffset.dy + screenSize.width / 5)) {
      // print('true in pointInOffset');
      return true;
    } else {
      // print('false in pointInOffset');
      return false;
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => getSizeAndPosition());
    setState(() {
      print('init');
    });
  }

  getSizeAndPosition() {
    for (var index = 0; index < 10; index++) {
      RenderBox _cardBox = _cardKey[index].currentContext.findRenderObject();
      cardSize = _cardBox.size;
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

    print(indexOffsetsMap);
    print(rightCards);
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
                scoreMap[currentRightCardPosition] = true;
              });
              if (scoreMap.length == rightCardsIndexes.length) {
                // print(_points);
                audioCache.play('goodComplete.wav', volume: 3);

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
                  scoreMap = {};
                });
              } else {
                audioCache.play('good.wav', volume: 3);
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
              scoreMap = {};
            });
            audioCache.play('error.mp3', volume: 3);
          }
        },
        child: new CustomPaint(
            painter: new Signature(points: _points),
            child: Column(
              children: <Widget>[
                ExQuestionBar(subQuestion: subQuestion),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: new GridView.count(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    crossAxisCount: 5,
                    children: List.generate(
                      10,
                      (index) {
                        return GestureDetector(
                            onTap: () {
                              print('tapped');
                              print(index);
                              // getSizeAndPosition(_cardKey[index]);
                            },
                            child: Padding(
                                key: _cardKey[index],
                                padding: const EdgeInsets.all(50.0),
                                child: rightCardsIndexes.contains(index)
                                    ? Container(
                                        // key: _cardKey[index],
                                        child: 
                                         Text(
                                           subQuestion,
                                           style: TextStyle(
                                               fontSize: 32, color: Colors.red),
                                         ),
                                        // Circle(),
                                      )
                                    : Container(
                                        child: new Image.asset(
                                          'assets/aliff.png',
                                          fit: BoxFit.fill,
                                        ),
                                      )));
                      },
                    ),
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
        bottomNavigationBar: Container(
          height: screenSize.height * 0.05,
          child: new FloatingActionButton(
              child: new Icon(Icons.clear),
              onPressed: () => {
                    setState(() {
                      _points = [];
                      scoreMap = {};
                    }),
                  }),
        ));
  }
}
