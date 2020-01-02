import 'package:collection/collection.dart';
import 'package:flame/flame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sanabelsecondexercice/components/ExQuestionBar.dart';
import 'package:sanabelsecondexercice/components/models/redLetterWord.dart';
import 'package:sanabelsecondexercice/components/widgets/ResultSuccessQuestion.dart';
import 'package:sanabelsecondexercice/components/widgets/Signature.dart';
import 'package:sanabelsecondexercice/components/widgets/secondDrawer.dart';
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

  Map<String, Map<int, List<String>>> picChoiceMap = {
    'assets/bird.png': {
      0: ['بُ', 'لْ', 'بُ', 'لٌ']
    },
    'assets/door.png': {
      0: ['بَ', 'ا', 'بٌ']
    },
    'assets/berkar.png': {
      0: ['بِ', 'رْ', 'كَ', 'ا', 'رٌ']
    }
  };

  Map<String, Map<int, List<String>>> initialpicChoiceMap = {
    'assets/berkar.png': {
      0: ['بُ', 'لْ', 'بُ', 'لٌ']
    },
    'assets/bird.png': {
      0: ['بَ', 'ا', 'بٌ']
    },
    'assets/door.png': {
      0: ['بِ', 'رْ', 'كَ', 'ا', 'رٌ']
    }
  };

  Size cardSize;
  // Offset picCardPosition;

  Map<String, Offset> picOffsetmap = {};
  Map<Map<int, List<String>>, Offset> wordOffsetmap = {};

  Map<String, bool> scoreMap = {};

  Offset currentRightCardPosition;

  Offset lastPointOffset;

  Offset firstPointOffset;

  var startingPic = null;
  var startingWord = null;
  var endingPic = null;
  var endingWord = null;
  bool startedWithPic = false;
  bool startedWithWord = false;
  bool endedWithPic = false;
  bool endedWithWord = false;

  String inWhichPicIsThisPoint(Offset point, Map<String, Offset> picOffsetmap) {
    String card = '';
    var strings = picOffsetmap.keys.toList();
    for (var index = 0; index < strings.length; index++) {
      if (pointInOffset(point, picOffsetmap[strings[index]]) == true) {
        card = strings[index];
        print(strings[index]);
        print((pointInOffset(point, picOffsetmap[strings[index]]) == true));
      }
    }

    return card;
  }

  Map<int, List<String>> inWhichWordIsThisPoint(
      Offset point, Map<Map<int, List<String>>, Offset> wordOffsetmap) {
    Map<int, List<String>> card = null;
    var words = wordOffsetmap.keys.toList();
    for (var index = 0; index < words.length; index++) {
      if (pointInOffset(point, wordOffsetmap[words[index]]) == true) {
        card = words[index];
        print(words[index]);
        print((pointInOffset(point, wordOffsetmap[words[index]]) == true));
      }
    }

    return card;
  }

  bool pointInOffset(Offset point, Offset cardOffset) {
    //  print('cardwidth' + cardSize.width.toString());

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
      print('picOffsetmap');
      print(picOffsetmap);
      print('wordOffsetmap');
      print(wordOffsetmap);
    });
    setState(() {
      print('init');
    });
  }

  getPicsCardsSizesAndPositions() {
    var pickeys = initialpicChoiceMap.keys.toList();
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
    var wordkeys = initialpicChoiceMap.values.toList();

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
    return Center(
      child: GestureDetector(
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
            // print(_points);

            firstPointOffset = _points[0];
            if (_points.length >= 2)
              lastPointOffset = _points[_points.length - 2];

            if (firstPointOffset != null && lastPointOffset != null) {
              if (inWhichPicIsThisPoint(firstPointOffset, picOffsetmap) != '') {
                startedWithPic = true;
                startingPic =
                    inWhichPicIsThisPoint(firstPointOffset, picOffsetmap);
              }

              if (inWhichWordIsThisPoint(firstPointOffset, wordOffsetmap) !=
                  null) {
                startedWithWord = true;
                startingWord =
                    inWhichWordIsThisPoint(firstPointOffset, wordOffsetmap);
              }
              if (inWhichPicIsThisPoint(lastPointOffset, picOffsetmap) != '') {
                endedWithPic = true;
                endingPic =
                    inWhichPicIsThisPoint(lastPointOffset, picOffsetmap);
              }
              if (inWhichWordIsThisPoint(lastPointOffset, wordOffsetmap) !=
                  null) {
                endedWithWord = true;
                endingWord =
                    inWhichWordIsThisPoint(lastPointOffset, wordOffsetmap);
              }
            }

            print('startedWithPic ' + startedWithPic.toString());
            print('startedWithWord ' + startedWithWord.toString());
            print('endedWithPic ' + endedWithPic.toString());
            print('endedWithWord ' + endedWithWord.toString());

            print('startingPic =' + startingPic.toString());
            print('startingWord =' + startingWord.toString());
            print('endingPic =' + endingPic.toString());
            print('endingWord =' + endingWord.toString());

            if (startedWithPic == true && endedWithWord == true) {
              print('startedWithPic&&endedWithWord');
              print('picChoiceMap[startingPic] =');
              print(picChoiceMap[startingPic]);
              if ((picChoiceMap[startingPic].toString() ==
                  endingWord.toString())) {
                if (scoreMap[startingPic] == null) {
                  print('inside scoreMap[startingPic] == null');
                  setState(() {
                    _truePoints += _points;
                    _points = [];
                    scoreMap[startingPic] = true;
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
                    print('gj');
                    Flame.audio.play('good.mp3');
                    setState(() {
                      _points = [];
                    });
                  }
                } else
                  setState(() {
                    _points = [];
                  });
              } else {
                print('nah');
                Flame.audio.play('error.mp3');
                setState(() {
                  _points = [];
                  _truePoints = [];
                  scoreMap = {};
                });
              }
            } else if (startedWithWord == true && endedWithPic == true) {
              print('startedWithWord&&endedWithPic');
              if ((picChoiceMap[endingPic].toString() ==
                  startingWord.toString())) {
                if (scoreMap[endingPic] == null) {
                  print('inside scoreMap[startingPic] == null');
                  setState(() {
                    _truePoints += _points;
                    _points = [];
                    scoreMap[endingPic] = true;
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
                    print('gj');
                    Flame.audio.play('good.mp3');
                    setState(() {
                      _points = [];
                    });
                  }
                } else
                  setState(() {
                    _points = [];
                  });
              } else {
                print('nah');
                Flame.audio.play('error.mp3');
                setState(() {
                  _points = [];
                  _truePoints = [];
                  scoreMap = {};
                });
              }
            } else {
              print('neither');
              Flame.audio.play('error.mp3');
              setState(() {
                _points = [];
                _truePoints = [];
                scoreMap = {};
              });
            }
            print('scoreMap=' + scoreMap.toString());

            setState(() {
              startingPic = null;
              startingWord = null;
              endingPic = null;
              endingWord = null;
              startedWithPic = false;
              startedWithWord = false;
              endedWithPic = false;
              endedWithWord = false;
            });
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
                          var keys = initialpicChoiceMap.keys.toList();
                          return GestureDetector(
                            onTap: () {
                              print('tapped pic');
                              print(index);
                            },
                            child: Container(
                              key: _picCardKey[index],
                              width: 300,
                              height: 200,
                              // decoration: BoxDecoration(
                              //   border: Border.all(
                              //       width: 3.0, color: Colors.lightBlueAccent),
                              //   borderRadius: BorderRadius.all(Radius.circular(
                              //           5.0) //         <--- border radius here
                              //       ),
                              // ),
                              child: new Image.asset(
                                keys[index],
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
                          var choices = initialpicChoiceMap.values.toList();
                          return GestureDetector(
                            onTap: () {
                              print('tapped pic');
                              print(index);
                            },
                            child: Container(
                                key: _wordCardKey[index],
                                width: 300,
                                height: 200,
                                // decoration: BoxDecoration(
                                //   border: Border.all(
                                //       width: 3.0,
                                //       color: Colors.lightBlueAccent),
                                //   // color: Colors.blueAccent,
                                //   borderRadius: BorderRadius.all(
                                //       Radius.circular(
                                //           5.0) //         <--- border radius here
                                //       ),
                                // ),
                                child: RedLetterWord(
                                  textList: choices[index].values.toList()[0],
                                  pos: choices[index].keys.toList()[0],
                                )),
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

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundMainColor,
      drawer: AppDrawer(),
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
