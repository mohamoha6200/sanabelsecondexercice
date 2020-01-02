import 'package:flutter/material.dart';
import 'package:sanabelsecondexercice/theme/perrine.dart';

class SanabelAppBar extends StatelessWidget {
  final String title;
  SanabelAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      // leading: new Icon(Icons.menu),
      // automaticallyImplyLeading: true,

      iconTheme: IconThemeData(color: mainColorText, size: 40),
      flexibleSpace: Center(
        child: new Text(
          title,
          style: styleAppBarGreen,
        ),
      ),
    );
  }
}
