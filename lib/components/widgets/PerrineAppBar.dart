import 'package:flutter/material.dart';
import 'package:sanabelsecondexercice/theme/perrine.dart';

class PerrineAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String title;
  final bool menuIcon;
  final bool noSettings;
  final Function menuTap ;

  const PerrineAppBar(
      {Key key,
      @required this.height,
      @required this.title,
      this.menuIcon,
      this.noSettings,
      this.menuTap
      })
      : super(key: key);

  _getBackButton(context) {
    if (menuIcon == true) {
      return InkWell(
        child: Container(
          margin: EdgeInsets.only(left: 10, top: 15, right: 10),
          child: Icon(
            Icons.menu,
            color: Colors.green,
            size: 40.0,
          ),
        ), 
        onTap: () {

          
          /* Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context) {
              return backPage;
            }));*/

         // Navigator.pop(context);
        },
      );
    } else {
      return Container();
    }
  }

  _rightImage(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Row(
      children: <Widget>[],
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return new Stack(children: <Widget>[
      Positioned(
        child: Container(
            alignment: Alignment.bottomCenter,
            child: Text(
              title,
              style: styleAppBarGreen,
            )),
      ),
      Positioned(
        child: _getBackButton(context),
      )
    ]);
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
//  _getBackButton(context),
// _rightImage(context),
// SizedBox(width: 50),
// Container(
// child: Image.asset(
//   'assets/ecoute.png',
//   width: 50,
// ),
//   ),
