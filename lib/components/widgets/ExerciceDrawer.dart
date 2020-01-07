import 'package:flutter/material.dart';
import 'package:sanabelsecondexercice/pages/DragToBoxExercice.dart';
import 'package:sanabelsecondexercice/pages/home.dart';
import 'package:sanabelsecondexercice/theme/perrine.dart';

class AppDrawer extends StatelessWidget {
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
                    Navigator.push(context, MaterialPageRoute(
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
                Divider(),

                // _createDrawerItem(
                //     icon: Icons.collections_bookmark,
                //     text: 'التَمرين الثاني',
                //     onTap: () => {}
                //     //        Navigator.pushReplacementNamed(context, Routes.events)
                //     ),

                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return DragToExercice();
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
                          Icons.arrow_forward,
                          size: screenSize.width / 32,
                          color: Colors.purple,
                        ),
                      ),
                      Container(
                        child: Text(
                          'الْتَمْرِيِنُ الْتَالِي',
                          style: mStyleNext,
                        ),
                      ),
                      
                    ],
                  ),
                ),
                Divider(),

                _createDrawerItem(
                    icon: Icons.event,
                    text: 'التَمرين الثالث',
                    onTap: () => {} //note
                    //       Navigator.pushReplacementNamed(context, Routes.notes)
                    ),
                Divider(),

                _createDrawerItem(
                    icon: Icons.collections_bookmark,
                    text: 'التَمرين الرابع',
                    onTap: () => {}
                    //       Navigator.pushReplacementNamed(context, Routes.notes)
                    ),
                Divider(),
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
}
