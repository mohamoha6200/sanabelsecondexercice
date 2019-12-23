import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Balloon extends StatelessWidget {
  final String letter;
  final String letterColor;
  final String balloonColor;

  Balloon(
      {@required this.letter,
      @required this.letterColor,
      @required this.balloonColor});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var stringColor = this.letterColor;
    Color color;
    switch (stringColor) {
      case 'red':
        {
          color = Colors.red;
        }
        break;
      case 'orange':
        {
          color = Colors.orange;
        }
        break;
      case 'white':
        {
          color = Colors.white;
        }
        break;
      case 'yellow':
        {
          color = Colors.yellow;
        }
        break;

      default:
        {
          color = Colors.white;
        }
    }
    return Container(
      width: screenSize.width / 10,
      height: screenSize.width / 10,
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage('assets/balloon$balloonColor.png'),
          fit: BoxFit.contain,
        ),
      ),
      child: letter == 'أ'
          ? Center(
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    letter,
                    style: TextStyle(
                        fontSize: screenSize.width / 10,
                        color: color,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: screenSize.width / 40,
                  )
                ],
              ),
            )
          : (letter == 'ح' ||
                  letter == 'خ' ||
                  letter == 'س' ||
                  letter == 'ش' ||
                  letter == 'ص' ||
                  letter == 'غ' ||
                  letter == 'ع' ||
                  letter == 'ق' ||
                  letter == 'م' ||
                  letter == 'و' ||
                  letter == 'ي')
              ? Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: <Widget>[
                    Positioned(
                      top: -screenSize.width / 123,
                      child: Text(
                        letter,
                        style: TextStyle(
                            fontSize: screenSize.width / 10,
                            color: color,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              : Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      letter,
                      style: TextStyle(
                          fontSize: screenSize.width / 10,
                          color: color,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
    );
  }
}
