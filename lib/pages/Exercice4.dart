import 'dart:async';
import 'package:flame/flame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanabelsecondexercice/components/ExQuestionBar.dart';
import 'package:sanabelsecondexercice/components/widgets/ResultSuccessQuestion.dart';
import 'package:sanabelsecondexercice/theme/style.dart';

class ExerciceFour extends StatefulWidget {
  final subQuestion;

  ExerciceFour({this.subQuestion});

  @override
  _ExerciceFourState createState() => _ExerciceFourState();
}

class _ExerciceFourState extends State<ExerciceFour> {
  var subQuestion;

  Map<String, bool> scoreMap = {};

  // Map letterList = letterListRed;
  Map letterList;
  static Map letterListRed = {
    // 'assets/ba-kasra.png': 'kasra',
    // 'assets/ba-thama.png': 'thama',
    // 'assets/ba-fatha.png': 'fatha',
  };
  static Map letterListGreen = {
    // 'assets/ba-fatha.png': 'fatha',
    // 'assets/ba-kasra.png': 'kasra',
    // 'assets/ba-thama.png': 'thama',
  };
  static Map letterListBlue = {
    // 'assets/ba-thama.png': 'thama',
    // 'assets/ba-fatha.png': 'fatha',
    // 'assets/ba-kasra.png': 'kasra',
  };

  Map<String, double> buttonList = {
    'Red': 0.5,
    'Green': 0.5,
    'Blue': 0.5,
  };

  Map<String, String> colorSoundMap = {
    // 'Red': 'babubi',
    // 'Green': 'bubiba',
    // 'Blue': 'bibabu',
  };

  Map<String, Map> letterListMapList = {
    // 'Red': letterListRed,
    // 'Green': letterListGreen,
    // 'Blue': letterListBlue
  };

  int selectedButtonIndex = -1;

  String subQuestionLatin;

  @override
  void initState() {
    super.initState();
    subQuestion = widget.subQuestion;
    initialiseSubQuestionLatin();
    colorSoundMap = fillColorSoundMap(subQuestion);
    letterListRed = fillLetterListRed(subQuestion);
    letterListGreen = fillLetterListGreen(subQuestion);
    letterListBlue = fillLetterListBlue(subQuestion);
    letterList = letterListRed;
    letterListMapList = fillLetterList();
  }

  fillLetterList() {
    return {
      'Red': letterListRed,
      'Green': letterListGreen,
      'Blue': letterListBlue
    };
  }

