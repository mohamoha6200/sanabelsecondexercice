import 'package:flutter/material.dart';
import 'package:sanabelsecondexercice/theme/perrine.dart';

class PerrineAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String title;
  final bool backPage;
  final bool noSettings;

  const PerrineAppBar(
      {Key key,
      @required this.height,
      @required this.title,
      this.backPage,
      this.noSettings})
      : super(key: key);

  _getBackButton(context) {
    if (backPage == true) {
      return InkWell(
        child: Container(
          margin: EdgeInsets.only(left: 10, top: 15, right: 10),
          child: Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: 25.0,
          ),
        ),
        onTap: () {
          /* Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context) {
              return backPage;
            }));*/

          Navigator.pop(context);
        },
      );
    } else {
      return Container();
    }
  }

  _rightImage(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Row(
      children: <Widget>[
        
      ],
    );
  }

  

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return new Stack(children: <Widget>[
      Positioned(
        child: Container(
          color: Colors.transparent,
          width: size.width,
          height: height,
          child: Row(
            // mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // _getBackButton(context),
             // _rightImage(context),

              Container(
                child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      title,
                      style: styleAppBarGreen,
                    )),
              ),
              SizedBox(width: 50),
              Container(
              child: Image.asset(
                'assets/ecoute.png',
                width: 50,
              ),
                ),
            ],
          ),
        ),
      ),
    ]);
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
