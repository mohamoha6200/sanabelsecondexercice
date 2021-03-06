import 'dart:async';
import 'package:flame/flame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanabelsecondexercice/components/ExQuestionBar.dart';
import 'package:sanabelsecondexercice/components/widgets/ExerciceDrawer.dart';
import 'package:sanabelsecondexercice/components/widgets/ResultSuccessQuestion.dart';
import 'package:sanabelsecondexercice/components/widgets/exAppBar.dart';
import 'package:sanabelsecondexercice/theme/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExerciceFive extends StatefulWidget {
  @override
  _ExerciceFiveState createState() => _ExerciceFiveState();
}

class _ExerciceFiveState extends State<ExerciceFive> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Map<String, bool> scoreMap = {};

  String subQuestion = '';
  SharedPreferences prefs;

  Map<String, List<String>> cardsMap = {
    // 'assets/doorCard-final.png': ['start', 'end'],
    // 'assets/datesCard-final.png': [],
    // 'assets/breadCard-final.png': ['middle'],
    // 'assets/duckCard-final.png': ['start'],
    // 'assets/treeCard-final.png': [],
    // 'assets/tigerCard-final.png': [],
    // 'assets/rabbitCard-final.png': ['middleToEnd'],
  };

  Map<String, String> boxsMap = {
    // 'assets/baEnd2.png': 'end',
    // 'assets/baMiddleToEnd2.png': 'middleToEnd',
    // 'assets/baMiddle2.png': 'middle',
    // 'assets/baStart2.png': 'start',
  };
  int rightAnswersCount;

  Map<String, List<String>> initialCardsMap = {};

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
        boxsMap = fillBoxMap(subQuestion);
      });
      initilizeCardsMap();

      print("subQuestion === ");
      print(subQuestion);
    });
  }

  initilizeCardsMap() {
    switch (subQuestion) {
      case 'ب':
        {
          setState(() {
            cardsMap = {
              'assets/doorCard.png': ['start', 'end'],
              'assets/datesCard.png': [],
              'assets/breadCard.png': ['middle'],
              'assets/duckCard.png': ['start'],
              'assets/treeCard.png': [],
              'assets/tigerCard.png': [],
              'assets/rabbitCard.png': ['middleToEnd'],
            };
            initialCardsMap = shuffleMap(cardsMap);
          });
        }
        break;
      case 'ت':
        {
          setState(() {
            cardsMap = {
              'assets/crownCard.png': ['start'],
              'assets/bookCard.png': ['middle'],
              'assets/datesCard.png': ['start'],
              'assets/cowCard.png': ['end'],
              'assets/whaleCard.png': ['middleToEnd'],
              'assets/bullCard.png': [],
              'assets/duckCard.png': ['end'],
            };
            initialCardsMap = shuffleMap(cardsMap);
          });
        }
        break;
      case 'ث':
        {
          setState(() {
            cardsMap = {
              'assets/triangleCard.png': ['middle', 'middleToEnd'],
              'assets/refrigeratorCard.png': ['start'],
              'assets/furnitureCard.png': ['start', 'end'],
              'assets/threeCard.png': ['start'],
              'assets/foxCard.png': ['start'],
              'assets/garlicCard.png': ['start'],
              'assets/wolfCard.png': [],
            };
            initialCardsMap = shuffleMap(cardsMap);
          });
        }
        break;
      case 'ج':
        {
          setState(() {
            cardsMap = {
              'assets/chickenCard.png': ['start'],
              'assets/camelCard.png': ['start'],
              'assets/treeCard.png': ['middle'],
              'assets/iceCard.png': ['middleToEnd'],
              'assets/crownCard.png': ['end'],
              'assets/bellCard.png': ['start'],
              'assets/mosqueCard.png': ['middle'],
            };
            initialCardsMap = shuffleMap(cardsMap);
          });
        }
        break;
      case 'ح':
        {
          setState(() {
            cardsMap = {
              'assets/shoesCard.png': ['start'],
              'assets/crocodileCard.png': ['end'],
              'assets/beeCard.png': ['middle'],
              'assets/farmerCard.png': ['end'],
              'assets/thermoCard.png': ['middle'],
              'assets/seaCard.png': ['middle'],
              'assets/cloudCard.png': ['middle'],
            };
            initialCardsMap = shuffleMap(cardsMap);
          });
        }
        break;
      case 'خ':
        {
          setState(() {
            cardsMap = {
              'assets/palmTreeCard.png': ['middle'],
              'assets/fiveCard.png': ['start'],
              'assets/chefCard.png': ['end'],
              'assets/peachCard.png': ['start', 'end'],
              'assets/melonCard.png': ['middleToEnd'],
              'assets/tentCard.png': ['start'],
              'assets/cucumberCard.png': ['start'],
            };
            initialCardsMap = shuffleMap(cardsMap);
          });
        }
        break;
      case 'د':
        {
          setState(() {
            cardsMap = {
              'assets/chickenCard.png': ['start'],
              'assets/wallCard.png': ['end'],
              'assets/monkeyCard.png': ['start'],
              'assets/lionCard.png': ['end'],
              'assets/wormCard.png': ['start'],
              'assets/puppetCard.png': ['start'],
              'assets/schoolCard.png': ['end'],
            };
            initialCardsMap = shuffleMap(cardsMap);
          });
        }
        break;
      case 'ذ':
        {
          setState(() {});
        }
        break;
      case 'ر':
        {
          setState(() {
            cardsMap = {
              'assets/sheepCard.png': ['end'],
              'assets/rabbitCard.png': ['start'],
              'assets/monkeyCard.png': ['end'],
              'assets/tigerCard.png': ['end'],
              'assets/treeCard.png': ['end'],
              'assets/pomegranateCard.png': ['start'],
              'assets/carCard.png': ['start'],
            };
            initialCardsMap = shuffleMap(cardsMap);
          });
        }
        break;
      case 'ز':
        {
          setState(() {
            cardsMap = {
              'assets/giraffeCard.png': ['start'],
              'assets/deerCard.png': ['end'],
              'assets/oliveCard.png': ['start'],
              'assets/canoeCard.png': ['start'],
              'assets/buttonCard.png': ['start'],
              'assets/breadCard.png': ['end'],
              'assets/houseCard.png': ['end'],
            };
            initialCardsMap = shuffleMap(cardsMap);
          });
        }
        break;
      case 'س':
        {
          setState(() {
            cardsMap = {
              'assets/boatCard.png': ['start'],
              'assets/mosqueCard.png': ['middle'],
              'assets/bellCard.png': ['end'],
              'assets/bedCard.png': ['start'],
              'assets/broomCard.png': ['middle'],
              'assets/sunCard.png': ['start', 'middleToEnd'],
              'assets/washerCard.png': ['middle'],
            };
            initialCardsMap = shuffleMap(cardsMap);
          });
        }
        break;
      case 'ش':
        {
          setState(() {
            cardsMap = {
              'assets/sharkCard.png': ['end'],
              'assets/herbCard.png': ['middle'],
              'assets/treeCard.png': ['start'],
              'assets/apricotCard.png': ['middle','middleToEnd'],
              'assets/copCard.png': ['start'],
              'assets/sunCard.png': ['start','middleToEnd'],
              'assets/butterflyCard.png': ['start'],
            };
            initialCardsMap = shuffleMap(cardsMap);
          });
        }
        break;
      case 'ص':
        {
          setState(() {
            cardsMap = {
              'assets/thiefCard.png': ['middleToEnd'],
              'assets/rocketCard.png': ['start'],
              'assets/birdCard.png': ['middle'],
              'assets/mosqueTowerCard.png': ['start'],
              'assets/whistleCard.png': ['start'],
              'assets/juiceCard.png': ['middle'],
              'assets/diverCard.png': ['end'],
            };
            initialCardsMap = shuffleMap(cardsMap);
          });
        }
        break;
      case 'ض':
        {
           setState(() {
            cardsMap = {
              'assets/earthCard.png': ['end'],
              'assets/hyenaCard.png': ['start'],
              'assets/vegetablesCard.png': ['middle'],
              'assets/bandageCard.png': ['start'],
              'assets/photoCard.png': [],
              'assets/eggsCard.png': ['middleToEnd'],
              'assets/toiletCard.png': ['end'],
            };
            initialCardsMap = shuffleMap(cardsMap);
          });
        }
        break;
      case 'ط':
        {
          setState(() {
            cardsMap = {
              'assets/copCard.png': ['start'],
              'assets/catCard.png': ['middleToEnd'],
              'assets/penguinCard.png': ['middle'],
              'assets/doctorCard.png': ['start'],
              'assets/octopusCard.png': ['middle','end'],
              'assets/parachuteCard.png': ['middle'],
              'assets/drumCard.png': ['start'],
            };
            initialCardsMap = shuffleMap(cardsMap);
          });
        }
        break;
      case 'ظ':
        {
       setState(() {
            cardsMap = {
              'assets/umbrellaCard.png': ['middle'],
              'assets/backCard.png': ['start'],
              'assets/envelopeCard.png': ['start'],
              'assets/bagCard.png': ['middle'],
              'assets/shadowCard.png': ['start'],
              'assets/glassesCard.png': ['middle'],
              'assets/stableCard.png': ['middle'],
            };
            initialCardsMap = shuffleMap(cardsMap);
          });
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
    setState(() {
      rightAnswersCount = fnRightAnswersCount();
    });
  }

  Map<String, String> fillBoxMap(subQuestion) {
    String prefix;
    int boxes = 4;
    switch (subQuestion) {
      case 'أ':
        {
          prefix = 'alif';
        }
        break;
      case 'ب':
        {
          prefix = 'ba';
        }
        break;
      case 'ت':
        {
          prefix = 'te';
        }
        break;
      case 'ث':
        {
          prefix = 'the';
        }
        break;
      case 'ج':
        {
          prefix = 'ja';
        }
        break;
      case 'ح':
        {
          prefix = '7a';
        }
        break;
      case 'خ':
        {
          prefix = '5a';
        }
        break;
      case 'د':
        {
          prefix = 'da';
          boxes = 2;
        }
        break;
      case 'ذ':
        {
          prefix = 'tha';
          boxes = 2;
        }
        break;
      case 'ر':
        {
          prefix = 'ra';
          boxes = 2;
        }
        break;
      case 'ز':
        {
          prefix = 'za';
          boxes = 2;
        }
        break;
      case 'س':
        {
          prefix = 'sa';
        }
        break;
      case 'ش':
        {
          prefix = 'cha';
        }
        break;
      case 'ص':
        {
          prefix = 'sad';
        }
        break;
      case 'ض':
        {
          prefix = 'dhad';
        }
        break;
      case 'ط':
        {
          prefix = 'ta';
        }
        break;
      case 'ظ':
        {
          prefix = 'dha';
        }
        break;
      case 'ع':
        {
          prefix = '3a';
        }
        break;
      case 'غ':
        {
          prefix = '8a';
        }
        break;
      case 'ف':
        {
          prefix = 'fa';
        }
        break;
      case 'ق':
        {
          prefix = '9a';
        }
        break;
      case 'ك':
        {
          prefix = 'ka';
        }
        break;
      case 'ل':
        {
          prefix = 'la';
        }
        break;
      case 'م':
        {
          prefix = 'ma';
        }
        break;

      case 'ن':
        {
          prefix = 'na';
        }
        break;
      case 'ه':
        {
          prefix = 'ha';
        }
        break;
      case 'و':
        {
          prefix = 'wa';
          boxes = 2;
        }
        break;
      case 'ي':
        {
          prefix = 'ya';
        }
        break;
      default:
        {
          prefix = 'ba';
        }
    }
    if (boxes == 4)
      return {
        'assets/$prefix' 'End.png': 'end',
        'assets/$prefix' 'MiddleToEnd.png': 'middleToEnd',
        'assets/$prefix' 'Middle.png': 'middle',
        'assets/$prefix' 'Start.png': 'start',
      };
    else if (boxes == 2)
      return {
        'assets/$prefix' 'End.png': 'end',
        'assets/$prefix' 'Start.png': 'start',
      };
  }

  int fnRightAnswersCount() {
    var x = 0;
    var cardsMapValues = cardsMap.values.toList();
    for (var i = 0; i < cardsMapValues.length; i++) {
      if (cardsMapValues[i].length != 0) {
        x++;
      }
    }
    return x;
  }

  Widget exView() {
    Size screenSize = MediaQuery.of(context).size;
    print(screenSize);
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: initialCardsMap.keys.map((emoji) {
                  return Draggable<String>(
                    data: emoji,
                    child:
                        Emoji(emojiStr: (scoreMap[emoji] == true) ? '' : emoji),
                    feedback: Emoji(emojiStr: emoji),
                    childWhenDragging: Container(
                      width: screenSize.width / 7,
                    ),
                    onDragEnd: (value) {
                      print('scoreMap.length ' + scoreMap.length.toString());
                      print(
                          'rightAnswersCount ' + rightAnswersCount.toString());

                      if ((scoreMap[emoji] == null) && scoreMap.length != 0) {
                        Flame.audio.play('error.mp3');
                      }
                    },
                  );
                }).toList(),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: boxsMap.keys
                      .map((emoji) => _buildDragTarget(emoji))
                      .toList()),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDragTarget(emoji) {
    Size screenSize = MediaQuery.of(context).size;

    return DragTarget<String>(
      builder: (BuildContext context, List<String> candidateData,
          List rejectedData) {
        // print('creating target for--' + cardsMap[emoji].toString());
        print('emoji' + emoji);
        // if (scoreMap[emoji] == true) {

        // } else {

        // }
        return Image.asset(
          emoji,
          fit: BoxFit.fill,
          width: screenSize.width / 4,
          height: screenSize.height / 3,
        );
      },
      onWillAccept: (data) {
        print(' will accept data ' + data);
        print(
            ' will accept cardsMap[data] ' + initialCardsMap[data].toString());
        print(' will accept boxsMap[emoji] ' + boxsMap[emoji].toString());

        return cardsMap[data].contains(boxsMap[emoji]);
      },
      onAccept: (data) {
        setState(() {
          scoreMap[data] = true;
          // print('new scoreMap = ');
          // print(scoreMap);
          print('rightAnswersCount' + rightAnswersCount.toString());

          if (scoreMap.length == rightAnswersCount) {
            Flame.audio.play('treasure.mp3');

            // print('letterList = ');
            // print(cardsMap);
            showDialog(
                context: context,
                builder: (context) {
                  // Future.delayed(Duration(seconds: 3), () {
                  //   Navigator.of(context).pop(true);
                  // });
                  return Theme(
                    data: Theme.of(context)
                        .copyWith(dialogBackgroundColor: Colors.transparent),
                    child: ResultSucessQuestion(),
                  );
                });
            // Future.delayed(Duration(seconds: 5), () {
            setState(() {
              scoreMap = {};
              initialCardsMap = shuffleMap(cardsMap);
            });
            // });
          } else {
            Flame.audio.play('treasure.mp3');
            Future.delayed(Duration(seconds: 1), () {
              Flame.audio.play('good.mp3');
            });
          }
        });
        print('---ScoreLenght---');
        print(scoreMap.length);
      },
      onLeave: (data) {
        print('you just left ' + data);
      },
    );
  }

  Widget childItem() {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // ExQuestionBar(
        //   question: 'أضع كل كلمة و صورتها في الصندوق المناسب',
        //   kidPic: 'kids6.png',
        //   logos: false,
        // ),
        Expanded(child: exView()),
      ],
    );
  }

  Widget backgroundImage(child) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/classroom3.png"),
          fit: BoxFit.fill,
          colorFilter: new ColorFilter.mode(
              Colors.yellow.withOpacity(0.65), BlendMode.luminosity),
        ),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return backgroundImage(
      Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
        appBar: exAppBar(
          screenSize,
          _scaffoldKey,
          ExQuestionBar(
            question:
                'أَضَعُ كُلَّ كَلِمَةٍ وَ صُورَتَهَا فِي الصُّنْدُوقِ المُنَاسِبِ',
            kidPic: 'kids6.png',
            logos: false,
          ),
        ),
        drawer: AppDrawer(),
        body: childItem(),
      ),
    );
  }
}

class Emoji extends StatelessWidget {
  final String emojiStr;

  Emoji({Key key, this.emojiStr}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Material(
        color: Colors.transparent,
        child: emojiStr != ''
            ? Image.asset(
                emojiStr,
                fit: BoxFit.contain,
                width: screenSize.width / 7,
                height: screenSize.height / 2.2,
              )
            : Container(
                width: screenSize.width / 7,
                height: screenSize.height / 2.2,
              ));
  }
}

Map<String, List<String>> shuffleMap(Map<String, List<String>> map) {
  Map<String, List<String>> result = {};
  var keys = map.keys.toList()..shuffle();
  var values = map.values.toList()..shuffle();
  for (var i = 0; i < keys.length; i++) {
    result[keys[i]] = values[i];
  }
  return result;
}
