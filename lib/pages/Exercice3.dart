import 'package:flame/flame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanabelsecondexercice/components/ExQuestionBar.dart';
import 'package:sanabelsecondexercice/components/widgets/ResultSuccessQuestion.dart';
import 'package:sanabelsecondexercice/components/widgets/Signature.dart';
import 'package:sanabelsecondexercice/pages/fakePage.dart';
import 'package:sanabelsecondexercice/theme/style.dart';

class ExerciceThree extends StatefulWidget {
  @override
  _ExerciceThreeState createState() => _ExerciceThreeState();
}

class _ExerciceThreeState extends State<ExerciceThree> {

  List<Offset> _points = <Offset>[];
  List<Offset> _truePoints = <Offset>[];

  static final GlobalKey _picCardKey0 = GlobalKey();

  static final GlobalKey _picCardKey1 = GlobalKey();
  static final GlobalKey _picCardKey2 = GlobalKey();

  static final GlobalKey _wordCardKey0 = GlobalKey();

  static final GlobalKey _wordCardKey1 = GlobalKey();
  static final GlobalKey _wordCardKey2 = GlobalKey();

  List<GlobalKey> _picCardKey = <GlobalKey>[
    _picCardKey0,
    _picCardKey1,
    _picCardKey2,
  ];

  List<GlobalKey> _wordCardKey = <GlobalKey>[
    _wordCardKey0,
    _wordCardKey1,
    _wordCardKey2,
  ];

  Map<String, String> picChoiceMap = {
    'assets/bird.png': 'assets/birdword.png',
    'assets/door.png': 'assets/doorword.png',
    'assets/berkar.png': 'assets/berkarword.png'
  };

  Size cardSize;
  // Offset picCardPosition;

  Map<String, Offset> picOffsetmap = {};
  Map<String, Offset> wordOffsetmap = {};

  List<int> rightCardsIndexes = [0, 4, 7];
  List<Offset> rightCards = [];
  Map<String, bool> scoreMap = {};

  Offset currentRightCardPosition;

  Offset lastPointOffset;

  Offset firstPointOffset;

  Offset aux;

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

  String inWhichCardIsThisPoint(
      Offset point, Map<String, Offset> stringOffsetmap) {
    String card = '';
    var strings = stringOffsetmap.keys.toList();
    for (var index = 0; index < strings.length; index++) {
      print(strings[index]);
      print((pointInOffset(point, stringOffsetmap[strings[index]]) == true));
      if (pointInOffset(point, stringOffsetmap[strings[index]]) == true) {
        card = strings[index];
      }
    }

    return card;
  }

