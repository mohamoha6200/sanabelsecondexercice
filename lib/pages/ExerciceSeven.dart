import 'package:flame/flame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanabelsecondexercice/components/ExQuestionBar.dart';
import 'package:sanabelsecondexercice/components/widgets/ExerciceDrawer.dart';
import 'package:sanabelsecondexercice/components/widgets/ResultSuccessQuestion.dart';
import 'package:sanabelsecondexercice/theme/style.dart';

class ExerciceSeven extends StatefulWidget {
  @override
  _ExerciceSevenState createState() => _ExerciceSevenState();
}

class _ExerciceSevenState extends State<ExerciceSeven> {
  Map<String, bool> scoreMap = {};
  final String subQuestion = 'ـا,ا';

  Map<String, bool> answers = {
    'assets/lion-ex7.png': true,
    'assets/book-ex7.png': true,
    'assets/tree-ex7.png': false,
    'assets/blueberry-ex7.png': false,
    'assets/horse-ex7.png': true,
    'assets/rabbit-ex7.png': true,
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
    var cardsMapValues = answers.values.toList();
    for (var i = 0; i < cardsMapValues.length; i++) {
      if (cardsMapValues[i] == true) {
        x++;
      }
    }
    return x;
  }

  Widget childWidget() {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ExQuestionBar(
          subQuestion: subQuestion,
          question: 'أضغط على الصورة عندما أرى   ',
          kidPic: 'kids8.png',
          logos: false,
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: new GridView.count(
            shrinkWrap: true,
            childAspectRatio: 1.5,
            physics: ClampingScrollPhysics(),
            crossAxisCount: 3,
            children: answers.keys.map((key) {
              var value = answers[key];

              return new InkWell(
                  child: new Container(
                    // width: screenSize.width / 3,
                    // height: screenSize.height / 8,
                    child: new Image.asset(
                      scoreMap[key] == true ? 'assets/correctAnswer.png' : key,
                      fit: BoxFit.contain,
                    ),
                  ),
                  onTap: () {
                    if (value == true) {
                      setState(() {
                        scoreMap[key] = true;
                      });

                      if (scoreMap.length == rightAnswersCount) {
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
                                    dialogBackgroundColor: Colors.transparent),
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
                  });
            }).toList(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundMainColor,
      
      drawer: AppDrawer(),
      body: childWidget(),
    );
  }
}
