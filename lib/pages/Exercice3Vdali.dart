// import 'dart:async';
// import 'dart:collection';
// import 'dart:math';
// import 'package:audioplayers/audio_cache.dart';
// import 'package:flame/flame.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';


// class ExerciceFive extends StatefulWidget {


//   @override
//   _ExerciceFiveState createState() => _ExerciceFiveState();
// }

// class _ExerciceFiveState extends State<ExerciceFive> {
//   AudioCache audioCache = AudioCache();

//   Map<Offset, bool> scoreMap = {};
//   bool show1 = false;
//   int random = 1;
//   String fileName;
//   var globals = Globals();


//   static final GlobalKey _cardKey0 = GlobalKey();

//   static final GlobalKey _cardKey1 = GlobalKey();
//   static final GlobalKey _cardKey2 = GlobalKey();

//   static final GlobalKey _cardKey3 = GlobalKey();

//   static final GlobalKey _cardKey4 = GlobalKey();

//   static final GlobalKey _cardKey5 = GlobalKey();


//   List<Offset> _truePointsLineOne = <Offset>[];
//   List<Offset> _truePointsLineTwo = <Offset>[];
//   List<Offset> _truePointsLineThree = <Offset>[];

//   List<GlobalKey> _imagesKey = <GlobalKey>[
//     _cardKey0,
//     _cardKey1,
//     _cardKey2,

//   ];

//   List<GlobalKey> _lettresKey = <GlobalKey>[
//     _cardKey3,
//     _cardKey4,
//     _cardKey5,

//   ];
//   bool lineOneFinish = false;
//   bool linetwoFinish = false;
//   bool linethreeFinish = false;


//   Size cardSize;
//   Offset cardPosition;
//    Map letterList = {

//     'assets/porte.png': 'assets/birkar.png',
//     'assets/oiseau.png': 'assets/bab.png',
//     'assets/compa.png': 'assets/bolbol.png',

//   };
//   List<Offset> _points = <Offset>[];




//   @override
//   void initState() {
//     super.initState();

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       getSizeAndPosition();
//       getSizeAndPositionImages();
//     });
//     setState(() {
//       print('init');
//     });

//   }
//   getSizeAndPosition() {
//     for (var index = 0; index < 3; index++) {
//       RenderBox cardBox = lettresKey[index].currentContext.findRenderObject();
//       cardSize = _cardBox.size;
//       cardPosition = _cardBox.localToGlobal(Offset.zero);
//     }
//   }
//   getSizeAndPositionImages() {
//     for (var index = 0; index < 3; index++) {
//       RenderBox cardBox = imagesKey[index].currentContext.findRenderObject();
//       cardSize = _cardBox.size;
//       cardPosition = _cardBox.localToGlobal(Offset.zero);
//     }
//   }


//   bool pointInOffset(Offset point, Offset cardOffset) {
//     Size screenSize = MediaQuery.of(context).size;
//     print(screenSize.width/5);


//     // print(point);
//     if ((point.dx == cardOffset.dx)) {
//       // print('true in pointInOffset');
//       return true;
//     } else {
//       // print('false in pointInOffset');
//       return false;
//     }
//   }


//   Widget exView(){
//     Size screenSize = MediaQuery.of(context).size;


//     SizeConfig().init(context);

//    return
//         GestureDetector(


//           onPanUpdate: (DragUpdateDetails details) {
//             setState(() {

//               RenderBox referenceBox = context.findRenderObject();
//               Offset _localPosition =
//               referenceBox.globalToLocal(details.globalPosition);


//             _points = new List.from(_points)..add(_localPosition);

//               // print('_localPosition: ' + _localPosition.toString());

//              // print('_points: ' + _points.length.toString());
//           //  print('_points: ' + _points.toString());
//             });
//           },
//           onPanEnd: (DragEndDetails details) {
//             //_points.add(null);
//            // print('result end drag' + details.velocity.toString());

//             print('widh screen is ' + screenSize.width.toString());
//             print('height screen is ' + screenSize.height.toString());
//             print('safe widh screen is ' + SizeConfig.safeBlockHorizontal.toString());
//             print('safe height screen is ' + SizeConfig.safeBlockVertical.toString());


//             if (_points.isNotEmpty) {
//               if (_points.first.dx >= screenSize.width / 1.41 &&
//                   _points.first.dx <= screenSize.width / 1.04 &&
//                   _points.first.dy >= screenSize.height / 1.6 &&
//                   _points.first.dy <= screenSize.height / 1.077 &&
//                   _points.last.dx >= screenSize.width / 18.46 &&
//                   _points.last.dx <= screenSize.width / 3.58 &&
//                   _points.last.dy >= screenSize.height / 3.82 &&
//                   _points.last.dy <= screenSize.height / 1.78) {
//                 if (lineOneFinish) {
//                   setState(() {
//                     _points = [];
//                   });

