import 'package:flame/flame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanabelsecondexercice/components/ExQuestionBar.dart';
import 'package:sanabelsecondexercice/components/models/redLetterWord.dart';
import 'package:sanabelsecondexercice/components/widgets/ExerciceDrawer.dart';
import 'package:sanabelsecondexercice/components/widgets/ResultSuccessQuestion.dart';
import 'package:sanabelsecondexercice/components/widgets/Signature.dart';
import 'package:sanabelsecondexercice/components/widgets/backgroundImage.dart';
import 'package:sanabelsecondexercice/components/widgets/exAppBar.dart';
import 'package:sanabelsecondexercice/pages/Exercice4v2.dart';

import 'package:sanabelsecondexercice/theme/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExerciceThree extends StatefulWidget {
  @override
  _ExerciceThreeState createState() => _ExerciceThreeState();
}

class _ExerciceThreeState extends State<ExerciceThree> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Offset> _points = <Offset>[];
  List<Offset> _truePoints = <Offset>[];
  String subQuestion = '';
  String subQuestionLatin;
  SharedPreferences prefs;

  // static final GlobalKey _loginFormKey =
  //     new GlobalKey(debugLabel: '_loginFormKey');
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
    // 'assets/bird.png': {
    //   0: ['بُ', 'لْ', 'بُ', 'لٌ']
    // },
    // 'assets/door.png': {
    //   0: ['بَ', 'ا', 'بٌ']
    // },
    // 'assets/berkar.png': {
    //   0: ['بِ', 'رْ', 'كَ', 'ا', 'رٌ']
    // }
  };

  Map<String, Map<int, List<String>>> initialpicChoiceMap = {
    // 'assets/berkar.png': {
    //   0: ['بُ', 'لْ', 'بُ', 'لٌ']
    // },
    // 'assets/bird.png': {
    //   0: ['بَ', 'ا', 'بٌ']
    // },
    // 'assets/door.png': {
    //   0: ['بِ', 'رْ', 'كَ', 'ا', 'رٌ']
    // }
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
    gettingLetter();

    print('init');
  }

  gettingLetter() async {
    SharedPreferences.getInstance().then((onValue) {
      prefs = onValue;
      setState(() {
        subQuestion = prefs.getString('currentLetter');
      });
      initialiseSubQuestionLatin();

      print('subQuestionLatin = ' + subQuestionLatin);

      WidgetsBinding.instance.addPostFrameCallback((_) {
        getPicsCardsSizesAndPositions();
        getWordsCardsSizesAndPositions();
        print('picOffsetmap');
        print(picOffsetmap);
        print('wordOffsetmap');
        print(wordOffsetmap);
      });
      print("subQuestion === ");
      print(subQuestion);
    });
  }

  initialiseSubQuestionLatin() {
    switch (subQuestion) {
      // case 'أ':
      //   {
      //     setState(() {
      //       subQuestionLatin = 'alif';
      //       picChoiceMap = {
      //         'assets/bird.png': {
      //           0: ['بُ', 'لْ', 'بُ', 'لٌ']
      //         },
      //         'assets/door.png': {
      //           0: ['بَ', 'ا', 'بٌ']
      //         },
      //         'assets/berkar.png': {
      //           0: ['بِ', 'رْ', 'كَ', 'ا', 'رٌ']
      //         }
      //       };
      //       initialpicChoiceMap = {
      //         'assets/berkar.png': {
      //           0: ['بُ', 'لْ', 'بُ', 'لٌ']
      //         },
      //         'assets/bird.png': {
      //           0: ['بَ', 'ا', 'بٌ']
      //         },
      //         'assets/door.png': {
      //           0: ['بِ', 'رْ', 'كَ', 'ا', 'رٌ']
      //         }
      //       };
      //     });
      //   }
      //   break;
      case 'ب':
        {
          setState(() {
            subQuestionLatin = 'ba';
            picChoiceMap = {
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
            initialpicChoiceMap = shuffleMap(picChoiceMap);
          });
        }
        break;
      case 'ت':
        {
          setState(() {
            subQuestionLatin = 'te';
            picChoiceMap = {
              'assets/blueberry.png': {
                0: [
                  'تُ',
                  'و',
                  'تٌ',
                ]
              },
              'assets/tv.png': {
                0: ['تِ', 'لْ', 'فَ', 'ا', 'زٌ']
              },
              'assets/dates.png': {
                0: ['تَ', 'مْ', 'رٌ']
              }
            };
            initialpicChoiceMap = shuffleMap(picChoiceMap);
          });
        }
        break;
      case 'ث':
        {
          setState(() {
            subQuestionLatin = 'the';
            picChoiceMap = {
              'assets/bull.png': {
                0: [
                  'ثَ',
                  'وْ',
                  'رٌ',
                ]
              },
              'assets/snake.png': {
                0: ['ثُ', 'عْ', 'بَ', 'ا', 'نٌ']
              },
              'assets/fruits.png': {
                0: ['ثِ', 'مَ', 'ا', 'رٌ']
              }
            };
            initialpicChoiceMap = shuffleMap(picChoiceMap);
          });
        }
        break;
      case 'ج':
        {
          setState(() {
            subQuestionLatin = 'the';
            picChoiceMap = {
              'assets/wall.png': {
                0: [
                  'جِ',
                  'دَ',
                  'ا',
                  'رٌ',
                ]
              },
              'assets/carrot.png': {
                0: ['جَ', 'زَ', 'رٌ']
              },
              'assets/cheese.png': {
                0: ['جُ', 'بْ', 'نٌ']
              }
            };
            initialpicChoiceMap = shuffleMap(picChoiceMap);
          });
        }
        break;
      case 'ح':
        {
          setState(() {
            subQuestionLatin = '7a';
            picChoiceMap = {
              'assets/whale.png': {
                0: [
                  'حُ',
                  'و',
                  'تٌ',
                ]
              },
              'assets/desktop.png': {
                0: ['حَ', 'ا', 'سُ', 'و', 'بٌ']
              },
              'assets/donkey.png': {
                0: ['حِ', 'مَ', 'ا', 'رٌ']
              }
            };
            initialpicChoiceMap = shuffleMap(picChoiceMap);
          });
        }
        break;
      case 'خ':
        {
          setState(() {
            subQuestionLatin = '5a';
            picChoiceMap = {
              'assets/cucumber.png': {
                0: ['خِ', 'يَ', 'ا', 'رٌ']
              },
              'assets/sheep.png': {
                0: ['خَ', 'رُ', 'و', 'فٌ']
              },
              'assets/bread.png': {
                0: [
                  'خُ',
                  'بْ',
                  'زٌ',
                ]
              }
            };
            initialpicChoiceMap = shuffleMap(picChoiceMap);
          });
        }
        break;
      case 'د':
        {
          setState(() {
            subQuestionLatin = 'da';
            picChoiceMap = {
              'assets/bear.png': {
                0: [
                  'دُ',
                  'بٌّ',
                ]
              },
              'assets/bike.png': {
                0: ['دَ', 'رَّ', 'ا', 'جَ', 'ةٌ']
              },
              'assets/cockerel.png': {
                0: [
                  'دِ',
                  'ي',
                  'كٌ',
                ]
              }
            };
            initialpicChoiceMap = shuffleMap(picChoiceMap);
          });
        }
        break;
      case 'ذ':
        {
          setState(() {
            subQuestionLatin = 'tha';
          });
        }
        break;
      case 'ر':
        {
          setState(() {
            subQuestionLatin = 'ra';
            picChoiceMap = {
              'assets/spear.png': {
                0: ['رُ', 'مْ', 'حٌ']
              },
              'assets/foot.png': {
                0: ['رِ', 'جْ', 'لٌ']
              },
              'assets/head.png': {
                0: [
                  'رَ',
                  'أْ',
                  'سٌ',
                ]
              }
            };
            initialpicChoiceMap = shuffleMap(picChoiceMap);
          });
        }
        break;
      case 'ز':
        {
          setState(() {
            subQuestionLatin = 'za';
            picChoiceMap = {
              'assets/ruby.png': {
                0: ['زُ', 'مُ', 'رُّ', 'دٌ']
              },
              'assets/button.png': {
                0: ['زِ', 'رٌّ']
              },
              'assets/giraffe.png': {
                0: ['زَ', 'رَ', 'ا', 'فَ', 'ةٌ']
              }
            };
            initialpicChoiceMap = shuffleMap(picChoiceMap);
          });
        }
        break;
      case 'س':
        {
          setState(() {
            subQuestionLatin = 'sa';
            picChoiceMap = {
              'assets/trousers.png': {
                0: ['سِ', 'رْ', 'وَ', 'ا', 'لٌ']
              },
              'assets/fish.png': {
                0: ['سَ', 'مَ', 'كَ', 'ةٌ']
              },
              'assets/wheat.png': {
                0: ['سُ', 'نْ', 'بُ', 'لَ', 'ةٌ']
              }
            };
            initialpicChoiceMap = shuffleMap(picChoiceMap);
          });
        }
        break;
      case 'ش':
        {
          setState(() {
            subQuestionLatin = 'cha';
          });
        }
        break;
      case 'ص':
        {
          setState(() {
            subQuestionLatin = 'sad';
            picChoiceMap = {
              'assets/photo.png': {
                0: ['صُ', 'و', 'رَ', 'ةٌ']
              },
              'assets/rocket.png': {
                0: ['صَ', 'ا', 'رُ', 'و', 'خٌ']
              },
              'assets/juice.png': {
                0: ['عَ', 'صِ', 'ي', 'رٌ']
              }
            };
            initialpicChoiceMap = shuffleMap(picChoiceMap);
          });
        }
        break;
      case 'ض':
        {
          setState(() {
            subQuestionLatin = 'dhad';
          });
        }
        break;
      case 'ط':
        {
          setState(() {
            subQuestionLatin = 'ta';
          });
        }
        break;
      case 'ظ':
        {
          setState(() {
            subQuestionLatin = 'dha';
          });
        }
        break;
      case 'ع':
        {
          setState(() {
            subQuestionLatin = '3a';
          });
        }
        break;
      case 'غ':
        {
          setState(() {
            subQuestionLatin = '8a';
          });
        }
        break;
      case 'ف':
        {
          setState(() {
            subQuestionLatin = 'fa';
          });
        }
        break;
      case 'ق':
        {
          setState(() {
            subQuestionLatin = '9a';
          });
        }
        break;
      case 'ك':
        {
          setState(() {
            subQuestionLatin = 'ka';
          });
        }
        break;
      case 'ل':
        {
          setState(() {
            subQuestionLatin = 'la';
          });
        }
        break;
      case 'م':
        {
          setState(() {
            subQuestionLatin = 'ma';
          });
        }
        break;
      case 'ن':
        {
          setState(() {
            subQuestionLatin = 'na';
          });
        }
        break;
      case 'ه':
        {
          setState(() {
            subQuestionLatin = 'ha';
          });
        }
        break;
      case 'و':
        {
          setState(() {
            subQuestionLatin = 'wa';
          });
        }
        break;
      case 'ي':
        {
          setState(() {
            subQuestionLatin = 'ya';
          });
        }
        break;

      default:
        {
          setState(() {
            subQuestionLatin = 'ba';
          });
        }
    }
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
    Size screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onPanUpdate: (DragUpdateDetails details) {
        setState(() {
          RenderBox object = context.findRenderObject();
          Offset _localPosition = object.globalToLocal(details.globalPosition);

          _points = new List.from(_points)..add(_localPosition);
          // print('_localPosition: ' + _localPosition.toString());
          // print('_points: ' + _points.toString());
        });
      },
      onPanEnd: (DragEndDetails details) {
        _points.add(null);
        // print(_points);

        firstPointOffset = _points[0];
        if (_points.length >= 2) lastPointOffset = _points[_points.length - 2];

        if (firstPointOffset != null && lastPointOffset != null) {
          if (inWhichPicIsThisPoint(firstPointOffset, picOffsetmap) != '') {
            startedWithPic = true;
            startingPic = inWhichPicIsThisPoint(firstPointOffset, picOffsetmap);
          }

          if (inWhichWordIsThisPoint(firstPointOffset, wordOffsetmap) != null) {
            startedWithWord = true;
            startingWord =
                inWhichWordIsThisPoint(firstPointOffset, wordOffsetmap);
          }
          if (inWhichPicIsThisPoint(lastPointOffset, picOffsetmap) != '') {
            endedWithPic = true;
            endingPic = inWhichPicIsThisPoint(lastPointOffset, picOffsetmap);
          }
          if (inWhichWordIsThisPoint(lastPointOffset, wordOffsetmap) != null) {
            endedWithWord = true;
            endingWord = inWhichWordIsThisPoint(lastPointOffset, wordOffsetmap);
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
          if ((picChoiceMap[startingPic].toString() == endingWord.toString())) {
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
                      // Future.delayed(Duration(seconds: 5), () {
                      //   Navigator.of(context).pop(true);
                      // });
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
                  initialpicChoiceMap = shuffleMap(picChoiceMap);
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    getPicsCardsSizesAndPositions();
                    getWordsCardsSizesAndPositions();
                  });
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
              // _truePoints = [];
              // scoreMap = {};
            });
          }
        } else if (startedWithWord == true && endedWithPic == true) {
          print('startedWithWord&&endedWithPic');
          if ((picChoiceMap[endingPic].toString() == startingWord.toString())) {
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
                      // Future.delayed(Duration(seconds: 5), () {
                      //   Navigator.of(context).pop(true);
                      // });
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
                  initialpicChoiceMap = shuffleMap(picChoiceMap);
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    getPicsCardsSizesAndPositions();
                    getWordsCardsSizesAndPositions();
                  });
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
              // _truePoints = [];
              // scoreMap = {};
            });
          }
        } else {
          print('neither');
          Flame.audio.play('error.mp3');
          setState(() {
            _points = [];
            // _truePoints = [];
            // scoreMap = {};
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(3, (index) {
              var keys = initialpicChoiceMap.keys.toList();

              return keys.length == 3
                  ? Container(
                      key: _picCardKey[index],
                      width: screenSize.width / 3,
                      height: screenSize.height / 2.7,
                      child: new Image.asset(
                        keys[index],
                        fit: BoxFit.contain,
                      ),
                    )
                  : Container();
            }),
          ),
          // SizedBox(
          //   height: screenSize.height / 10,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(3, (index) {
              var choices = initialpicChoiceMap.values.toList();
              return choices.length == 3
                  ? Container(
                      alignment: Alignment.bottomCenter,
                      width: screenSize.width / 3,
                      height: screenSize.height / 2.7,
                      key: _wordCardKey[index],
                      child: RedLetterWord(
                        textList: choices[index].values.toList()[0],
                        pos: choices[index].keys.toList()[0],
                      ))
                  : Container();
            }),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return backgroundImage(
      CustomPaint(
        isComplex: true,
        painter: new Signature(points: _points, trues: _truePoints),
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.transparent,
          appBar: exAppBar(
            screenSize,
            _scaffoldKey,
            ExQuestionBar(
              question: '  أَرْبِطُ الكَلِمَةَ بِالصُّورَةِ المُنَاسِبَةِ',
              kidPic: 'kids4.png',
              logos: false,
            ),
          ),
          drawer: AppDrawer(),
          body: childWidget(),
          // bottomNavigationBar: Container(
          //   height: screenSize.height * 0.05,
          //   child: new FloatingActionButton(
          //       child: new Icon(Icons.clear),
          //       onPressed: () => {
          //             setState(() {
          //               _truePoints = [];
          //               _points = [];
          //               scoreMap = {};
          //             }),
          //           }),
          // ),
        ),
      ),
    );
  }
}

Map<String, Map<int, List<String>>> shuffleMap(
    Map<String, Map<int, List<String>>> map) {
  Map<String, Map<int, List<String>>> result = {};
  var keys = map.keys.toList()..shuffle();
  var values = map.values.toList()..shuffle();
  for (var i = 0; i < keys.length; i++) {
    result[keys[i]] = values[i];
  }
  return result;
}
