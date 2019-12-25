import 'package:flutter/material.dart';

class LetterOrText extends StatelessWidget {
  final List<String> textList;
  final int pos;

  LetterOrText({@required this.textList, @required this.pos});

  @override
  Widget build(BuildContext context) {
    // print(textList);
    // print(pos);
    var x = -1;
    return Container(
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
                        color: Colors.red,
                        fontWeight: FontWeight.bold))
                : txt = TextSpan(
                    text: char,
                    style: new TextStyle(
                        fontSize: 00.0,
                        // color: Colors.red,
                        fontWeight: FontWeight.bold));
            return txt;
          }).toList(),
        ),
      ),
    );
  }
}

// char == textList[pos] ?