//                   // _points.clear();

//                 } else {
//                   setState(() {
//                     scoreMap[_points.first] = true;
//                     lineOneFinish = true;
//                   });


//                   if (scoreMap.length == 3) {
//                     showDialog(
//                         context: context,
//                         builder: (context) {
//                           Future.delayed(Duration(seconds: 5), () {
//                             Navigator.of(context).pop(true);
//                           });
//                           return Theme(
//                             data: Theme.of(context).copyWith(
//                                 dialogBackgroundColor: Colors.transparent),
//                             child: ResultSucessQuestion(),
//                           );
//                         });


//                     setState(() {
//                       truePointsLineOne = points;
//                       _points = [];
//                     });
//                   } else {
//                     setState(() {
//                       truePointsLineOne += points;
//                       _points = [];
//                     });


//                     Flame.audio.play('good.mp3');
//                   }
//                 }
//               } else if (_points.first.dx >= screenSize.width / 2.47 &&
//                   _points.first.dx <= screenSize.width / 1.68 &&
//                   _points.first.dy >= screenSize.height / 1.60 &&
//                   _points.first.dy <= screenSize.height / 1.10 &&
//                   _points.last.dx >= screenSize.width / 1.35 &&
//                   _points.last.dx <= screenSize.width / 1.07 &&
//                   _points.last.dy >= screenSize.height / 3.56 &&
//                   _points.last.dy <= screenSize.height / 1.78) {
//                 if (linetwoFinish) {
//                   setState(() {
//                     _points = [];
//                   });
//                 } else {
//                   setState(() {
//                     scoreMap[_points.first] = true;
//                     linetwoFinish = true;
//                   });


//                   if (scoreMap.length == 3) {
//                     showDialog(
//                         context: context,
//                         builder: (context) {
//                           Future.delayed(Duration(seconds: 5), () {
//                             Navigator.of(context).pop(true);
//                           });
//                           return Theme(
//                             data: Theme.of(context).copyWith(
//                                 dialogBackgroundColor: Colors.transparent),
//                             child: ResultSucessQuestion(),
//                           );
//                         });


//                     setState(() {
//                       truePointsLineTwo = points;
//                       _points = [];
//                     });
//                   } else {
//                     setState(() {
//                       truePointsLineTwo = points;
//                       _points = [];
//                     });


//                     Flame.audio.play('good.mp3');
//                   }
//                 }
//               } else if (_points.first.dx >= screenSize.width / 14.06 &&
//                   _points.first.dx <= screenSize.width / 3.81 &&
//                   _points.first.dy >= screenSize.height / 1.6 &&
//                   _points.first.dy <= screenSize.height / 1.10 &&
//                   _points.last.dx >= screenSize.width / 2.47 &&
//                   _points.last.dx <= screenSize.width / 1.68 &&
//                   _points.last.dy >= screenSize.height / 3.56 &&
//                   _points.last.dy <= screenSize.height / 1.78) {
//                 if (linethreeFinish) {
//                   setState(() {
//                     _points = [];
//                   });
//                 } else {
//                   setState(() {
//                     scoreMap[_points.first] = true;
//                     linethreeFinish = true;
//                   });


//                   if (scoreMap.length == 3) {
//                     showDialog(
//                         context: context,
//                         builder: (context) {
//                           Future.delayed(Duration(seconds: 5), () {
//                             Navigator.of(context).pop(true);
//                           });
//                           return Theme(
//                             data: Theme.of(context).copyWith(
//                                 dialogBackgroundColor: Colors.transparent),
//                             child: ResultSucessQuestion(),
//                           );
//                         });


//                     setState(() {
//                       truePointsLineThree = points;
//                       _points = [];
//                     });
//                   } else {
//                     setState(() {
//                       truePointsLineThree = points;
//                       _points = [];
//                     });


//                     Flame.audio.play('good.mp3');
//                   }
//                 }
//               } else {
//                 print('nooooooooooooo');
//                 Flame.audio.play('error.mp3');

//                 setState(() {
//                   _points = [];
//                 });
//               }
//             }



//           },

//           child: CustomPaint(
//             painter: new Signature(points: points, lineOne: truePointsLineOne , lineTwo: truePointsLineTwo , lineThree: truePointsLineThree),
//            // size: Size(300, 300),
//             child: Directionality(
//               textDirection: TextDirection.rtl,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min ,
//                 children: [

//                   childItem(),

//                   Container(
//                     //margin: new EdgeInsets.only(bottom: globals.myheightScreen/15),
//                     child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children:List.generate(3, (index) {



//                           return GestureDetector(
//                             onTap: (){
//                               RenderBox renderBoxRed = _imagesKey[index].currentContext.findRenderObject();

