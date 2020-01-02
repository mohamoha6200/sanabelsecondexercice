import 'dart:async';
import 'package:flame/flame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanabelsecondexercice/components/ExQuestionBar.dart';
import 'package:sanabelsecondexercice/components/widgets/ResultSuccessQuestion.dart';
import 'package:sanabelsecondexercice/theme/style.dart';

class ExerciceEight extends StatefulWidget {
  final subQuestion;

  ExerciceEight({this.subQuestion});

  @override
  _ExerciceEightState createState() => _ExerciceEightState();
}

class _ExerciceEightState extends State<ExerciceEight> {
  // static final GlobalKey _cardKey = GlobalKey();

  Map<String, bool> scoreMap = {};

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

  Map<String, String> boxsMap = {
    //  'assets/alifSeperate.png': 'seperate',
    //  'assets/alifAttached.png': 'attached',
  };
  int rightAnswersCount;

  Size circleSize;
  var subQuestion;

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) => getSizeAndPosition());

    setState(() {
      rightAnswersCount = fnRightAnswersCount();
      subQuestion = widget.subQuestion;
      boxsMap = fillBoxMap(subQuestion);
    });
  }

  // getSizeAndPosition() {
  //   RenderBox _cardBox = _cardKey.currentContext.findRenderObject();
  //   setState(() {
  //     circleSize = _cardBox.size;
  //   });
  //   print('circleSize' + circleSize.toString());
  // }

  Map<String, String> fillBoxMap(subQuestion) {
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
    return {
      'assets/$prefix' 'AttachedBox.png': 'attached',
      'assets/$prefix' 'SeperateBox.png': 'seperate',
    };
  }

  int fnRightAnswersCount() {
    var x = 0;
    var circlesMapValues = circlesMap.values.toList();
    for (var i = 0; i < circlesMapValues.length; i++) {
      if (circlesMapValues[i].length != 0) {
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: boxsMap.keys
                      .map((emoji) => _buildDragTarget(emoji))
                      .toList()),
              GridView.count(
                shrinkWrap: true,
                childAspectRatio: 2.5,
                physics: ClampingScrollPhysics(),
                crossAxisCount: 4,
                children: circlesMap.keys.map((emoji) {
                  return Draggable<String>(
                    data: emoji,
                    child:
                        Emoji(emojiStr: (scoreMap[emoji] == true) ? '' : emoji),
                    feedback: Emoji(emojiStr: emoji),
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
        // print('creating target for--' + circlesMap[emoji].toString());
        print('emoji' + emoji);
        // if (scoreMap[emoji] == true) {

        // } else {

        // }
        return Image.asset(
          emoji,
          fit: BoxFit.fill,
          width: screenSize.width / 4,
          height: screenSize.height / 2.5,
        );
      },
      onWillAccept: (data) {
        print(' will accept data ' + data);
        print(' will accept circlesMap[data] ' + circlesMap[data].toString());
        print(' will accept boxsMap[emoji] ' + boxsMap[emoji].toString());

        return circlesMap[data].contains(boxsMap[emoji]);
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
            // print(circlesMap);
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
          question: 'أضع كل كلمة في الصندوق المناسب',
          kidPic: 'kids6.png',
          logos: false,
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
                fit: BoxFit.fitHeight,
                width: screenSize.width / 4,
                height: screenSize.height / 5.5,
              )
            : Container());
  }
}