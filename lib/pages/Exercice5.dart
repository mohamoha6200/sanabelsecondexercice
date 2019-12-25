import 'dart:async';
import 'package:flame/flame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanabelsecondexercice/components/ExQuestionBar.dart';
import 'package:sanabelsecondexercice/components/widgets/ResultSuccessQuestion.dart';
import 'package:sanabelsecondexercice/theme/style.dart';

class ExerciceFive extends StatefulWidget {
  @override
  _ExerciceFiveState createState() => _ExerciceFiveState();
}

class _ExerciceFiveState extends State<ExerciceFive> {
  Map<String, bool> scoreMap = {};

  Map<String, List<String>> cardsMap = {
    'assets/doorCard-final.png': ['start', 'end'],
    'assets/datesCard-final.png': [],
    'assets/breadCard-final.png': ['middle'],
    'assets/duckCard-final.png': ['start'],
    'assets/treeCard-final.png': [],
    'assets/tigerCard-final.png': [],
    'assets/rabbitCard-final.png': ['middleToEnd'],
  };

  Map<String, String> boxsMap = {
    'assets/baEnd2.png': 'end',
    'assets/baMiddleToEnd2.png': 'middleToEnd',
    'assets/baMiddle2.png': 'middle',
    'assets/baStart2.png': 'start',
  };
  int rightAnswersCount;

  @override
  void initState() {
    super.initState();
    setState(() {
      rightAnswersCount = fnRightAnswersCount();
    });
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
                children: cardsMap.keys.map((emoji) {
                  return Draggable<String>(
                    data: emoji,
                    child:
                        Emoji(emojiStr: (scoreMap[emoji] == true) ? '' : emoji),
                    feedback: Emoji(emojiStr: emoji),
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
        print(' will accept cardsMap[data] ' + cardsMap[data].toString());
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
          question: 'أضع كل كلمة و صورتها في الصندوق المناسب',
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
                fit: BoxFit.contain,
                width: screenSize.width / 7,
                height: screenSize.height / 2.2,
              )
            : Container());
  }
}
