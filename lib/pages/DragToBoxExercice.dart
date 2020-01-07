import 'dart:async';
import 'package:flame/flame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanabelsecondexercice/components/ExQuestionBar.dart';
import 'package:sanabelsecondexercice/components/widgets/ResultSuccessQuestion.dart';
import 'package:sanabelsecondexercice/theme/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DragToExercice extends StatefulWidget {
  @override
  _DragToExerciceState createState() => _DragToExerciceState();
}

class _DragToExerciceState extends State<DragToExercice> {
  Map<String, bool> scoreMap = {};

  Map<String, List<String>> draggablesMap = {};

  Map<String, List<String>> cardsMap = {
    'assets/doorCard-final.png': ['start', 'end'],
    'assets/datesCard-final.png': [],
    'assets/breadCard-final.png': ['middle'],
    'assets/duckCard-final.png': ['start'],
    'assets/treeCard-final.png': [],
    'assets/tigerCard-final.png': [],
    'assets/rabbitCard-final.png': ['middleToEnd'],
  };

  Map<String, List<String>> circlesMap = {
    'assets/rabbitCircle-final.png': ['seperate'],
    'assets/phoneCircle-final.png': ['attached'],
    'assets/closetCircle-final.png': ['seperate'],
    'assets/carCircle-final.png': ['attached'],
    'assets/athanCircle-final.png': ['seperate', 'attached'],
    'assets/horseCirle-final.png': ['attached'],
    'assets/shoeCircle-final.png': ['seperate'],
    'assets/bookCirle-final.png': ['attached'],
  };

  int rightAnswersCount;

  String subQuestion = '';

  bool nextExercice = false;

  Map<String, String> boxsMap = {};
  String cardOrCircle;
  SharedPreferences prefs;

  @override
  void initState() {
    super.initState();

    gettingLetter();

    print(subQuestion);
  }

  gettingLetter() async {
    SharedPreferences.getInstance().then((onValue) {
      prefs = onValue;
      setState(() {
        subQuestion = prefs.getString('currentLetter');
        draggablesMap = fillDraggablesMap(subQuestion);
        print('draggablesMap = ' + draggablesMap.toString());
        rightAnswersCount = fnRightAnswersCount();
        print('rightAnswersCount = ' + rightAnswersCount.toString());
        boxsMap = fillBoxMap(subQuestion);
        print('boxsMap');
        print(boxsMap);
      });
    });
    print("subQuestion === ");
    print(subQuestion);
  }

  Map<String, List<String>> fillDraggablesMap(subQuestion) {
    Map<String, List<String>> draggables = {};
    if (subQuestion == 'ب') {
      draggables = cardsMap;
      setState(() {
        cardOrCircle = 'card';
      });
    }

    if (subQuestion == 'أ') {
      draggables = circlesMap;
      setState(() {
        cardOrCircle = 'circle';
      });
    }
    return draggables;
  }

  Map<String, String> fillBoxMap(subQuestion) {
    print('inside fillBoxMap');
    Map<String, String> boxes;
    String prefix;
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
        }
        break;
      case 'ذ':
        {
          prefix = 'tha';
        }
        break;
      case 'ر':
        {
          prefix = 'ra';
        }
        break;
      case 'ز':
        {
          prefix = 'za';
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
    if (prefix == 'ba') {
      boxes = {
        'assets/$prefix' 'End.png': 'end',
        'assets/$prefix' 'MiddleToEnd.png': 'middleToEnd',
        'assets/$prefix' 'Middle.png': 'middle',
        'assets/$prefix' 'Start.png': 'start',
      };
    }
    if (prefix == 'alif') {
      boxes = {
        'assets/$prefix' 'AttachedBox.png': 'attached',
        'assets/$prefix' 'SeperateBox.png': 'seperate',
      };
    }

    return boxes;
  }

