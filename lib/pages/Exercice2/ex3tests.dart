    // if ((inWhichCardIsThisPoint(firstPointOffset, picOffsetmap) !=
    //                 '') ||
    //             (inWhichCardIsThisPoint(lastPointOffset, picOffsetmap) != '')) {
    //           if ((inWhichCardIsThisPoint(firstPointOffset, wordOffsetmap) !=
    //                   '') ||
    //               (inWhichCardIsThisPoint(lastPointOffset, wordOffsetmap) !=
    //                   '')) {
    //             if (((picChoiceMap[inWhichCardIsThisPoint(
    //                         firstPointOffset, picOffsetmap)] ==
    //                     inWhichCardIsThisPoint(
    //                         lastPointOffset, wordOffsetmap))) ||
    //                 ((picChoiceMap[inWhichCardIsThisPoint(
    //                         lastPointOffset, picOffsetmap)] ==
    //                     inWhichCardIsThisPoint(
    //                         firstPointOffset, wordOffsetmap)))) {
    //               Flame.audio.play('good.mp3');
    //               // scoreMap[''] = true;
    //               setState(() {
    //                 firstPointOffset = null;
    //                 lastPointOffset = null;
    //               });
    //             }
    //                                          else {
    //                setState(() {
    //                  _points = [];
    //                 // scoreMap = {};
    //                });
    //                Flame.audio.play('error.mp3');
    //                print('else 1');
    //              }
    //           } else {
    //             setState(() {
    //               _points = [];
    //               // scoreMap = {};
    //             });
    //             Flame.audio.play('error.mp3');
    //                print('else 2');
    //           }
    //         } else {
    //           setState(() {
    //             _points = [];
    //             // scoreMap = {};
    //           });

    //           Flame.audio.play('error.mp3');
    //                              print('else 3');

    //         }