  bool pointInOffset(Offset point, Offset cardOffset) {
    // print('cardwidth' + cardSize.width.toString());

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

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      getPicsCardsSizesAndPositions();
      getWordsCardsSizesAndPositions();
    });
    setState(() {
      print('init');
    });
  }

  getPicsCardsSizesAndPositions() {
    var pickeys = picChoiceMap.keys.toList();
    for (var index = 0; index < 3; index++) {
      RenderBox _cardBox = _picCardKey[index].currentContext.findRenderObject();
      Size picCardSize = _cardBox.size;
      Offset picCardPosition = _cardBox.localToGlobal(Offset.zero);
      print('cardSize [$index]' + picCardSize.toString());
      print('$index]' + picCardPosition.toString());

      // print(cardPosition);

      picOffsetmap[pickeys[index]] = picCardPosition;

      setState(() {
        cardSize = picCardSize;
      });
    }

    print(picOffsetmap);
    // print(rightCards);
  }

  getWordsCardsSizesAndPositions() {
    var wordkeys = picChoiceMap.values.toList();

    for (var index = 0; index < 3; index++) {
      RenderBox _cardBox =
          _wordCardKey[index].currentContext.findRenderObject();
      Size wordCardSize = _cardBox.size;
      Offset wordCardPosition = _cardBox.localToGlobal(Offset.zero);
      print('wordCardSize [$index]' + wordCardSize.toString());
      print('$index]' + wordCardPosition.toString());

      // print(cardPosition);

      wordOffsetmap[wordkeys[index]] = wordCardPosition;

      setState(() {});
    }

    print(wordOffsetmap);
    // print(rightCards);
  }

  Widget childWidget() {
    Size screenSize = MediaQuery.of(context).size;

    return Center(
      child: GestureDetector(
          onPanUpdate: (DragUpdateDetails details) {
            setState(() {
              //  firstPointOffset = null;
              //  lastPointOffset = null;

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
            // print(_points);

            firstPointOffset = _points[0];
            lastPointOffset = _points[_points.length - 2];

            // print('firstPointOffset');

            // print(firstPointOffset);
            // print('lastPointOffset');

            // print(lastPointOffset);

            if (((inWhichCardIsThisPoint(firstPointOffset, picOffsetmap) !=
                        '') &&
                    (inWhichCardIsThisPoint(lastPointOffset, wordOffsetmap) !=
                        '')) ||
                ((inWhichCardIsThisPoint(firstPointOffset, wordOffsetmap) !=
                        '') &&
                    (inWhichCardIsThisPoint(lastPointOffset, picOffsetmap) !=
                        ''))) {
              if (((picChoiceMap[inWhichCardIsThisPoint(
                          firstPointOffset, picOffsetmap)] ==
                      inWhichCardIsThisPoint(
                          lastPointOffset, wordOffsetmap))) ||
                  ((picChoiceMap[inWhichCardIsThisPoint(
                          lastPointOffset, picOffsetmap)] ==
                      inWhichCardIsThisPoint(
                          firstPointOffset, wordOffsetmap)))) {
                if (picChoiceMap[inWhichCardIsThisPoint(
                        firstPointOffset, picOffsetmap)] ==
                    inWhichCardIsThisPoint(lastPointOffset, wordOffsetmap)) {
                  if (scoreMap[picChoiceMap[inWhichCardIsThisPoint(
                          firstPointOffset, picOffsetmap)]] ==
                      null) {
                    setState(() {
                      _truePoints += _points;
                      _points = [];
                      scoreMap[picChoiceMap[inWhichCardIsThisPoint(
                          firstPointOffset, picOffsetmap)]] = true;
                    });
                    if (scoreMap.length == picChoiceMap.length) {
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
                      print('shouldnt good');
                      Flame.audio.play('good.mp3');
                    }
                  } else
                    setState(() {
                      _points = [];
                    });
                } else if (picChoiceMap[inWhichCardIsThisPoint(
                        lastPointOffset, picOffsetmap)] ==
                    inWhichCardIsThisPoint(firstPointOffset, wordOffsetmap)) {
                  if (scoreMap[picChoiceMap[inWhichCardIsThisPoint(
                          lastPointOffset, picOffsetmap)]] ==
                      null) {
                    setState(() {
                      _truePoints += _points;
                      _points = [];

                      scoreMap[picChoiceMap[inWhichCardIsThisPoint(
                          lastPointOffset, picOffsetmap)]] = true;
                    });
                    if (scoreMap.length == picChoiceMap.length) {
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
                      print('shouldnt good');

                      Flame.audio.play('good.mp3');
                    }
                  } else {
                    setState(() {
                      _points = [];
                    });
                  }
                }
              } else {
                Flame.audio.play('error.mp3');
                print(('meloul'));
                setState(() {
                  _points = [];
                  _truePoints = [];
                  scoreMap = {};
                });
              }
            } else {
              Flame.audio.play('error.mp3');
              print(('meloul'));
              setState(() {
                _points = [];
                _truePoints = [];
                scoreMap = {};
              });
            }

            //     if (((picChoiceMap[inWhichCardIsThisPoint(
            //                 firstPointOffset, picOffsetmap)] ==
            //             inWhichCardIsThisPoint(
            //                 lastPointOffset, wordOffsetmap))) ||
            //         ((picChoiceMap[inWhichCardIsThisPoint(
            //                 lastPointOffset, picOffsetmap)] ==
            //             inWhichCardIsThisPoint(
            //                 firstPointOffset, wordOffsetmap)))) {
            //       Flame.audio.play('good.mp3');
            //       // scoreMap[''] = true;
            //       setState(() {
            //         firstPointOffset = null;
            //         lastPointOffset = null;
            //       });
            //     }
            //                                  else {
            //        setState(() {
            //          _points = [];
            //         // scoreMap = {};
            //        });
            //        Flame.audio.play('error.mp3');
            //        print('else 1');
            //      }
            //   } else {
            //     setState(() {
            //       _points = [];
            //       // scoreMap = {};
            //     });
            //     Flame.audio.play('error.mp3');
            //        print('else 2');
            //   }
            // } else {
            //   setState(() {
            //     _points = [];
            //     // scoreMap = {};
            //   });

            //   Flame.audio.play('error.mp3');
            //                      print('else 3');

            // }

            // if (pointsInrightCard(_points, rightCards) == true) {
            //   print('scoreMap length');
            //   print(scoreMap.length);
            //   print('scoreMap ');
            //   print(scoreMap);

            //   print('ended with true ');
            //   if (scoreMap[currentRightCardPosition] == null) {
            //     print('it is new');
            //     setState(() {
            //       scoreMap[currentRightCardPosition] = true;
            //     });
            //     if (scoreMap.length == rightCardsIndexes.length) {
            //       // print(_points);
            //       // audioCache.play('goodComplete.mp3', volume: 3);
            //       // Flame.bgm.play('goodComplete.mp3');
            //       Flame.audio.play('goodComplete.mp3');

            //       showDialog(
            //           context: context,
            //           builder: (context) {
            //             Future.delayed(Duration(seconds: 5), () {
            //               Navigator.of(context).pop(true);
            //             });
            //             return Theme(
            //               data: Theme.of(context).copyWith(
            //                   dialogBackgroundColor: Colors.transparent),
            //               child: ResultSucessQuestion(),
            //             );
            //           });

            //       setState(() {
            //         _points = [];
            //         scoreMap = {};
            //       });
            //     } else {
            //       // audioCache.play('good.mp3', volume: 3);
            //       // Flame.bgm.play('good.mp3');
            //       Flame.audio.play('good.mp3');
            //     }
            //   } else {
            //     print('its not new :p ');
            //   }

            //   print('scoreMap length');
            //   print(scoreMap.length);
            //   print('scoreMap ');
            //   print(scoreMap);
            // } else {
            //   print('ended with false');
            //   setState(() {
            //     _points = [];
            //     scoreMap = {};
            //   });
            //   // audioCache.play('error.mp3', volume: 3);
            //   Flame.audio.play('error.mp3');
            // }
          },
          child: new CustomPaint(
            painter: new Signature(points: _points, trues: _truePoints),
            child: Center(
              child: Column(
                children: <Widget>[
                  ExQuestionBar(
                    question: ' أربط الكلمة بالصورة المناسبة',
                    kidPic: 'kids4.png',
                  ),
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(3, (index) {
                          var keys = picChoiceMap.keys.toList();
                          return GestureDetector(
                            onTap: () {
                              print('tapped pic');
                              print(index);
                              // getSizeAndPosition(_picCardKey[index]);
                            },
                            child: Container(
                              key: _picCardKey[index],
                              width: 200,
                              height: 200,
                              child: new Image.asset(
                                keys[index],
                                // 'assets/aliff.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(3, (index) {
                          var choices = picChoiceMap.values.toList();
                          return GestureDetector(
                            onTap: () {
                              print('tapped pic');
                              print(index);
                              // getSizeAndPosition(_picCardKey[index]);
                            },
                            child: Container(
                              key: _wordCardKey[index],
                              width: 200,
                              height: 200,
                              child: new Image.asset(
                                choices[index],
                                // 'assets/aliff.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }

// Directionality(
//                   textDirection: TextDirection.rtl,
//                   child: new GridView.count(
//                     shrinkWrap: true,
//                     physics: ClampingScrollPhysics(),
//                     crossAxisCount: 5,
//                     children: List.generate(
//                       10,
//                       (index) {
//                         return GestureDetector(
//                             onTap: () {
//                               print('tapped');
//                               print(index);
//                               // getSizeAndPosition(_picCardKey[index]);
//                             },
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 border: Border.all(),
//                               ),
//                               child: Padding(
//                                   key: _picCardKey[index],
//                                   padding: const EdgeInsets.all(50.0),
//                                   child: rightCardsIndexes.contains(index)
//                                       ? Center(
//                                           // key: _picCardKey[index],
//                                           child: Text(
//                                             subQuestion,
//                                             style: TextStyle(
//                                                 fontSize: 32,
//                                                 color: Colors.red),
//                                           ),
//                                           // Circle(),
//                                         )
//                                       : Container(
//                                           child: new Image.asset(
//                                             'assets/aliff.png',
//                                             fit: BoxFit.fill,
//                                           ),
//                                         )),
//                             ));
//                       },
//                     ),
//                   ),
//                 ),

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
                    _truePoints = [];
                    _points = [];
                    scoreMap = {};
                  }),
                }),
      ),
    );
  }
}