  initialiseSubQuestionLatin() {
    switch (subQuestion) {
      case 'أ':
        {
          setState(() {
            subQuestionLatin = 'alif';
          });
        }
        break;
      case 'ب':
        {
          setState(() {
            subQuestionLatin = 'ba';
          });
        }
        break;
      case 'ت':
        {
          setState(() {
            subQuestionLatin = 'te';
          });
        }
        break;
      case 'ث':
        {
          setState(() {
            subQuestionLatin = 'the';
          });
        }
        break;
      case 'ج':
        {
          setState(() {
            subQuestionLatin = 'ja';
          });
        }
        break;
      case 'ح':
        {
          setState(() {
            subQuestionLatin = '7a';
          });
        }
        break;
      case 'خ':
        {
          setState(() {
            subQuestionLatin = '5a';
          });
        }
        break;
      case 'د':
        {
          setState(() {
            subQuestionLatin = 'da';
          });
        }
        break;
      case 'ذ':
        {
          setState(() {
            subQuestionLatin = 'tha';
          });
        }
        break;
      case 'ر':
        {
          setState(() {
            subQuestionLatin = 'ra';
          });
        }
        break;
      case 'ز':
        {
          setState(() {
            subQuestionLatin = 'za';
          });
        }
        break;
      case 'س':
        {
          setState(() {
            subQuestionLatin = 'sa';
          });
        }
        break;
      case 'ش':
        {
          setState(() {
            subQuestionLatin = 'cha';
          });
        }
        break;
      case 'ص':
        {
          setState(() {
            subQuestionLatin = 'sad';
          });
        }
        break;
      case 'ض':
        {
          setState(() {
            subQuestionLatin = 'dhad';
          });
        }
        break;
      case 'ط':
        {
          setState(() {
            subQuestionLatin = 'ta';
          });
        }
        break;
      case 'ظ':
        {
          setState(() {
            subQuestionLatin = 'dha';
          });
        }
        break;
      case 'ع':
        {
          setState(() {
            subQuestionLatin = '3a';
          });
        }
        break;
      case 'غ':
        {
          setState(() {
            subQuestionLatin = '8a';
          });
        }
        break;
      case 'ف':
        {
          setState(() {
            subQuestionLatin = 'fa';
          });
        }
        break;
      case 'ق':
        {
          setState(() {
            subQuestionLatin = '9a';
          });
        }
        break;
      case 'ك':
        {
          setState(() {
            subQuestionLatin = 'ka';
          });
        }
        break;
      case 'ل':
        {
          setState(() {
            subQuestionLatin = 'la';
          });
        }
        break;
      case 'م':
        {
          setState(() {
            subQuestionLatin = 'ma';
          });
        }
        break;
      case 'ن':
        {
          setState(() {
            subQuestionLatin = 'na';
          });
        }
        break;
      case 'ه':
        {
          setState(() {
            subQuestionLatin = 'ha';
          });
        }
        break;
      case 'و':
        {
          setState(() {
            subQuestionLatin = 'wa';
          });
        }
        break;
      case 'ي':
        {
          setState(() {
            subQuestionLatin = 'ya';
          });
        }
        break;

      default:
        {
          setState(() {
            subQuestionLatin = 'ba';
          });
        }
    }
  }

  Map fillLetterListRed(subQuestion) {
    return {
      'assets/$subQuestionLatin-kasra.png': 'kasra',
      'assets/$subQuestionLatin-thama.png': 'thama',
      'assets/$subQuestionLatin-fatha.png': 'fatha',
    };
  }

  Map fillLetterListGreen(subQuestion) {
    return {
      'assets/$subQuestionLatin-fatha.png': 'fatha',
      'assets/$subQuestionLatin-kasra.png': 'kasra',
      'assets/$subQuestionLatin-thama.png': 'thama',
    };
  }

  Map fillLetterListBlue(subQuestion) {
    return {
      'assets/$subQuestionLatin-thama.png': 'thama',
      'assets/$subQuestionLatin-fatha.png': 'fatha',
      'assets/$subQuestionLatin-kasra.png': 'kasra',
    };
  }

