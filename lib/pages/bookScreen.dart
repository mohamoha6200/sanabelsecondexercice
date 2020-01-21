import 'dart:async';

import 'package:circular_splash_transition/circular_splash_transition.dart';
import 'package:flame/flame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:sanabelsecondexercice/components/widgets/sanabelFrame.dart';

import 'package:sanabelsecondexercice/theme/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homeV2.dart';

class BookScreen extends StatefulWidget {
  @override
  _BookScreenState createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: screenSize.height / 4.2),
                child: Stack(
                  overflow: Overflow.visible,
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Positioned(
                      top: -screenSize.height / 6.5,
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: screenSize.width / 8.8,
                            height: screenSize.height / 4.6,
                            child: Image.asset(
                              'assets/whiteBook.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          Container(
                            width: screenSize.width / 8.8,
                            height: screenSize.height / 4.6,
                            child: Image.asset(
                              'assets/whiteBook.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                           GestureDetector(
                             onTap: () {
                               print('should be clicked');
                            },
                             child: Column(
                               children: <Widget>[
                                 Image.asset(
                                   'assets/actualBook.png',
                                   fit: BoxFit.contain,
                                   width: screenSize.width / 8.8,
                                   height: screenSize.height / 4.6,
                                 ),
                               ],
                             ),
                           ),
                          Container(
                            width: screenSize.width / 8.8,
                            height: screenSize.height / 4.6,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/actualBook.png'),
                              ),
                            ),
                            child: new FlatButton(
                                padding: EdgeInsets.all(0.0),
                                onPressed: () {
                                  print('should be clicked');
                                },
                                child: null),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Image.asset(
                        'assets/marmerFinal2.png',
                        fit: BoxFit.fitWidth,
                        width: screenSize.width / 2,
                        height: screenSize.height / 4,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenSize.height / 6.9),
                child: Stack(
                  overflow: Overflow.visible,
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Positioned(
                      top: -screenSize.height / 6.5,
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: screenSize.width / 8.8,
                            height: screenSize.height / 4.6,
                            child: Image.asset(
                              'assets/whiteBook.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          Container(
                            width: screenSize.width / 8.8,
                            height: screenSize.height / 4.6,
                            child: Image.asset(
                              'assets/whiteBook.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          Container(
                            width: screenSize.width / 8.8,
                            height: screenSize.height / 4.6,
                            child: Image.asset(
                              'assets/whiteBook.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Image.asset(
                        'assets/marmerFinal2.png',
                        fit: BoxFit.fitWidth,
                        width: screenSize.width / 2,
                        height: screenSize.height / 4,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    child: Image.asset(
                      'assets/logoo3.png',
                      fit: BoxFit.fill,
                      width: screenSize.width / 6,
                    ),
                  ),
                  Container(
                    child: Image.asset(
                      'assets/logoo2.png',
                      fit: BoxFit.fill,
                      width: screenSize.width / 6,
                    ),
                  ),
                  Container(
                    child: Image.asset(
                      'assets/logoo1.png',
                      fit: BoxFit.fill,
                      width: screenSize.width / 11,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
