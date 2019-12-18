import 'package:flutter/material.dart';
import 'package:sanabelsecondexercice/theme/perrine.dart';

class ExQuestionBar extends StatelessWidget {
  final String kidPic = 'ecoute.png';
  final String question = 'أَرَسْمِ دائرة حول الحرف ';
  final String subQuestion ;
  final String bookPic = 'Logo-sanabel-Vec.png';

   ExQuestionBar({
    //  this.kidPic, this.question, this.subQuestion, this.bookPic
    @required this.subQuestion });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height*0.18,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Image.asset(
                  'assets/$bookPic',
                  width: 150,
                ),
              ),
              Container(
                child: Image.asset(
                  'assets/Logo-sanabel-Vec.png',
                  width: 150,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text(
                  subQuestion,
                  style: questionLetter,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Container(
                  child: Text(
                    question,
                    style: mStyle1ex,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  child: Image.asset(
                    'assets/ecoute.png',
                    width: 50,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