  Map<String, String> fillColorSoundMap(subQuestion) {
    String soundRed;
    String soundGreen;
    String soundBlue;

    switch (subQuestion) {
      case 'أ':
        {
          soundRed = 'aauuii';
          soundGreen = 'uuiiaa';
          soundBlue = 'iiaauu';
        }
        break;
      case 'ب':
        {
          soundRed = 'babubi';
          soundGreen = 'bubiba';
          soundBlue = 'bibabu';
        }
        break;
      case 'ت':
        {
          soundRed = 'tetuti';
          soundGreen = 'tutite';
          soundBlue = 'titetu';
        }
        break;
      case 'ث':
        {
          soundRed = 'theathuthi';
          soundGreen = 'thuthithea';
          soundBlue = 'thitheathu';
        }
        break;
      case 'ج':
        {
          soundRed = 'jajuji';
          soundGreen = 'jujija';
          soundBlue = 'jijaju';
        }
        break;
      case 'ح':
        {
          soundRed = '7a7u7i';
          soundGreen = '7u7i7a';
          soundBlue = '7i7a7u';
        }
        break;
      case 'خ':
        {
          soundRed = '5a5u5i';
          soundGreen = '5u5i5a';
          soundBlue = '5i5a5u';
        }
        break;
      case 'د':
        {
          soundRed = 'dadudi';
          soundGreen = 'dudida';
          soundBlue = 'didadu';
        }
        break;
      case 'ذ':
        {
          soundRed = 'thathuthi';
          soundGreen = 'thuthitha';
          soundBlue = 'thithathu';
        }
        break;
      case 'ر':
        {
          soundRed = 'raruri';
          soundGreen = 'rurira';
          soundBlue = 'riraru';
        }
        break;
      case 'ز':
        {
          soundRed = 'zazuzi';
          soundGreen = 'zuziza';
          soundBlue = 'zizazu';
        }
        break;
      case 'س':
        {
          soundRed = 'sasusi';
          soundGreen = 'susisa';
          soundBlue = 'sisasu';
        }
        break;
      case 'ش':
        {
          soundRed = 'chachuchi';
          soundGreen = 'chuchicha';
          soundBlue = 'chichachu';
        }
        break;
      case 'ص':
        {
          soundRed = 'sadasadusadi';
          soundGreen = 'sadusadisada';
          soundBlue = 'sadisadasadu';
        }
        break;
      case 'ض':
        {
          soundRed = 'dhadadhadudhadi';
          soundGreen = 'dhadudhadidhada';
          soundBlue = 'dhadidhadadhadu';
        }
        break;
      case 'ط':
        {
          soundRed = 'tatuti';
          soundGreen = 'tutita';
          soundBlue = 'titatu';
        }
        break;
      case 'ظ':
        {
          soundRed = 'dhadhudhi';
          soundGreen = 'dhudhidha';
          soundBlue = 'dhidhadhu';
        }
        break;
      case 'ع':
        {
          soundRed = '3a3u3i';
          soundGreen = '3u3i3a';
          soundBlue = '3i3a3u';
        }
        break;
      case 'غ':
        {
          soundRed = '8a8u8i';
          soundGreen = '8u8i8a';
          soundBlue = '8i8a8u';
        }
        break;
      case 'ف':
        {
          soundRed = 'fafufi';
          soundGreen = 'fufifa';
          soundBlue = 'fifafu';
        }
        break;
      case 'ق':
        {
          soundRed = '9a9u9i';
          soundGreen = '9u9i9a';
          soundBlue = '9i9a9u';
        }
        break;
      case 'ك':
        {
          soundRed = 'kakuki';
          soundGreen = 'kukika';
          soundBlue = 'kikaku';
        }
        break;
      case 'ل':
        {
          soundRed = 'laluli';
          soundGreen = 'lulila';
          soundBlue = 'lilalu';
        }
        break;
      case 'م':
        {
          soundRed = 'mamumi';
          soundGreen = 'mumima';
          soundBlue = 'mimamu';
        }
        break;
      case 'ن':
        {
          soundRed = 'nanuni';
          soundGreen = 'nunina';
          soundBlue = 'ninanu';
        }
        break;
      case 'ه':
        {
          soundRed = 'hahuhi';
          soundGreen = 'huhiha';
          soundBlue = 'hihahu';
        }
        break;
      case 'و':
        {
          soundRed = 'wawuwi';
          soundGreen = 'wuwiwa';
          soundBlue = 'wiwawu';
        }
        break;
      case 'ي':
        {
          soundRed = 'yayuyi';
          soundGreen = 'yuyiya';
          soundBlue = 'yiyayu';
        }
        break;
      default:
        {
          soundRed = 'babubi';
          soundGreen = 'bubiba';
          soundBlue = 'bibabu';
        }
    }
    return {
      'Red': soundRed,
      'Green': soundGreen,
      'Blue': soundBlue,
    };
  }

