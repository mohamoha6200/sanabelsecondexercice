import 'dart:core';
import 'package:flame/flame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanabelsecondexercice/theme/perrine.dart';

class ResultSucessQuestion extends StatefulWidget {
  @override
  _ResultSucessQuestionState createState() => _ResultSucessQuestionState();
}

class _ResultSucessQuestionState extends State<ResultSucessQuestion> {
  @override
  void initState() {
    super.initState();
    // Flame.audio.play('goodComplete.mp3');

    // Flame.audio.play('oueee.mp3');
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Material(
      type: MaterialType.transparency,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Dialog(
            child: Container(
              child: Image.asset(
                'assets/goodg.png',
                width: screenSize.width / 4,
                height: screenSize.height * 0.75,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    margin: new EdgeInsets.symmetric(
                        horizontal: screenSize.width / 80),
                    child: Icon(
                      Icons.home,
                      size: screenSize.width / 32,
                      color: Colors.purple,
                    ),
                  ),
                  Container(
                    child: Text(
                      'إِلَى الْحُرُوفْ',
                      style: mStyleNext,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    margin: new EdgeInsets.symmetric(
                        horizontal: screenSize.width / 80),
                    child: Icon(
                      Icons.autorenew,
                      size: screenSize.width / 32,
                      color: Colors.purple,
                    ),
                  ),
                  Container(
                    child: Text(
                      'أعيد التمرين',
                      style: mStyleNext,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    child: Text(
                      'الْتَمْرِيِنُ التالي',
                      style: mStyleNext,
                    ),
                  ),
                  Container(
                    margin: new EdgeInsets.symmetric(
                        horizontal: screenSize.width / 80),
                    child: Icon(
                      Icons.forward,
                      size: screenSize.width / 32,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
