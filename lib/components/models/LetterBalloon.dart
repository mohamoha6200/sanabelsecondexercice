import 'package:flutter/material.dart';

class LettreBalloon {
 LettreBalloon({ @required this.letter,@required this.letterColor,@required this.balloonColor});

  final String letter ;
  final String letterColor ; 
  final String balloonColor ; 

  String getLetterColor (){
    return this.letterColor;
  }

}