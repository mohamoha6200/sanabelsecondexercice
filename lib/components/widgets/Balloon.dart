import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Balloon extends StatelessWidget {
  final String pic;
  final String letter;

  Balloon({@required this.pic, @required this.letter});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width / 6,
      height: screenSize.width / 6,
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage('assets/$pic'),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  letter,
                  style: TextStyle(fontSize: 32, color: Colors.red),
                ),
              ],
            ),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
