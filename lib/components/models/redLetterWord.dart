 import 'package:flutter/material.dart';

class RedLetterWord extends StatelessWidget {
  final List<String> textList;
  final int pos;

  RedLetterWord({@required this.textList, @required this.pos});

  @override
  Widget build(BuildContext context) {
    // print(textList);
    // print(pos);
    var x = -1;
    return Center(
      child: new RichText(
        text: new TextSpan(
          children: textList.map((char) {
            x++;
            InlineSpan txt;
            // print('x=' + x.toString());
            x == pos
                ? txt = TextSpan(
                    text: char,
                    style: new TextStyle(
                        fontSize: 60.0,
                        color: Color.fromRGBO(194, 0, 0, 1),
                        fontWeight: FontWeight.bold))
                : txt = TextSpan(
                    text: char,
                    style: new TextStyle(
                        fontSize: 60.0,
                         color: Colors.black,
                        fontWeight: FontWeight.bold));
            return txt;
          }).toList(),
        ),
      ),
    );
  }
}

// char == textList[pos] ?
