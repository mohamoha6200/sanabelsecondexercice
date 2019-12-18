import 'package:flutter/material.dart';
import 'package:sanabelsecondexercice/theme/perrine.dart';

class SanabelFrame extends StatelessWidget {
  final String title;

  const SanabelFrame({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: _buildFrameBasic(context),
    );
  }

  Widget _buildFrameBasic(context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      //  height: globals.myheightScreen / 10,
      width: screenSize.width / 4,
      decoration: BoxDecoration(
          // boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 9, offset: Offset(0.0, 7))],
          borderRadius: BorderRadius.circular(30),
          gradient: gradient2,
          border: Border.all(width: 5, color: Colors.white)),
      child: Text(
        title,
        style: mStyleEntry,
        textAlign: TextAlign.center,
      ),
    );
  }
}
