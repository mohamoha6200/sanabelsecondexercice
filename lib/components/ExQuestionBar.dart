import 'package:flutter/material.dart';
import 'package:sanabelsecondexercice/theme/perrine.dart';

class ExQuestionBar extends StatelessWidget {
  final String kidPic;
  final String question;
  // = 'أَرَسْمِ دائرة حول الحرف ';
  final String subQuestion;
  final String bookPic = 'Logo-sanabel-Vec.png';

  ExQuestionBar({
    @required this.kidPic,
    @required this.question,
    this.subQuestion,
    //this.bookPic,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height * 0.18,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              this.subQuestion != null
                  ? Container(
                      child: Text(
                        subQuestion,
                        style: questionLetter,
                      ),
                    )
                  : Container(),
              Container(
                child: Text(
                  question,
                  style: mStyle1ex,
                ),
              ),
                  SizedBox(width: 20,),

              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                  child: Image.asset(
                    'assets/$kidPic',
                    fit: BoxFit.fill,
                    width: 80,
                    height: 80,
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
