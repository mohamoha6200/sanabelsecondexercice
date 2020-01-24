import 'package:flame/flame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanabelsecondexercice/components/ExQuestionBar.dart';
import 'package:sanabelsecondexercice/components/widgets/ExerciceDrawer.dart';
import 'package:sanabelsecondexercice/components/widgets/ResultSuccessQuestion.dart';
import 'package:sanabelsecondexercice/components/widgets/exAppBar.dart';
import 'package:sanabelsecondexercice/components/widgets/letterOrText.dart';
import 'package:sanabelsecondexercice/theme/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Exercice9 extends StatefulWidget {
  @override
  _Exercice9State createState() => _Exercice9State();
}

class _Exercice9State extends State<Exercice9> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Map<String, bool> scoreMap = {};

  String subQuestion = '';

  Map<int, Map<int, List<String>>> answers = {};
  Map<int, Map<int, List<String>>> initialAnswers = {};

  SharedPreferences prefs;
  List<int> rightCardsIndexes = [];

  @override
  void initState() {
    super.initState();
    gettingLetter();
  }

  gettingLetter() async {
    SharedPreferences.getInstance().then((onValue) {
      prefs = onValue;
      setState(() {
        subQuestion = prefs.getString('currentLetter');
      });
      initilizeCardsMap();
    });
    print("subQuestion === ");
    print(subQuestion);
  }

  initilizeCardsMap() {
    switch (subQuestion) {
      case 'ب':
        {
          setState(() {
            answers = {
              0: {
                0: ['بِــ', 'ا', 'ع']
              },
              1: {
                0: ['ذُ', 'ج', 'ش']
              },
              2: {
                0: ['نــِ', 'ا', 'ب']
              },
              3: {
                2: ['ن', 'ا', 'بٌ']
              },
              4: {
                2: ['ر', 'ي', 'ـبٍ']
              },
              5: {
                0: ['جَـ', 'ت', 'ب']
              },
              6: {
                1: ['ب', 'ــبُـ', 'ب']
              },
              7: {
                1: ['ب', 'ــنِـ', 'ت']
              },
              8: {
                2: ['ا', 'ا', 'زُ']
              },
              9: {
                0: ['خَـ', 'ت', 'ب']
              },
              10: {
                0: ['بَــ', 'د', 'ر']
              },
              11: {
                1: ['ص', 'ــبِـ', 'ر']
              },
              12: {
                2: ['ر', 'ي', 'ـنٌ']
              },
              13: {
                0: ['ذِ', 'ج', 'ش']
              },
              14: {
                0: ['بُــ', 'ا', 'ع']
              },
              15: {
                1: ['ص', 'ــبَـ', 'ر']
              },
              16: {
                0: ['فَــ', 'ب', 'ن']
              },
              17: {
                2: ['ن', 'ا', 'تٌ']
              },
            };
            rightCardsIndexes = [0, 3, 4, 6, 10, 11, 14, 15];
            initialAnswers = shuffleMap(answers);
          });
        }
        break;
      case 'ت':
        {
          setState(() {
            answers = {
              0: {
                1: ['بِـ', 'ــتِـ', 'ع']
              },
              1: {
                0: ['قَــ', 'ج', 'ش']
              },
              2: {
                0: ['ثُــ', 'ا', 'ب']
              },
              3: {
                0: ['تَــ', 'ا', 'بٌ']
              },
              4: {
                1: ['بِـ', 'ــيُـ', 'ع']
              },
              5: {
                1: ['بِــ', 'ـتَـ', 'ع']
              },
              6: {
                2: ['ن', 'ا', 'ثٌ']
              },
              7: {
                2: ['ر', 'ي', 'ـتٍ']
              },
              8: {
                1: ['ب', 'ــقُـ', 'ت']
              },
              9: {
                0: ['ذِ', 'ج', 'ش']
              },
              10: {
                1: ['ب', 'ــثِـ', 'ت']
              },
              11: {
                0: ['بَــ', 'ج', 'ش']
              },
              12: {
                0: ['تِــ', 'ت', 'ب']
              },
              13: {
                2: ['بُــ', 'ا', 'هٌ']
              },
              14: {
                2: ['ر', 'ي', 'ــةٌ']
              },
              15: {
                1: ['ب', 'ــنُـ', 'ت']
              },
              16: {
                2: ['بُــ', 'ا', 'ةٌ']
              },
              17: {
                0: ['يُــ', 'ت', 'ب']
              },
            };
            rightCardsIndexes = [0, 3, 5, 7, 12, 14, 16];
            initialAnswers = shuffleMap(answers);
          });
        }
        break;
      case 'ث':
        {
          setState(() {
            answers = {
              0: {
                1: ['بِـ', 'ــتُـ', 'ع']
              },
              1: {
                1: ['بِـ', 'ــثَـ', 'ع']
              },
              2: {
                2: ['ر', 'ي', 'ـثٌ']
              },
              3: {
                2: ['ر', 'ي', 'ـشٌ']
              },
              4: {
                2: ['ن', 'ا', 'تٌ']
              },
              5: {
                1: ['بِـ', 'ــثِـ', 'ع']
              },
              6: {
                0: ['قَــ', 'ت', 'ب']
              },
              7: {
                0: ['ثُــ', 'ت', 'ب']
              },
              8: {
                2: ['ن', 'ا', 'ثٌ']
              },
              9: {
                0: ['بِــ', 'ــبِـ', 'ع']
              },
              10: {
                1: ['بِـ', 'ــفُـ', 'ع']
              },
              11: {
                2: ['ر', 'ي', 'ـتٍ']
              },
              12: {
                2: ['ر', 'ي', 'ـثٍ']
              },
              13: {
                1: ['بِـ', 'ـشِـ', 'ع']
              },
              14: {
                1: ['بِـ', 'ــثَـ', 'ع']
              },
              15: {
                2: ['ن', 'ا', 'بٌ']
              },
              16: {
                1: ['بِـ', 'ــنِـ', 'ع']
              },
              17: {
                2: ['ر', 'ي', 'ـقٌ']
              },
            };
            rightCardsIndexes = [1, 2, 5, 7, 8, 12, 14];
            initialAnswers = shuffleMap(answers);
          });
        }
        break;
      case 'ج':
        {
          setState(() {
            answers = {
              0: {
                0: ['خُــ', 'ت', 'ب']
              },
              1: {
                1: ['بِـ', 'ـجِـ', 'ع']
              },
              2: {
                0: ['بَــ', 'ت', 'ب']
              },
              3: {
                0: ['جُــ', 'ت', 'ب']
              },
              4: {
                2: ['ر', 'ي', 'ـجٌ']
              },
              5: {
                0: ['حِــ', 'ت', 'ب']
              },
              6: {
                1: ['بِـ', 'ـخَـ', 'ع']
              },
              7: {
                2: ['ر', 'ر', 'خٌ']
              },
              8: {
                1: ['بِـ', 'ـحَـ', 'ع']
              },
              9: {
                2: ['ن', 'ا', 'جٌ']
              },
              10: {
                0: ['جِــ', 'ت', 'ب']
              },
              11: {
                1: ['بِـ', 'ـبِـ', 'ع']
              },
              12: {
                0: ['حَــ', 'ت', 'ب']
              },
              13: {
                1: ['بِـ', 'ـجَـ', 'ع']
              },
              14: {
                1: ['بِـ', 'ـحُـ', 'ع']
              },
              15: {
                1: ['بِـ', 'ــبُـ', 'ع']
              },
              16: {
                2: ['ن', 'ا', 'خٌ']
              },
              17: {
                2: ['ن', 'ا', 'حٌ']
              },
            };
            rightCardsIndexes = [1, 3, 4, 9, 10, 13];
            initialAnswers = shuffleMap(answers);
          });
        }
        break;
      case 'ح':
        {
          setState(() {
            answers = {
              0: {
                2: ['ر', 'ر', 'حٌ']
              },
              1: {
                0: ['عُــ', 'ت', 'ب']
              },
              2: {
                1: ['بِـ', 'ـخِـ', 'ع']
              },
              3: {
                0: ['حَــ', 'ت', 'ب']
              },
              4: {
                2: ['ر', 'ي', 'ـجٍ']
              },
              5: {
                0: ['دُ', 'ت', 'ب']
              },
              6: {
                2: ['ر', 'ي', 'ـحٌ']
              },
              7: {
                1: ['بِـ', 'ـحُـ', 'ع']
              },
              8: {
                0: ['نُــ', 'ت', 'ب']
              },
              9: {
                0: ['عِــ', 'ت', 'ب']
              },
              10: {
                1: ['بِـ', 'ـحَـ', 'ع']
              },
              11: {
                0: ['دِ', 'ت', 'ب']
              },
              12: {
                2: ['ن', 'ا', 'يٌ']
              },
              13: {
                0: ['مُــ', 'ت', 'ب']
              },
              14: {
                1: ['بِـ', 'ـجِـ', 'ع']
              },
              15: {
                0: ['خَــ', 'ت', 'ب']
              },
              16: {
                1: ['بِـ', 'ـغُـ', 'ع']
              },
              17: {
                0: ['حُــ', 'ت', 'ب']
              },
            };
            rightCardsIndexes = [1, 3, 4, 9, 10, 13];
            initialAnswers = shuffleMap(answers);
          });
        }
        break;
      case 'خ':
        {
          setState(() {
            answers = {
              0: {
                0: ['خُــ', 'ت', 'ب']
              },
              1: {
                0: ['عُــ', 'ـجِـ', 'ع']
              },
              2: {
                1: ['بِـ', 'ـخِـ', 'ع']
              },
              3: {
                0: ['حَــ', 'ت', 'ب']
              },
              4: {
                2: ['ر', 'ي', 'ـجٍ']
              },
              5: {
                0: ['ذِ', 'ت', 'ب']
              },
              6: {
                2: ['ر', 'ي', 'ـخٌ']
              },
              7: {
                1: ['بِـ', 'ـحُـ', 'ع']
              },
              8: {
                0: ['نُــ', 'ت', 'ب']
              },
              9: {
                0: ['غُــ', 'ت', 'ب']
              },
              10: {
                0: ['نِــ', 'ت', 'ب']
              },
              11: {
                0: ['دَ', 'ت', 'ب']
              },
              12: {
                1: ['بِـ', 'ـخَـ', 'ع']
              },
              13: {
                2: ['ن', 'ا', 'خٌ']
              },
              14: {
                1: ['بِـ', 'ـنِـ', 'ع']
              },
              15: {
                1: ['بِـ', 'ـجِـ', 'ع']
              },
              16: {
                0: ['خَــ', 'ت', 'ب']
              },
              17: {
                1: ['بِـ', 'ـغُـ', 'ع']
              },
            };
            rightCardsIndexes = [0, 2, 6, 12, 13, 16];
            initialAnswers = shuffleMap(answers);
          });
        }
        break;
      case 'د':
        {
          setState(() {
            answers = {
              0: {
                0: ['دَ', 'ت', 'ب']
              },
              1: {
                1: ['بِـ', 'ـرُ', 'ع']
              },
              2: {
                2: ['لِ', 'رَ', 'لِ']
              },
              3: {
                0: ['حِــ', 'ت', 'ب']
              },
              4: {
                0: ['دٌ', 'ت', 'ب']
              },
              5: {
                0: ['ذَ', 'ت', 'ب']
              },
              6: {
                1: ['بِـ', 'ـدِ', 'ع']
              },
              7: {
                0: ['رَ', 'ت', 'ب']
              },
              8: {
                1: ['بِـ', 'ـذٌ', 'ع']
              },
              9: {
                0: ['عِــ', 'ت', 'ب']
              },
              10: {
                2: ['بِـ', 'بِـ', 'ـنٌ']
              },
              11: {
                1: ['دَ', 'ـدَ', 'ع']
              },
              12: {
                0: ['دُ', 'ت', 'ب']
              },
              13: {
                0: ['حَـ', 'ت', 'ب']
              },
              14: {
                0: ['وِ', 'ت', 'ب']
              },
              15: {
                2: ['ن', 'ا', 'لٌ']
              },
              16: {
                0: ['زِ', 'ت', 'ب']
              },
              17: {
                1: ['بِـ', 'ـعُـ', 'ع']
              },
            };
            rightCardsIndexes = [0, 4, 6, 11, 12];
            initialAnswers = shuffleMap(answers);
          });
        }
        break;
      case 'ذ':
        {
          setState(() {});
        }
        break;
      case 'ر':
        {
          setState(() {
            answers = {
              0: {
                0: ['دَ', 'ت', 'ب']
              },
              1: {
                1: ['بِـ', 'ـرٌ', 'ع']
              },
              2: {
                0: ['زِ', 'ت', 'ب']
              },
              3: {
                0: ['وَ', 'ت', 'ب']
              },
              4: {
                0: ['لِـ', 'ت', 'ب']
              },
              5: {
                0: ['رُ', 'ت', 'ب']
              },
              6: {
                1: ['بِـ', 'ـرَ', 'ع']
              },
              7: {
                0: ['حُــ', 'ت', 'ب']
              },
              8: {
                0: ['مِــ', 'ت', 'ب']
              },
              9: {
                2: ['حَــ', 'ا', 'نٌ']
              },
              10: {
                0: ['زُ', 'ت', 'ب']
              },
              11: {
                1: ['بِـ', 'ـحَـ', 'ع']
              },
              12: {
                0: ['رَ', 'ت', 'ب']
              },
              13: {
                1: ['بِـ', 'ـرٍ', 'ع']
              },
              14: {
                1: ['بِـ', 'ـدُ', 'ع']
              },
              15: {
                0: ['ءُ', 'ت', 'ب']
              },
              16: {
                0: ['لُـ', 'ت', 'ب']
              },
              17: {
                0: ['زٌ', 'ت', 'ب']
              },
            };
            rightCardsIndexes = [1, 5, 6, 12, 13];
            initialAnswers = shuffleMap(answers);
          });
        }
        break;
      case 'ز':
        {
          setState(() {
            answers = {
              0: {
                0: ['نُــ', 'ت', 'ب']
              },
              1: {
                1: ['بِـ', 'ــزٌ', 'ع']
              },
              2: {
                1: ['بِـ', 'ــزِ', 'ع']
              },
              3: {
                0: ['ذِ', 'ت', 'ب']
              },
              4: {
                0: ['جَــ', 'ت', 'ب']
              },
              5: {
                0: ['رَ', 'ت', 'ب']
              },
              6: {
                0: ['زِ', 'ت', 'ب']
              },
              7: {
                2: ['حَــ', 'ا', 'نٌ']
              },
              8: {
                1: ['بُـ', 'ــبُـ', 'ع']
              },
              9: {
                0: ['زَ', 'ت', 'ب']
              },
              10: {
                0: ['ذُ', 'ت', 'ب']
              },
              11: {
                0: ['زُ', 'ت', 'ب']
              },
              12: {
                0: ['رِ', 'ت', 'ب']
              },
              13: {
                1: ['بِـ', 'ــرٌ', 'ع']
              },
              14: {
                0: ['جِــ', 'ت', 'ب']
              },
              15: {
                1: ['بِـ', 'ــنُـ', 'ع']
              },
              16: {
                2: ['فٌـ', 'ت', 'ــفٌ']
              },
              17: {
                0: ['زٍ', 'ت', 'ب']
              },
            };
            rightCardsIndexes = [1, 2, 6, 9, 11, 17];
            initialAnswers = shuffleMap(answers);
          });
        }
        break;
      case 'س':
        {
          setState(() {
            answers = {
              0: {
                2: ['حَــ', 'ا', 'شٌ']
              },
              1: {
                2: ['حَــ', 'ا', 'سٌ']
              },
              2: {
                1: ['بِـ', 'ـسُـ', 'ع']
              },
              3: {
                2: ['حَــ', 'ا', 'ــنُ']
              },
              4: {
                0: ['سَــ', 'ت', 'ب']
              },
              5: {
                0: ['شِــ', 'ت', 'ب']
              },
              6: {
                1: ['بِـ', 'ـسِـ', 'ع']
              },
              7: {
                0: ['سُــ', 'ت', 'ب']
              },
              8: {
                1: ['بِـ', 'ـشُـ', 'ع']
              },
              9: {
                2: ['حَــ', 'ا', 'ـشٌ']
              },
              10: {
                0: ['سَــ', 'ت', 'ب']
              },
              11: {
                2: ['حَــ', 'ا', 'ـسٍ']
              },
              12: {
                1: ['بِـ', 'ـسَـ', 'ع']
              },
              13: {
                1: ['بِـ', 'ـشَـ', 'ع']
              },
              14: {
                0: ['سِــ', 'ت', 'ب']
              },
              15: {
                0: ['شَــ', 'ت', 'ب']
              },
              16: {
                2: ['حَــ', 'ا', 'صٌ']
              },
              17: {
                2: ['حَــ', 'ا', 'ثٌ']
              },
            };
            rightCardsIndexes = [1, 2, 4, 6, 7, 10, 11, 12, 14];
            initialAnswers = shuffleMap(answers);
          });
        }
        break;
      case 'ش':
        {
          setState(() {
            answers = {
              0: {
                2: ['حَــ', 'ا', 'شٌ']
              },
              1: {
                2: ['حَــ', 'ا', 'سٌ']
              },
              2: {
                1: ['بِـ', 'ـسُـ', 'ع']
              },
              3: {
                1: ['بِـ', 'ـثَـ', 'ع']
              },
              4: {
                0: ['سَــ', 'ت', 'ب']
              },
              5: {
                0: ['شِــ', 'ت', 'ب']
              },
              6: {
                1: ['بِـ', 'ـسِـ', 'ع']
              },
              7: {
                0: ['ثِــ', 'ت', 'ب']
              },
              8: {
                1: ['بِـ', 'ـشُـ', 'ع']
              },
              9: {
                2: ['حَــ', 'ا', 'ـشٌ']
              },
              10: {
                0: ['سَــ', 'ت', 'ب']
              },
              11: {
                2: ['حَــ', 'ا', 'ـسٍ']
              },
              12: {
                1: ['بِـ', 'ـسَـ', 'ع']
              },
              13: {
                1: ['بِـ', 'ـشَـ', 'ع']
              },
              14: {
                0: ['سِــ', 'ت', 'ب']
              },
              15: {
                0: ['شَــ', 'ت', 'ب']
              },
              16: {
                2: ['حَــ', 'ا', 'قٌ']
              },
              17: {
                2: ['حَــ', 'ا', 'ثٌ']
              },
            };
            rightCardsIndexes = [
              0,
              5,
              8,
              9,
              13,
              15,
            ];
            initialAnswers = shuffleMap(answers);
          });
        }
        break;
      case 'ص':
        {
          setState(() {
            answers = {
              0: {
                2: ['حَــ', 'ا', 'ضٌ']
              },
              1: {
                1: ['بِـ', 'ـصُـ', 'ع']
              },
              2: {
                0: ['مِــ', 'ت', 'ب']
              },
              3: {
                2: ['حَــ', 'ا', 'نٌ']
              },
              4: {
                0: ['صَــ', 'ت', 'ب']
              },
              5: {
                1: ['بِـ', 'ـضُـ', 'ع']
              },
              6: {
                2: ['ر', 'ر', 'ـصٌ']
              },
              7: {
                1: ['بِـ', 'ـصِـ', 'ع']
              },
              8: {
                0: ['ضَــ', 'ت', 'ب']
              },
              9: {
                1: ['بِـ', 'ـمُـ', 'ع']
              },
              10: {
                2: ['حَــ', 'ا', 'صٌ']
              },
              11: {
                0: ['طِــ', 'ت', 'ب']
              },
              12: {
                1: ['بِـ', 'ـعَـ', 'ع']
              },
              13: {
                0: ['صِــ', 'ت', 'ب']
              },
              14: {
                1: ['بِـ', 'ـصَـ', 'ع']
              },
              15: {
                0: ['ضُــ', 'ت', 'ب']
              },
              16: {
                1: ['بِـ', 'ـضِـ', 'ع']
              },
            };
            rightCardsIndexes = [1, 4, 6, 7, 10, 13, 14];
            initialAnswers = shuffleMap(answers);
          });
        }
        break;
      case 'ض':
        {
          setState(() {
            answers = {
              0: {
                2: ['حَــ', 'ا', 'ضٌ']
              },
              1: {
                1: ['بِـ', 'ـصُـ', 'ع']
              },
              2: {
                0: ['مِــ', 'ت', 'ب']
              },
              3: {
                2: ['حَــ', 'ا', ' نٌ']
              },
              4: {
                0: ['صَــ', 'ت', 'ب']
              },
              5: {
                1: ['بِـ', 'ـضُـ', 'ع']
              },
              6: {
                2: ['حَــ', 'ا', 'ـصٌ']
              },
              7: {
                1: ['بِـ', 'ـصِـ', 'ع']
              },
              8: {
                0: ['ضَــ', 'ت', 'ب']
              },
              9: {
                1: ['بِـ', 'ــمُـ', 'ع']
              },
              10: {
                2: ['حَــ', 'ا', 'صٌ']
              },
              11: {
                0: ['طِــ', 'ت', 'ب']
              },
              12: {
                1: ['بِـ', 'ــعَـ', 'ع']
              },
              13: {
                0: ['صِــ', 'ت', 'ب']
              },
              14: {
                1: ['بِـ', 'ـصَـ', 'ع']
              },
              15: {
                0: ['ضُــ', 'ت', 'ب']
              },
              16: {
                1: ['بِـ', 'ـضِـ', 'ع']
              },
            };
            rightCardsIndexes = [
              0,
              5,
              8,
              15,
              16,
            ];
            initialAnswers = shuffleMap(answers);
          });
        }
        break;
      case 'ط':
        {
          setState(() {
            answers = {
              0: {
                0: ['ظَــ', 'ت', 'ب']
              },
              1: {
                1: ['بِـ', 'ـطِـ', 'ع']
              },
              2: {
                0: ['صُــ', 'ت', 'ب']
              },
              3: {
                0: ['طَــ', 'ت', 'ب']
              },
              4: {
                0: ['طٌــ', 'ت', 'ب']
              },
              5: {
                2: ['حَــ', 'ا', ' صٌ']
              },
              6: {
                1: ['بِـ', 'ـظُـ', 'ع']
              },
              7: {
                2: ['حَــ', 'ا', 'ــظٌ']
              },
              8: {
                2: ['حَــ', 'ا', 'ــطٌ']
              },
              9: {
                1: ['بِـ', 'ـظَـ', 'ع']
              },
              10: {
                1: ['بِـ', 'ـطُـ', 'ع']
              },
              11: {
                1: ['بِـ', 'ـصِـ', 'ع']
              },
              12: {
                2: ['حَــ', 'ا', 'ــظٍ']
              },
              13: {
                0: ['طُــ', 'ت', 'ب']
              },
              14: {
                0: ['ضُــ', 'ت', 'ب']
              },
              15: {
                0: ['فِــ', 'ت', 'ب']
              },
              16: {
                1: ['بِـ', 'ـطِـ', 'ع']
              },
              17: {
                0: ['ظِــ', 'ت', 'ب']
              },
            };
            rightCardsIndexes = [1, 3, 4, 8, 10, 13, 16];
            initialAnswers = shuffleMap(answers);
          });
        }
        break;
      case 'ظ':
        {
          setState(() {
            answers = {
              0: {
                0: ['ظَــ', 'ت', 'ب']
              },
              1: {
                1: ['بِـ', 'ـطِـ', 'ع']
              },
              2: {
                0: ['صُــ', 'ت', 'ب']
              },
              3: {
                0: ['طَــ', 'ت', 'ب']
              },
              4: {
                0: ['طٌــ', 'ت', 'ب']
              },
              5: {
                2: ['حَــ', 'ا', ' صٌ']
              },
              6: {
                1: ['بِـ', 'ـظُـ', 'ع']
              },
              7: {
                2: ['حَــ', 'ا', 'ــظٌ']
              },
              8: {
                2: ['حَــ', 'ا', 'ــطٌ']
              },
              9: {
                1: ['بِـ', 'ـظَـ', 'ع']
              },
              10: {
                1: ['بِـ', 'ـطُـ', 'ع']
              },
              11: {
                1: ['بِـ', 'ـصِـ', 'ع']
              },
              12: {
                2: ['حَــ', 'ا', 'ــظٍ']
              },
              13: {
                0: ['طُــ', 'ت', 'ب']
              },
              14: {
                0: ['ضُــ', 'ت', 'ب']
              },
              15: {
                0: ['فِــ', 'ت', 'ب']
              },
              16: {
                1: ['بِـ', 'ـطِـ', 'ع']
              },
              17: {
                0: ['ظِــ', 'ت', 'ب']
              },
            };
            rightCardsIndexes = [0, 6, 7, 9, 12, 17];
            initialAnswers = shuffleMap(answers);
          });
        }
        break;
      case 'ع':
        {
          setState(() {});
        }
        break;
      case 'غ':
        {
          setState(() {});
        }
        break;
      case 'ف':
        {
          setState(() {});
        }
        break;
      case 'ق':
        {
          setState(() {});
        }
        break;
      case 'ك':
        {
          setState(() {});
        }
        break;
      case 'ل':
        {
          setState(() {});
        }
        break;
      case 'م':
        {
          setState(() {});
        }
        break;
      case 'ن':
        {
          setState(() {});
        }
        break;
      case 'ه':
        {
          setState(() {});
        }
        break;
      case 'و':
        {
          setState(() {});
        }
        break;
      case 'ي':
        {
          setState(() {});
        }
        break;

      default:
        {
          setState(() {});
        }
    }
  }

  Widget childWidget() {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // ExQuestionBar(
        //   subQuestion: subQuestion,
        //   question: 'أضغط عندما أرى حرف   ',
        //   kidPic: 'kids8.png',
        //   logos: false,
        // ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: new GridView.count(
            shrinkWrap: true,
            // childAspectRatio: screenSize.width / screenSize.height / 1.75,
            childAspectRatio: screenSize.width / screenSize.height / 1.6,

            physics: ClampingScrollPhysics(),
            crossAxisCount: 6,
            children: initialAnswers.keys.map((index) {
              var key = answers[index].keys.toList()[0];
              var value = answers[index].values.toList()[0];
              return scoreMap[index.toString()] != true
                  ? InkWell(
                      onTap: () {
                        if (rightCardsIndexes.contains(index) == true) {
                          setState(() {
                            scoreMap[index.toString()] = true;
                            print('true' + index.toString());
                          });

                          if (scoreMap.length == rightCardsIndexes.length) {
                            // Future.delayed(Duration(seconds: 8), () {
                            setState(() {
                              scoreMap = {};
                              initialAnswers = shuffleMap(answers);
                            });
                            // });
                            showDialog(
                                context: context,
                                builder: (context) {
                                  // Future.delayed(Duration(seconds: 5), () {
                                  //   Navigator.of(context).pop(true);
                                  // });
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                        dialogBackgroundColor:
                                            Colors.transparent),
                                    child: ResultSucessQuestion(),
                                  );
                                });
                          } else {
                            Flame.audio.play('treasure.mp3');
                            Future.delayed(Duration(seconds: 1), () {
                              Flame.audio.play('good.mp3');
                            });
                          }
                        } else {
                          Flame.audio.play('error.mp3');
                        }
                      },
                      child: Stack(
                        children: <Widget>[
                          Center(
                            child: new Image.asset(
                              'assets/emptyCard.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          Center(
                            child: LetterOrText(
                              pos: key,
                              textList: value,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Center(
                      child: new Image.asset(
                        'assets/correctAnswer.png',
                        fit: BoxFit.contain,
                      ),
                    );
            }).toList(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/classroom3.png"),
          fit: BoxFit.fill,
          colorFilter: new ColorFilter.mode(
              Colors.yellow.withOpacity(0.65), BlendMode.luminosity),
        ),
      ),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
        appBar: exAppBar(
          screenSize,
          _scaffoldKey,
          ExQuestionBar(
            subQuestion: subQuestion,
            question: 'أَضْغَطُ عِنْدَمَا أَرَى حَرْفَ     ',
            kidPic: 'kids8.png',
            logos: false,
          ),
        ),
        drawer: AppDrawer(),
        body: childWidget(),
      ),
    );
  }
}

Map<int, Map<int, List<String>>> shuffleMap(
    Map<int, Map<int, List<String>>> map) {
  Map<int, Map<int, List<String>>> result = {};
  var keys = map.keys.toList()..shuffle();
  var values = map.values.toList()..shuffle();
  for (var i = 0; i < keys.length; i++) {
    result[keys[i]] = values[i];
  }
  return result;
}
