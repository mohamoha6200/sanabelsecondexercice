import 'dart:async';

import 'package:circular_splash_transition/circular_splash_transition.dart';
import 'package:flame/flame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sanabelsecondexercice/components/widgets/DogSlider.dart/demo.dart';

import 'package:sanabelsecondexercice/components/widgets/sanabelFrame.dart';
import 'package:sanabelsecondexercice/pages/bookScreen.dart';

import 'package:sanabelsecondexercice/theme/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homeV2.dart';

class Splash2 extends StatefulWidget {
  @override
  _Splash2State createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {
  CircularSplashController _controller = CircularSplashController(
    color: backgroundMainColor, //optional, default is White.
    duration: Duration(milliseconds: 400), //optional.
  );

  @override
  void initState() {
    super.initState();
  }

  Future<Object> push() async {
    Object object = await _controller.push(context, HomePageV2());
    return object;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return CircularSplash(
      controller: _controller,
      child: Scaffold(
        body: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/classroom3.png"),
              fit: BoxFit.fill,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.25), BlendMode.dstATop),
            ),
          ),
          child: Container(
            width: screenSize.width,
            height: screenSize.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/classroom5.png"),
                fit: BoxFit.fill,
                // colorFilter: new ColorFilter.mode(
                //     Colors.black.withOpacity(0.25), BlendMode.dstATop),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: screenSize.height / 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    width: screenSize.width / 2,
                    height: screenSize.height / 3.8,
                    child: Image.asset(
                      'assets/bessmellah.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    width: screenSize.width / 2,
                    height: screenSize.height / 3.9,
                    child: Image.asset(
                      'assets/logontext.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      push();
                    },
                    child: Container(
                      width: screenSize.width / 2,
                      height: screenSize.height / 3.5,
                      child: Image.asset(
                        'assets/hellobutton.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
