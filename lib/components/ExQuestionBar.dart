import 'package:flutter/material.dart';
import 'package:sanabelsecondexercice/theme/perrine.dart';

class ExQuestionBar extends StatelessWidget {
  final String kidPic;
  final String question;
  final String subQuestion;
  final bool logos;
  final String bookPic = 'Logo-sanabel-Vec.png';

  ExQuestionBar(
      {@required this.kidPic,
      @required this.question,
      this.subQuestion,
      // this.bookPic,
      this.logos});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height * 0.15,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          logos == false
              ? Container()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: Image.asset(
                        'assets/$bookPic',
                        width: screenSize.width / 6.4,
                      ),
                    ),
                    Container(
                      child: Image.asset(
                        'assets/Logo-sanabel-Vec.png',
                        width: screenSize.width / 6.4,
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
                  ? Padding(
                      padding: EdgeInsets.only(
                        right: screenSize.width / 120,
                      ),
                      child: Container(
                        child: Text(
                          subQuestion,
                          style: questionLetter,
                        ),
                      ),
                    )
                  : Container(),
              Container(
                child: Text(
                  question,
                  style: TextStyle(
                      color: Color.fromRGBO(80, 47, 136, 1),
                      fontSize: screenSize.width/27,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                width: screenSize.width / 48,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: screenSize.width / 48),
                child: Container(
                  child: Image.asset(
                    'assets/$kidPic',
                    fit: BoxFit.fill,
                    width: screenSize.width / 8,
                    height: screenSize.height / 6.75,
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
