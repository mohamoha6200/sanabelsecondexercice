import 'dart:async';
import 'package:audioplayers/audio_cache.dart';
import 'package:flame/flame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanabelsecondexercice/components/widgets/ResultSuccessQuestion.dart';
import 'package:sanabelsecondexercice/theme/perrine.dart';
import 'package:sanabelsecondexercice/theme/style.dart';

class FirstExercice extends StatefulWidget {
  final String fileName;
  const FirstExercice({this.fileName});

  @override
  _FirstExerciceState createState() => _FirstExerciceState();
}

class _FirstExerciceState extends State<FirstExercice> {
  AudioCache audioCache = AudioCache();

  Map<String, bool> scoreMap = {};
  bool show1 = false;
  int random = 1;
  String fileName;

  Map letterList = {
    'assets/alif-fatha.png': 'fatha',
    'assets/alif-thama.png': 'thama',
    'assets/alif-kasra.png': 'kasra',
  };


  @override
  void initState() {
    super.initState();
    Flame.bgm.initialize();


    setState(() {
      fileName = widget.fileName;
    });
  }

  Widget exView() {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          //margin: new EdgeInsets.only(bottom: globals.myheightScreen/15),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: letterList.keys
                  .map((emoji) => _buildDragTarget(emoji))
                  .toList()
              // ..shuffle(Random(random)),
              ),
        ),

 

        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: letterList.keys.map((emoji) {
              return Draggable<String>(
                data: emoji,
                child: Emoji(emojiStr: (scoreMap[emoji] == true) ? '' : emoji),
                feedback: Emoji(emojiStr: emoji),
                childWhenDragging: Container(
                  height: screenSize.height / 7,
                  // width: screenSize.width / 7,
                ),

                /*   onDragCompleted: (){
                  audioCache.play('error.mp3');
                },*/

                onDragEnd: (value) {
                  print('the is value ' + scoreMap[emoji].toString());

                  if (scoreMap[emoji] == null) {
                    Flame.audio.play('error.mp3');
                  }
                },
              );
            }).toList(),
          ),
        ),


      ],
    );
  }

  Widget _buildDragTarget(emoji) {
    Size screenSize = MediaQuery.of(context).size;

    return DragTarget<String>(
      builder: (BuildContext context, List<String> candidateData,
          List rejectedData) {
        print('creating target for--' + letterList[emoji].toString());

        if (scoreMap[emoji] == true) {
          return Stack(
            alignment: Alignment.center,
            children: <Widget>[
              // padding: const EdgeInsets.only(top: 20.0, right: 10, left: 10, bottom: 30),
              Container(
                // margin: new EdgeInsets.only(  right: 20 ,left: 50),
                width: screenSize.width / 6,
                alignment: Alignment.center,
                child: Image.asset('assets/balloonblueaccent.png'),
              ),

              Positioned(
                bottom: screenSize.height / 5,
                child: Container(
                  child: Image.asset(
                    emoji,
                  ),
                  alignment: Alignment.center,
                  //  color: Colors.white,

                  height: screenSize.height / 5,
                ),
              ),
            ],
          );
        } else {
          return Stack(
            alignment: Alignment.center,
            //letterList[emoji] == 'kasra'?  Alignment.bottomCenter : Alignment.topCenter,
            children: <Widget>[
              Container(
                // margin: new EdgeInsets.only(  right: 20 ,left: 50),
                width: screenSize.width / 6,
                alignment: Alignment.center,
                child: Image.asset('assets/balloonblueaccent.png'),
              ),
              Container(
                child: Text(
                  letterList[emoji],
                  style: TextStyle(color: Colors.transparent),
                ),
                alignment: Alignment.center,
                color: Colors.transparent,
                height: screenSize.height / 5,
              ),
            ],
          );
        }
      },
      onWillAccept: (data) {
        print(' will accept data ' + data);
        return data == emoji;
      },
      onAccept: (data) {
        setState(() {
          scoreMap[data] = true;
          if (scoreMap.length == 3) {

            showDialog(
                context: context,
                builder: (context) {
                  Future.delayed(Duration(seconds: 5), () {
                    Navigator.of(context).pop(true);
                  });
                  return Theme(
                    data: Theme.of(context)
                        .copyWith(dialogBackgroundColor: Colors.transparent),
                    child: ResultSucessQuestion(),
                  );
                });

            show1 = true;
          } else {
            Flame.audio.play('good.mp3');
          }
        });
        print('---ScoreLenght---');
        print(scoreMap.length);
      },
      onLeave: (data) {
        print('noooooo ' + data);
      },
    );
  }

  Widget childItem() {
    Size screenSize = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              show1
                  ? Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            // margin: new EdgeInsets.only(top: 20),

                            child: Icon(
                              Icons.arrow_back,
                              size: 30,
                              color: Colors.purple,
                            ),
                          ),
                          Container(
                            margin: new EdgeInsets.only(top: 10),
                            child: Text(
                              'الْتَمْرِيِنُ الْتَالِي',
                              style: mStyleNext,
                            ),
                          )
                        ],
                      ),
                    )
                  : Container(),
              InkWell(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Text(
                          'إِلَى الْحُرُوفْ',
                          style: mStyleNext,
                        ),
                      ),
                      Container(
                        // margin: new EdgeInsets.only(top: 20),

                        child: Icon(
                          Icons.home,
                          size: 30,
                          color: Colors.purple,
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          Row(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: new EdgeInsets.only(left: 20),
                child: Image.asset(
                  'assets/ecoute.png',
                  width: 50,
                ),
              ),
              Container(
                // margin: new EdgeInsets.only(top: 30,right: 20.0),
                alignment: Alignment.topRight,
                child: Text(
                  'أَسْتَمِعُ وَ أُرَتِّبُ الْحُرُوفَ مِنَ الْيَمِينْ إِلَى الْيَسَار',
                  style: mStyle1ex,
                ),
              ),
            ],
          ),
          Expanded(child: exView()),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundMainColor,
        //appBar: PerrineAppBar(height: 70, title: 'الحروف'),
        body: childItem());
  }
}

class Emoji extends StatelessWidget {
  final String emojiStr;

  Emoji({Key key, this.emojiStr}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: new EdgeInsets.only(top: screenSize.height / 20),
        child: Image.asset(
          emojiStr,

          //width: screenSize.width / 7,
          height: screenSize.height / 5,
        ),
      ),
    );
  }
}
