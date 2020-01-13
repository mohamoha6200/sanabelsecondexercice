import 'package:flutter/material.dart';
import 'package:sanabelsecondexercice/theme/style.dart';

import '../ExQuestionBar.dart';

Widget exAppBar(screenSize, _scaffoldKey, ExQuestionBar exQuestionBar) {
  return PreferredSize(
    preferredSize: Size.fromHeight(screenSize.height / 8),
    child: AppBar( 
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      leading: Container(
         alignment: Alignment.center,
        child: InkWell(
          child: Icon(
            Icons.menu,
            color: greenColor,
            size: 35,
          ),
          onTap: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
      ),
      flexibleSpace: exQuestionBar,
    ),
  );
}