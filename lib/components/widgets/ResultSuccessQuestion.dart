import 'dart:core';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
    

class ResultSucessQuestion extends StatefulWidget {
  @override
  _ResultSucessQuestionState createState() => _ResultSucessQuestionState();
}

class _ResultSucessQuestionState extends State<ResultSucessQuestion> {
  AudioCache audioCache = AudioCache();
  @override
  void initState() {
    super.initState();

    audioCache.play('oueee.mp3', volume: 0.2);
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
