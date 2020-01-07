import 'package:flutter/material.dart';
import 'package:sanabelsecondexercice/pages/DragToBoxExercice.dart';
import 'package:sanabelsecondexercice/pages/home.dart';
import 'package:sanabelsecondexercice/theme/perrine.dart';

class ExQuestionBar extends StatelessWidget {
  final String kidPic;
  final String question;
  final String subQuestion;
  final bool logos;
  final String bookPic = 'Logo-sanabel-Vec.png';
  // final nextExercice;

  ExQuestionBar({
    this.kidPic,
    this.question,
    this.subQuestion,
    // this.bookPic,
    this.logos,
    // this.nextExercice
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    // print('bar subQuestion=');
    // print(subQuestion);
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,

      // iconTheme: new IconThemeData(color: mainColorText, size: 40),
      // leading: IconButton(
      //   icon: Icon(Icons.menu, color: Colors.red), // set your color here
      //   onPressed: () {

      //   },
      // ),
      automaticallyImplyLeading: false,
      // height: screenSize.height * 0.15,
      flexibleSpace: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          // Padding(
          //   padding:  EdgeInsets.only(top:screenSize.height /67.5),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     crossAxisAlignment: CrossAxisAlignment.end,
          //     mainAxisSize: MainAxisSize.max,
          //     children: <Widget>[
          //       InkWell(
          //           child: Row(
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             mainAxisSize: MainAxisSize.max,
          //             children: <Widget>[
          //               Container(
          //                 margin: new EdgeInsets.symmetric(horizontal: screenSize.width / 80),
          //                 child: Icon(
          //                   Icons.home,
          //                   size: screenSize.width / 32,
          //                   color: Colors.purple,
          //                 ),
          //               ),
          //               Container(
          //                 child: Text(
          //                   'إِلَى الْحُرُوفْ',
          //                   style: mStyleNext,
          //                 ),
          //               ),

          //             ],
          //           ),
          //           onTap: () {
          //             Navigator.push(context, MaterialPageRoute(
          //               builder: (BuildContext context) {
          //                 return HomePage();
          //               },
          //             ));
          //           }),
          //       // nextExercice == true?
          //            Row(
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               mainAxisSize: MainAxisSize.max,
          //               children: <Widget>[
          //                 InkWell(
          //                   child: Container(
          //                     child: Text(
          //                       'الْتَمْرِيِنُ الْتَالِي',
          //                       style: mStyleNext,
          //                     ),
          //                   ),
          //                   onTap: () {
          //                     Navigator.push(context, MaterialPageRoute(
          //                         builder: (BuildContext context) {
          //                       return DragToExercice(
          //                           );
          //                     }));
          //                   },
          //                 ),
          //                 InkWell(
          //                   onTap: () {
          //                     Navigator.push(context, MaterialPageRoute(
          //                         builder: (BuildContext context) {
          //                       return DragToExercice(
          //                          );
          //                     }));
          //                   },
          //                   child: Container(
          //                     margin: new EdgeInsets.only(left: screenSize.width / 96),
          //                     child: Icon(
          //                       Icons.arrow_forward,
          //                       size: screenSize.width / 32,
          //                       color: Colors.purple,
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             )
          //           // : Container(),
          //     ],
          //   ),
          // ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              logos == false
                  ? Container()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          child: Image.asset(
                            'assets/$bookPic',
                            width: screenSize.width / 6.4,
                          ),
                        ),
                        Container(
                          child: Image.asset(
                            'assets/Logo-sanabel-Vec.png',
                            width: screenSize.width / 6.4,
                          ),
                        ),
                      ],
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: this.subQuestion != null
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  this.subQuestion != null
                      ? Padding(
                          padding: EdgeInsets.only(
                            right: screenSize.width / 120,
                          ),
                          child: Text(
                            subQuestion,
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: screenSize.width / 20,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      : Container(),
                  this.question != null
                      ? Container(
                          child: Text(
                            question,
                            style: TextStyle(
                                color: Color.fromRGBO(80, 47, 136, 1),
                                fontSize: screenSize.width / 27,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      : Container(),
                  // SizedBox(
                  //   width: screenSize.width / 48,
                  // ),
                  this.kidPic != null
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenSize.width / 48),
                          child: Container(
                            child: Image.asset(
                              'assets/$kidPic',
                              fit: BoxFit.fill,
                              width: screenSize.width / 8,
                              height: screenSize.height / 8,
                            ),
                          ),
                        )
                      : Container()
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
