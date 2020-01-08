import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sanabelsecondexercice/pages/Exercice3.dart';
import 'package:sanabelsecondexercice/pages/Exercice4v2.dart';
import 'package:sanabelsecondexercice/pages/Exercice5.dart';
import 'package:sanabelsecondexercice/pages/Exercice8.dart';
import 'package:sanabelsecondexercice/pages/Exercice9-4b.dart';
import 'package:sanabelsecondexercice/pages/ExerciceSeven.dart';
import 'package:sanabelsecondexercice/pages/Splash.dart';
import 'package:sanabelsecondexercice/pages/home.dart';

final RouteObserver<PageRoute> routeObserver = new RouteObserver<PageRoute>();

void main() async {
  bool isInDebugMode = false;

  FlutterError.onError = (FlutterErrorDetails details) {
    if (isInDebugMode) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      Zone.current.handleUncaughtError(details.exception, details.stack);
    }
  };

  _setTargetPlatformForDesktop();

  return runApp(MyApp());
}

void _setTargetPlatformForDesktop() {
  TargetPlatform targetPlatform;
  if (Platform.isMacOS) {
    targetPlatform = TargetPlatform.iOS;
  } else if (Platform.isLinux || Platform.isWindows) {
    targetPlatform = TargetPlatform.android;
  }
  if (targetPlatform != null) {
    debugDefaultTargetPlatformOverride = targetPlatform;
  }
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    print('disposed');
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorObservers: <NavigatorObserver>[routeObserver],
        theme: ThemeData(primaryColor: Colors.black),
        // home: SplashScreen(),
        initialRoute: '/',
        routes: {
          '/': (BuildContext context) => SplashScreen(),
          'home': (BuildContext context) => HomePage(),
          'alif-ex1': (BuildContext context) => ExerciceFourV2(), // listen and drag
          'alif-ex2': (BuildContext context) => ExerciceEight(), // circles
          'alif-ex3': (BuildContext context) => ExerciceSeven(), // tap on card
          'ba-ex1': (BuildContext context) => ExerciceFourV2(),  // listen and drag
          'ba-ex2': (BuildContext context) => ExerciceThree(), // match right answer 
          'ba-ex3': (BuildContext context) => ExerciceFive(), // 7 cards and 4 boxes only Ba(), 
          'ba-ex4': (BuildContext context) => Exercice9(), // tap on letters
        });
  }
}