  Widget exView() {
    Size screenSize = MediaQuery.of(context).size;
    print(screenSize);
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: letterList.keys
                      .map((emoji) => _buildDragTarget(emoji))
                      .toList()
                  // ..shuffle(Random(random)),
                  ),
              (selectedButtonIndex != -1)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: letterListRed.keys.map((emoji) {
                        return Draggable<String>(
                          data: emoji,
                          child: Emoji(
                              emojiStr: (scoreMap[emoji] == true) ? '' : emoji),
                          feedback: Emoji(emojiStr: emoji),
                          childWhenDragging: Container(
                            height: screenSize.height / 5,
                            width: screenSize.width / 7,
                          ),
                          onDragEnd: (value) {
                            print('the is value ' + scoreMap[emoji].toString());

                            if ((scoreMap[emoji] == null) &&
                                (scoreMap.length != 0)) {
                              Flame.audio.play('error.mp3');
                            }
                          },
                        );
                      }).toList(),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: letterList.keys.map((emoji) {
                        return Container(child: Emoji(emojiStr: emoji));
                      }).toList(),
                    )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(3, (index) {
              var colors = buttonList.keys.toList();
              var opacities = buttonList.values.toList();
              var color = colors[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedButtonIndex = index;
                  });

                  for (var i = 0; i < colors.length; i++) {
                    if (i == selectedButtonIndex) {
                      var color = colors[i];
                      String audioFile = colorSoundMap[color];
                      Flame.audio.play('$audioFile.mp3');

                      setState(() {
                        buttonList[colors[i]] = 1;
                        letterList = letterListMapList[color];
                      });
                    } else {
                      setState(() {
                        buttonList[colors[i]] = 0.5;
                      });
                    }
                  }
                },
                child: Container(
                  child: Opacity(
                    opacity: opacities[index],
                    child: Image.asset(
                      'assets/soundBotton$color.png',
                      fit: BoxFit.fill,
                      width: screenSize.width / 6.4,
                      height: screenSize.height / 4.5,
                    ),
                  ),
                ),
              );
            }),
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
              Container(
                width: screenSize.width / 6,
                alignment: Alignment.center,
                child: Image.asset('assets/balloonpurpleaccent.png'),
              ),
              Positioned(
                bottom: screenSize.height / 5,
                child: Container(
                  child: Image.asset(
                    emoji,
                  ),
                  alignment: Alignment.center,
                  height: screenSize.height / 5,
                ),
              ),
            ],
          );
        } else {
          return Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                width: screenSize.width / 6,
                alignment: Alignment.center,
                child: Image.asset('assets/balloonpurpleaccent.png'),
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
            //  letterList = {
            //     'assets/transparent.png': 'kasra',
            //     'assets/aliff.png': 'thama',
            //    'assets/transparent.png': 'fatha',
            //   };
            // letterList=scoreMap;

            print('letterList = ');
            print(letterList);
            showDialog(
                context: context,
                builder: (context) {
                  Future.delayed(Duration(seconds: 3), () {
                    Navigator.of(context).pop(true);
                  });
                  return Theme(
                    data: Theme.of(context)
                        .copyWith(dialogBackgroundColor: Colors.transparent),
                    child: ResultSucessQuestion(),
                  );
                });
            Future.delayed(Duration(seconds: 5), () {
              setState(() {
                letterList = letterListRed;
                scoreMap = {};
              });
            });

            selectedButtonIndex = -1;
            var colors = buttonList.keys.toList();
            for (var i = 0; i < colors.length; i++) {
              setState(() {
                buttonList[colors[i]] = 0.5;
              });
            }
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ExQuestionBar(
          question: 'أستمع و أرتب الحروف من اليمين الى اليسار    ',
          kidPic: 'kids5.png',
          logos: false,
        ),
        Expanded(child: exView()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundMainColor,
      body: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/classroom.jpg"),
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.25), BlendMode.dstATop),
            ),
          ),
          child: childItem()),
    );
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
        child: emojiStr != ''
            ? Container(
                // margin: new EdgeInsets.only(top: screenSize.height / 20),
                child: Image.asset(
                  emojiStr,
                  width: screenSize.width / 7,
                  height: screenSize.height / 5,
                ),
              )
            : Container());
  }
}
