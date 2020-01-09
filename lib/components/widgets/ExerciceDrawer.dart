import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sanabelsecondexercice/components/providers/DrawerState.dart';
import 'package:sanabelsecondexercice/pages/DragToBoxExercice.dart';
import 'package:sanabelsecondexercice/pages/NavigateLetter.dart';
import 'package:sanabelsecondexercice/pages/home.dart';
import 'package:sanabelsecondexercice/theme/perrine.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  String subQuestion = '';
  int currentExercice;

  List<bool> showExList = [];

  @override
  void initState() {
    super.initState();
    showExList = [
      true,
      true,
      true,
      true,
    ];
    gettingLetter();
  }

  gettingLetter() async {
    final prefs = await SharedPreferences.getInstance();
    final myexercice =
        Provider.of<DrawerStateInfo>(context, listen: false).getCurrentDrawer;
    // prefs.getInt('currentExercice') ?? 0;
    setState(() {
      subQuestion = prefs.getString('currentLetter');
      currentExercice = myexercice;
    });

    print("subQuestion in drawer === ");
    print(subQuestion);
    print("myexercice  in drawer=== ");
    print(myexercice);
    initializeWhatToShow();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Drawer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(flex: 1, child: _createHeader(context)),
          Expanded(
            flex: 2,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                // _createDrawerItem(
                //     icon: Icons.event,
                //     text: 'التَمرين الأول',
                //     onTap: () => {} //contacts
                //     // Navigator.pushReplacementNamed(context, Routes.contacts)
                //     ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (BuildContext context) {
                        return HomePage();
                      },
                    ));
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        margin: new EdgeInsets.symmetric(
                            horizontal: screenSize.width / 80),
                        child: Icon(
                          Icons.home,
                          size: screenSize.width / 32,
                          color: Colors.purple,
                        ),
                      ),
                      Container(
                        child: Text(
                          'إِلَى الْحُرُوفْ',
                          style: mStyleNext,
                        ),
                      ),
                    ],
                  ),
                ),
               showExList[0] == true
                    ?
                Divider():Container(),

                // _createDrawerItem(
                //     icon: Icons.collections_bookmark,
                //     text: 'التَمرين الثاني',
                //     onTap: () => {}
                //     //        Navigator.pushReplacementNamed(context, Routes.events)
                //     ),

                // ((subQuestion == 'أ' && currentExercice == 3) || (subQuestion != 'أ' && currentExercice == 4))
                // ? Container()                     :
                showExList[0] == true
                    ? InkWell(
                        onTap: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.setInt('currentExercice', 1);
                          Provider.of<DrawerStateInfo>(context, listen: false)
                              .setCurrentExercice(1);
                          Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return NavigateLetter();
                          }));
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                              margin: new EdgeInsets.symmetric(
                                  horizontal: screenSize.width / 80),
                              child: Icon(
                                Icons.web,
                                size: screenSize.width / 32,
                                color: Colors.purple,
                              ),
                            ),
                            Container(
                              child: Text(
                                'الْتَمْرِيِنُ الْأول',
                                style: mStyleNext,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(),

                showExList[1] == true
                    ?
                Divider():Container(),
                showExList[1] == true
                    ? InkWell(
                        onTap: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.setInt('currentExercice', 2);
                          Provider.of<DrawerStateInfo>(context, listen: false)
                              .setCurrentExercice(2);
                          Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return NavigateLetter();
                          }));
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                              margin: new EdgeInsets.symmetric(
                                  horizontal: screenSize.width / 80),
                              child: Icon(
                                Icons.web,
                                size: screenSize.width / 32,
                                color: Colors.purple,
                              ),
                            ),
                            Container(
                              child: Text(
                                'الْتَمْرِيِنُ الْثاني',
                                style: mStyleNext,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(),

               showExList[2] == true
                    ?
                Divider():Container(),
                showExList[2] == true
                    ? InkWell(
                        onTap: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.setInt('currentExercice', 3);
                          Provider.of<DrawerStateInfo>(context, listen: false)
                              .setCurrentExercice(3);
                          Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return NavigateLetter();
                          }));
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                              margin: new EdgeInsets.symmetric(
                                  horizontal: screenSize.width / 80),
                              child: Icon(
                                Icons.web,
                                size: screenSize.width / 32,
                                color: Colors.purple,
                              ),
                            ),
                            Container(
                              child: Text(
                                'الْتَمْرِيِنُ الثالث',
                                style: mStyleNext,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(),

               showExList[3] == true
                    ?
                Divider():Container(),
                showExList[3] == true
                    ? InkWell(
                        onTap: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.setInt('currentExercice', 4);
                          Provider.of<DrawerStateInfo>(context, listen: false)
                              .setCurrentExercice(4);
                          Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return NavigateLetter();
                          }));
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                              margin: new EdgeInsets.symmetric(
                                  horizontal: screenSize.width / 80),
                              child: Icon(
                                Icons.web,
                                size: screenSize.width / 32,
                                color: Colors.purple,
                              ),
                            ),
                            Container(
                              child: Text(
                                'الْتَمْرِيِنُ الرابع',
                                style: mStyleNext,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(),

                Divider(),

                // _createDrawerItem(
                //     icon: Icons.event,
                //     text: 'التَمرين الثالث',
                //     onTap: () => {} //note
                //     //       Navigator.pushReplacementNamed(context, Routes.notes)
                //     ),
                // Divider(),

                // _createDrawerItem(
                //     icon: Icons.collections_bookmark,
                //     text: 'التَمرين الرابع',
                //     onTap: () => {}
                //     //       Navigator.pushReplacementNamed(context, Routes.notes)
                //     ),
                // Divider(),
                // _createDrawerItem(
                //     icon: Icons.collections_bookmark, text: 'Steps'),
                // _createDrawerItem(icon: Icons.face, text: 'Authors'),
                // _createDrawerItem(
                //     icon: Icons.account_box, text: 'Flutter Documentation'),
                // _createDrawerItem(icon: Icons.stars, text: 'Useful Links'),
                // Divider(),
                // _createDrawerItem(
                //     icon: Icons.bug_report, text: 'Report an issue'),
                // ListTile(
                //   title: Text('0.0.1'),
                //   onTap: () {},
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _createHeader(context) {
    return Center(
      child: DrawerHeader(
          // margin: EdgeInsets.zero,
          // padding: EdgeInsets.zero,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage('assets/Logo-sanabel-Vec.png'))),
          child: Stack(children: <Widget>[
            // Positioned(
            //     bottom: 12.0,
            //     right: 16.0,
            //     child: Text("Sanabel",
            //         style: TextStyle(
            //             color: Colors.greenAccent,
            //             fontSize: 20.0,
            //             fontWeight: FontWeight.w500))),
          ])),
    );
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return Container(
      child: ListTile(
        title: Row(
          children: <Widget>[
            Icon(icon),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(text),
            )
          ],
        ),
        onTap: onTap,
      ),
    );
  }

  initializeWhatToShow() {
    setState(() {
      if (subQuestion == 'أ') {
        showExList[3] = false;
      } else {
        showExList[3] = true;
      }
    });
    for (var i = 0; i < showExList.length; i++) {
      if (i == currentExercice - 1) {
        setState(() {
          showExList[i] = false;
          print('showExList[i]=' + showExList[i].toString());
        });
      }
    }
  }
}
