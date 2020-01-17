import 'dart:async';

import 'package:circular_splash_transition/circular_splash_transition.dart';
import 'package:flame/flame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sanabelsecondexercice/components/widgets/ResultSuccessQuestion.dart';

import 'package:sanabelsecondexercice/components/widgets/sanabelFrame.dart';
import 'package:sanabelsecondexercice/pages/Exercice1.dart';

import 'package:sanabelsecondexercice/pages/Exercice3.dart';
import 'package:sanabelsecondexercice/pages/Exercice4.dart';
import 'package:sanabelsecondexercice/pages/home.dart';
import 'package:sanabelsecondexercice/theme/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homeV2.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  CircularSplashController _controller = CircularSplashController(
    color: backgroundMainColor, //optional, default is White.
    duration: Duration(milliseconds: 400), //optional.
  );

  var twenty;
  Timer t2;
  String routeName;

  bool backgroundSound;

  @override
  void initState() {
    super.initState();
    print('should stop everything');
    Flame.bgm.initialize();
    gettingSettings();
  }

  gettingSettings() async {
    final prefs = await SharedPreferences.getInstance();
    // final myexercice =
    //     Provider.of<DrawerStateInfo>(context, listen: false).getCurrentDrawer;
    // prefs.getInt('currentExercice') ?? 0;
    setState(() {
      backgroundSound = prefs.getBool('backgroundSound') ?? true;
    }); 
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();

    t2.cancel();
  }

  Future<Object> push() async {
    Object object = await _controller.push(context, HomePageV2());
    return object;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return CircularSplash(
      controller: _controller,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              //   decoration: BoxDecoration(gradient: gradient4),
              child: Center(
                child: Container(
                  child: Image.asset(
                    'assets/basmala.png',
                    fit: BoxFit.fill,
                    width: screenSize.width / 4,
                  ),
                ),
              ),
            ),
            Container(
              //   decoration: BoxDecoration(gradient: gradient4),
              child: Center(
                child: Container(
                  child: Image.asset(
                    'assets/logomilieu.png',
                    fit: BoxFit.fill,
                    width: screenSize.width / 6,
                  ),
                ),
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      //   decoration: BoxDecoration(gradient: gradient4),
                      child: Center(
                        child: Container(
                          child: Image.asset(
                            'assets/bas0.png',
                            fit: BoxFit.fill,
                            width: screenSize.width / 6,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      //   decoration: BoxDecoration(gradient: gradient4),
                      child: Center(
                        child: Container(
                          child: Image.asset(
                            'assets/bas1.png',
                            fit: BoxFit.fill,
                            width: screenSize.width / 6,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      //   decoration: BoxDecoration(gradient: gradient4),
                      child: Center(
                        child: Container(
                          child: Image.asset(
                            'assets/bas2.png',
                            fit: BoxFit.fill,
                            width: screenSize.width / 6,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      //   decoration: BoxDecoration(gradient: gradient4),
                      child: Center(
                        child: Container(
                          child: Image.asset(
                            'assets/bas3.png',
                            fit: BoxFit.fill,
                            width: screenSize.width / 6,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: new EdgeInsets.only(top: 3),
                child: InkWell(
                    onTap: () {
                      print('should play funny');
                      if (backgroundSound == true) {
                        Flame.bgm.play('funny.mp3');
                      }
                      push();

                      //  Navigator.push(context, PageTransition(type: PageTransitionType.size, alignment: Alignment.bottomCenter, child: HomePage()));
                    },
                    child: Center(child: SanabelFrame(title: 'دُخُولْ'))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
