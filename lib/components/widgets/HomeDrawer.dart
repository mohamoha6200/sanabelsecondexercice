import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:sanabelsecondexercice/components/widgets/soundSettings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

class HomeDrawer extends StatefulWidget {
  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  final _formKey = GlobalKey<FormState>();




  @override
  void initState() {
    super.initState();
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
                _createDrawerItem(
                    icon: CommunityMaterialIcons.settings,
                    text: 'إعدادات',
                    onTap: () => {_settings()} //contacts
                    // Navigator.pushReplacementNamed(context, Routes.contacts)
                    ),
                // Divider(),
                _createDrawerItem(
                    icon: CommunityMaterialIcons.contact_mail,
                    text: 'راسلنا',
                    onTap: () => {_contactUs()} //note
                    //       Navigator.pushReplacementNamed(context, Routes.notes)
                    ),
                // Divider(),
                _createDrawerItem(
                    icon: CommunityMaterialIcons.share_variant,
                    text: 'شارك التطبيق',
                    onTap: () => {_share()} //note
                    //       Navigator.pushReplacementNamed(context, Routes.notes)
                    ),
                // Divider(),
                _createDrawerItem(
                    icon: CommunityMaterialIcons.thumb_up_outline,
                    text: 'قيم التطبيق',
                    onTap: () => {_rate()} //note
                    //       Navigator.pushReplacementNamed(context, Routes.notes)
                    ),
                // Divider(),
                _createDrawerItem(
                    // icon: Icons.navigation,
                    icon: Icons.touch_app,
                    text: 'عن التطبيق',
                    onTap: () => {_aboutUs()} //note
                    //       Navigator.pushReplacementNamed(context, Routes.notes)
                    ),
                Divider(
                  thickness: 1.5,
                ),

                _createDrawerFooter(),
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

  Widget _createDrawerFooter() {
    return Container(
        child: ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // IconButton(
          //     icon: new Icon(
          //       CommunityMaterialIcons.facebook_box,
          //       color: Color(0xFF4267B2),
          //     ),
          //     onPressed: () async {
          //       const url = 'https://www.facebook.com/sanabel';
          //       if (await canLaunch(url)) {
          //         await launch(url);
          //       } else {
          //         throw 'Could not launch $url';
          //       }
          //     }),
          // IconButton(
          //     icon: new Icon(
          //       CommunityMaterialIcons.instagram,
          //       color: Color(0xFF8a3ab9),
          //     ),
          //     onPressed: () async {
          //       const url = 'https://www.instagram.com/sanabel';
          //       if (await canLaunch(url)) {
          //         await launch(url);
          //       } else {
          //         throw 'Could not launch $url';
          //       }
          //     }),
          // IconButton(
          //     icon: new Icon(
          //       CommunityMaterialIcons.youtube,
          //       color: Color(0xFFFF0000),
          //     ),
          //     onPressed: () async {
          //       const url = 'https://flutter.dev';
          //       if (await canLaunch(url)) {
          //         await launch(url);
          //       } else {
          //         throw 'Could not launch $url';
          //       }
          //     }),
          InkWell(
            onTap: () {},
            child: Container(
              width: 32,
              height: 23,
              child: Image.asset('assets/facebook.png'),
            ),
          ),

          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: 32,
              child: Image.asset('assets/instagram.png'),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: 32,
              child: Image.asset('assets/youtube.png'),
            ),
          ),
        ],
      ),
      subtitle: Center(
        child: Text('x.x.x : إصدار التطبيق',
            style: TextStyle(color: Colors.black, fontSize: 13)),
      ),
    ));
  }

  _contactUs() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            content: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text('راسلنا'),
                          Padding(
                            padding: EdgeInsets.only(right: 5.0),
                            child: Text(
                                'أرسل لنا إقتراحاتك أو ملاحظاتك بخصوص التطبيق',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 13)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Icon(Icons.mail_outline),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 16),
                    decoration: new BoxDecoration(color: Colors.grey),
                    child: TextField(
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.end,
                      decoration: new InputDecoration(
                        contentPadding: EdgeInsets.only(right: 8.0),
                        border: InputBorder.none,
                        hintText: 'البريد الإلكتروني',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 16),
                    decoration: new BoxDecoration(color: Colors.grey),
                    child: TextField(
                      maxLines: 8,
                      minLines: 5,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.end,
                      decoration: new InputDecoration(
                        contentPadding: EdgeInsets.only(right: 8.0),
                        border: InputBorder.none,
                        hintText: 'الرسالة',
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.redAccent,
                        child: Text(
                          "إغلاق",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                      ),
                      RaisedButton(
                        color: Colors.greenAccent,
                        child: Text(
                          "أرسل",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  _settings() {
    // return showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         title: Text(
    //           'إعدادات عامة',
    //           textAlign: TextAlign.center,
    //           style: TextStyle(color: Colors.blue),
    //         ),
    //         shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.all(Radius.circular(32.0))),
    //         content: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: <Widget>[
    //             Divider(),
    //             Directionality(
    //               textDirection: TextDirection.rtl,
    //               child: SwitchListTile(
    //                 title: Text('صوت الموسيقى'),
    //                 value: _backgroundSound,
    //                 onChanged: (bool newValue) {
    //                   print('newValue=' + newValue.toString());
    //                   setState(() {
    //                     _backgroundSound = newValue;
    //                     if (_backgroundSound == false) {
    //                       print('should pause' + newValue.toString());
    //                       // Flame.bgm.pause();
    //                     } else if (_backgroundSound == true) {
    //                       print('should resume' + newValue.toString());
    //                       // Flame.bgm.resume();
    //                     }
    //                     // SharedPreferences prefs =
    //                     //     await SharedPreferences.getInstance();
    //                     // await prefs.setBool('backgroundSound', newValue);
    //                   });
    //                 },
    //                 activeColor: Colors.blue,
    //               ),
    //             ),
    //             Divider(),
    //             Directionality(
    //               textDirection: TextDirection.rtl,
    //               child: SwitchListTile(
    //                 title: Text('صوت التفاعل'),
    //                 value: _interactionSound,
    //                 onChanged: (bool newValue) {
    //                   print('newValue=' + newValue.toString());

    //                   // setState(() async {
    //                   //   _interactionSound = newValue;
    //                   //   SharedPreferences prefs =
    //                   //       await SharedPreferences.getInstance();
    //                   //   await prefs.setBool('interactionSound', newValue);
    //                   // });
    //                 },
    //                 activeColor: Colors.blue,
    //               ),
    //             ),

    //           ],
    //         ),
    //       );
    //     });
    showDialog(
        context: context,
        builder: (context) {
          // Future.delayed(Duration(seconds: 5), () {
          //   Navigator.of(context).pop(true);
          // });
          return Theme(
            data: Theme.of(context)
                .copyWith(dialogBackgroundColor: Colors.transparent),
            child: SoundSettings(),
          );
        });
  }

  _aboutUs() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          Size screenSize = MediaQuery.of(context).size;

          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: screenSize.width / 10,
                  child: Image.asset(
                    'assets/kids4.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  'تعليم العربية',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text('x.x.x : إصدار التطبيق',
                    style: TextStyle(color: Colors.grey, fontSize: 13)),
                Container(
                  width: 220,
                  child: Text(
                    'تطبيق لتعلم اللغة العربية للأطفال شامل يحتوي على عدة تمارين و بدون انترنت',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                RaisedButton(
                  color: Colors.redAccent,
                  child: Text(
                    "إغلاق",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              ],
            ),
          );
        });
  }

  _rate() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.star_border,
                            color: Color(0xff00BFA5),
                            size: 30.0,
                          ),
                          Icon(
                            Icons.star_border,
                            color: Color(0xff00BFA5),
                            size: 30.0,
                          ),
                          Icon(
                            Icons.star_border,
                            color: Color(0xff00BFA5),
                            size: 30.0,
                          ),
                          Icon(
                            Icons.star_border,
                            color: Color(0xff00BFA5),
                            size: 30.0,
                          ),
                          Icon(
                            Icons.star_border,
                            color: Color(0xff00BFA5),
                            size: 30.0,
                          ),
                        ],
                      ),
                      Text(
                        "تقييم",
                        style: TextStyle(fontSize: 24.0),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 4.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: TextField(
                      textAlign: TextAlign.end,
                      decoration: InputDecoration(
                        hintText: "ملاحظة ؟",
                        border: InputBorder.none,
                      ),
                      maxLines: 8,
                    ),
                  ),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      decoration: BoxDecoration(
                        color: Color(0xff00BFA5),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(32.0),
                            bottomRight: Radius.circular(32.0)),
                      ),
                      child: Text(
                        "قيم التطبيق",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  _share() {
    Share.share('check out my website https://example.com',
        subject: 'Look what I made!');

    // return showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //           title: Text(
    //             'شارك التطبيق على',
    //             textAlign: TextAlign.center,
    //             style: TextStyle(color: Colors.blue),
    //           ),
    //           shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.all(Radius.circular(32.0))),
    //           content: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //             children: <Widget>[
    //               Container(
    //                 width: 128,
    //                 child: Image.asset(
    //                   'assets/facebook2x.png',
    //                   fit: BoxFit.contain,
    //                 ),
    //               ),
    //               Container(
    //                 width: 128,
    //                 child: Image.asset(
    //                   'assets/instagram2x.png',
    //                   fit: BoxFit.contain,
    //                 ),
    //               ),
    //             ],
    //           ));
    //     });
  }
}