//                                 var  sizeRed = renderBoxRed.size;
//                                 var position = renderBoxRed.localToGlobal(Offset.zero);

//                                 print('sizzzzzzze'+ sizeRed.toString());
//                                 print('position'+ position.toString());



//                             },
//                             child: Container(
//                               // margin: new EdgeInsets.only(  right: 20 ,left: 50),
//                               key: _imagesKey[index],
//                               height: SizeConfig.safeBlockVertical * 30,
//                               alignment: Alignment.center,
//                               child: Image.asset(letterList.keys.toList()[index] , fit: BoxFit.fill,),

//                             ),
//                           );


//                         })
//                       // ..shuffle(Random(random)),
//                     ),
//                   ),


//                   Container(
//                     margin: new EdgeInsets.only(top: globals.myheightScreen/15),
//                     child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children:List.generate(3, (index) {



//                           return GestureDetector(
//                             onTap: (){

//                               RenderBox renderBoxRed = _lettresKey[index].currentContext.findRenderObject();

//                              var  sizeRed = renderBoxRed.size;
//                               var position = renderBoxRed.localToGlobal(Offset.zero);

//                               print('sizzzzzzze'+ sizeRed.toString());
//                               print('position'+ position.toString());
//                             },

//                             child: Container(
//                               // margin: new EdgeInsets.only(  right: 20 ,left: 50),
//                               key: _lettresKey[index],
//                               height: SizeConfig.safeBlockVertical * 30,
//                               alignment: Alignment.center,
//                               child: Image.asset(letterList.values.toList()[index] , fit: BoxFit.fill,),

//                             ),
//                           );


//                         })
//                       // ..shuffle(Random(random)),
//                     ),
//                   ),




//                 ],
//               ),
//             ),
//           ),
//         );



//   }










//   Widget childItem() {
//     Size screenSize = MediaQuery.of(context).size;
//     SizeConfig().init(context);

//     return  Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[

//           Row(

//             // crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               show1 ?  Expanded(
//                 child: Row(

//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   //mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Container(
//                       // margin: new EdgeInsets.only(top: 20),

//                       child: Icon(
//                         Icons.arrow_back ,

//                         size: SizeConfig.safeBlockVertical * 9,

//                         color: Colors.purple,),

//                     ),



//                     InkWell(
//                         child: Container(
//                           margin: new EdgeInsets.only(top: 10),


//                           child: Text('الْتَمْرِيِنُ الْتَالِي' , style:mStyleNext, ),

//                         ),
//                         onTap: (){


//                             Navigator.push(context,
//                                 MaterialPageRoute(builder: (BuildContext context) {
//                                   return SecondExerciceAlif();
//                                 }));



//                         }
//                     )


//                   ],
//                 ),
//               ) : Container(),



//               InkWell(
//                 child: Container(
//                   alignment: Alignment.centerLeft,
//                   child: Row(

//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     //mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[

//                       Container(

//                         child: Text('إِلَى الْحُرُوفْ' , style:mStyleNext, ),

//                       ) ,
//                       Container(
//                         // margin: new EdgeInsets.only(top: 20),

//                         child: Icon(
//                           Icons.home , size: SizeConfig.safeBlockVertical * 9, color: Colors.purple,),

//                       ),



//                     ],
//                   ),
//                 ),

//                 onTap: (){

//                   Navigator.pop(context);

//                 },

//               ),


//             ],),


//           Container(
//             margin: new EdgeInsets.only(right: SizeConfig.safeBlockHorizontal * 1.5, bottom: SizeConfig.safeBlockHorizontal),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: <Widget>[

//                 Container(
//                   margin: new EdgeInsets.only( left : SizeConfig.safeBlockHorizontal * 1.5),

//                   child: Image.asset('assets/ecoute.png' , height: SizeConfig.safeBlockVertical * 15,fit: BoxFit.fill,),

//                 ),


//                 Container(
//                   // margin: new EdgeInsets.only(top: 30,right: 20.0),
//                   alignment: Alignment.topRight,
//                   child: Text('أَرْبِطُ الْكَلِمَةَ بِالْصُّورَةِ الْمُنَاسِبَةِ', style: TextStyle(
//                     fontSize: SizeConfig.safeBlockVertical * 9,
//                   ),),

//                 ),


//               ],
//             ),
//           ),






//         ],
//       );


//   }



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: backgroundMainColor,
//         /*appBar: PreferredSize(
//             preferredSize: Size.fromHeight(globals.myheightScreen / 7), child: new SanabelAppBar(title: '',)),
//         //appBar: SanabelAppBar(height: globals.myheightScreen / 7, title: 'الْحُرُوفُ الْعَرَبِيَّةُ'),
//         drawer: BasicDrawer(),*/
//         //appBar: PerrineAppBar(height: 70, title: 'الحروف'),
//         body:  exView()


//     );
//   }
// }
