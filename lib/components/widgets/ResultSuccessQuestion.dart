import 'dart:core';
import 'package:flame/flame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultSucessQuestion extends StatefulWidget {
  @override
  _ResultSucessQuestionState createState() => _ResultSucessQuestionState();
}

class _ResultSucessQuestionState extends State<ResultSucessQuestion> {
  @override
  void initState() {
    super.initState();
    Flame.audio.play('goodComplete.mp3');

    Flame.audio.play('oueee.mp3');
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Material(
      type: MaterialType.transparency,
      child: Dialog(
        child: Container(
          child: Image.asset(
            'assets/goodg.png',
            width: screenSize.width / 4,
            height: screenSize.height,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