  int fnRightAnswersCount() {
    var x = 0;
    var draggablesMapValues = draggablesMap.values.toList();
    for (var i = 0; i < draggablesMapValues.length; i++) {
      if (draggablesMapValues[i].length != 0) {
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
        cardOrCircle == 'card'
            ? Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: draggablesMap.keys.map((emoji) {
                        return Draggable<String>(
                          data: emoji,
                          child: EmojiForCard(
                              emojiStr: (scoreMap[emoji] == true) ? '' : emoji),
                          feedback: EmojiForCard(emojiStr: emoji),
                          childWhenDragging: Container(
                            width: screenSize.width / 7,
                          ),
                          onDragEnd: (value) {
                            // print('the is value ' + scoreMap[emoji].toString());
                            if ((scoreMap[emoji] == null)) {
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
              )
            : Expanded(
                child: Column(
                  // Circles
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: boxsMap.keys
                            .map((emoji) => _buildDragTarget(emoji))
                            .toList()),
                    // Circles
                    GridView.count(
                      shrinkWrap: true,
                      childAspectRatio: 2.5,
                      physics: ClampingScrollPhysics(),
                      crossAxisCount: 4,
                      children: draggablesMap.keys.map((emoji) {
                        return Draggable<String>(
                          data: emoji,
                          child: EmojiForCircle(
                              emojiStr: (scoreMap[emoji] == true) ? '' : emoji),
                          feedback: EmojiForCircle(emojiStr: emoji),
                          childWhenDragging: Container(
                              width: screenSize.width / 5,
                              height: screenSize.height / 5),
                          onDragEnd: (value) {
                            // print('the is value ' + scoreMap[emoji].toString());

                            if ((scoreMap[emoji] == null)) {
                              Flame.audio.play('error.mp3');
                            }
                          },
                        );
                      }).toList(),
                    ),
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
        // print('creating target for--' + draggablesMap[emoji].toString());
        print('emoji' + emoji);
        // if (scoreMap[emoji] == true) {

        // } else {

        // }
        return Image.asset(
          emoji,
          fit: BoxFit.fill,
          width: screenSize.width / 4,
          height: screenSize.height / 3.2,
        );
      },
      onWillAccept: (data) {
        print(' will accept data ' + data);
        print(' will accept draggablesMap[data] ' +
            draggablesMap[data].toString());
        print(' will accept BoxsMap[emoji] ' + boxsMap[emoji].toString());

        return draggablesMap[data].contains(boxsMap[emoji]);
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
            // print(draggablesMap);
            showDialog(
                context: context,
                builder: (context) {
                  Future.delayed(Duration(seconds: 3), () {
                    Navigator.of(context).pop(true);
                  });
                  return Theme(
                    data: Theme.of(context)
                        .copyWith(dialogBackgroundColor: Colors.transparent),
                    child: ResultSucessQuestion(),
                  );
                });
            Future.delayed(Duration(seconds: 5), () {
              setState(() {
                scoreMap = {};
              });
            });
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
        ExQuestionBar(
          question: cardOrCircle == 'card'
              ? 'أضع كل كلمة و صورتها في الصندوق المناسب'
              : 'أضع كل كلمة في الصندوق المناسب',
          kidPic: 'kids6.png',
          logos: false,
          nextExercice: nextExercice,
        ),
        Expanded(child: exView()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundMainColor,
      body: childItem(),
    );
  }
}

class EmojiForCard extends StatelessWidget {
  final String emojiStr;

  EmojiForCard({
    Key key,
    this.emojiStr,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Material(
        color: Colors.transparent,
        child: emojiStr != ''
            ? Image.asset(emojiStr,
                fit: BoxFit.contain,
                width: screenSize.width / 7,
                height: screenSize.height / 2.2)
            : Container());
  }
}

class EmojiForCircle extends StatelessWidget {
  final String emojiStr;

  EmojiForCircle({
    Key key,
    this.emojiStr,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Material(
        color: Colors.transparent,
        child: emojiStr != ''
            ? Image.asset(emojiStr,
                fit: BoxFit.contain,
                width: screenSize.width / 4,
                height: screenSize.height / 5.5)
            : Container());
  }
}
