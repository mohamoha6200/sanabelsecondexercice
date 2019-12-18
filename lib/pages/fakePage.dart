import 'dart:async';

import 'package:flame/flame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FakePage extends StatefulWidget {
  @override
  _FakePageState createState() => _FakePageState();
}

class _FakePageState extends State<FakePage> {
  var twenty;
  Timer t2;
  String routeName;
  bool playing = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                'assets/basmala.png',
                fit: BoxFit.fill,
                width: screenSize.width / 4,
              ),
            ),
            FloatingActionButton(
              child: new Icon(
                playing == true ?Icons.pause:Icons.play_arrow),
              onPressed: () => {
                if (playing == true)
                  {
                    print('should pause'),
                    Flame.bgm.pause(),
                    setState(() {
                      playing = false;
                    }),
                  }
                else
                  {
                    print('should resume'),
                    Flame.bgm.resume(),
                    setState(() {
                      playing = true;
                    }),
                  }
              },
            ),
          ],
        ),
      ),
    );
  }
}
