import 'dart:async';

import 'package:flame/flame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sanabelsecondexercice/components/widgets/sanabelFrame.dart';

import 'package:sanabelsecondexercice/pages/Exercice2/Exercice2.dart';
import 'package:sanabelsecondexercice/pages/Exercice3.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var twenty;
  Timer t2;
  String routeName;

  @override
  void initState() {
    super.initState();
    print('should stop everything');
    Flame.bgm.initialize();
    Flame.bgm.pause();
  }

  @override
  void dispose() {
    super.dispose();
    t2.cancel();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
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
                    // Flame.bgm.play('funny.mp3');

                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return ExerciceTwo();
                    }));
                  },
                  child: Center(child: SanabelFrame(title: 'دُخُولْ'))),
            ),
          )
        ],
      ),
    );
  }
}
