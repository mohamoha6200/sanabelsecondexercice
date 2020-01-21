import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:sanabelsecondexercice/components/widgets/soundSettings.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
import 'package:connectivity/connectivity.dart';
import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';

class HomeDrawer extends StatefulWidget {
  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  final _formKey = GlobalKey<FormState>();
  final Connectivity _connectivity = Connectivity();
  String _connectionStatus = 'Unknown';
  @override
  void initState() {
    super.initState();
    initConnectivity();
  }

// Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
      print('result=' + result.toString());
    } on PlatformException catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    if (result == ConnectivityResult.none) {
      setState(() => _connectionStatus = result.toString());
    }
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
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                _createDrawerItem(
                    icon: CommunityMaterialIcons.settings,
                    text: 'إعدادات',
                    onTap: () => {_settings()}
                    // Navigator.pushReplacementNamed(context, Routes.contacts)
                    ),
                Divider(),
                _createDrawerItem(
                    icon: CommunityMaterialIcons.contact_mail,
                    text: 'راسلنا',
                    onTap: () => {_contactUs()}
                    //       Navigator.pushReplacementNamed(context, Routes.notes)
                    ),
                Divider(),
                _createDrawerItem(
                    icon: CommunityMaterialIcons.share_variant,
                    text: 'شارك التطبيق',
                    onTap: () => {_share()}
                    //       Navigator.pushReplacementNamed(context, Routes.notes)
                    ),
                Divider(),
                _createDrawerItem(
                    icon: CommunityMaterialIcons.thumb_up_outline,
                    text: 'قيم التطبيق',
                    onTap: () => {_rate()}
                    //       Navigator.pushReplacementNamed(context, Routes.notes)
                    ),
                Divider(),
                _createDrawerItem(
                    // icon: Icons.navigation,
                    icon: Icons.touch_app,
                    text: 'عن التطبيق',
                    onTap: () => {_aboutUs()}
                    //       Navigator.pushReplacementNamed(context, Routes.notes)
                    ),
                Divider(
                  thickness: 1.5,
                ),
              ],
            ),
          ),
          _createDrawerFooter(),
        ],
      ),
    );
  }

  Widget _createHeader(context) {
    Size screenSize = MediaQuery.of(context).size;

    return Center(
      child: Container(
        width: screenSize.width / 4,
        height: screenSize.height / 6,
        child: Image.asset(
          'assets/Logo-sanabel-Vec.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    Size screenSize = MediaQuery.of(context).size;

    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              icon,
              size: screenSize.width / 30,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 18.0),
            child: Text(
              text,
              style: TextStyle(fontSize: screenSize.width / 42),
            ),
          )
        ],
      ),
    );
  }

  Widget _createDrawerFooter() {
    Size screenSize = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
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
              onTap: () async {
                const url = 'https://flutter.dev';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Container(
                width: 32,
                height: 23,
                child: Image.asset('assets/facebook.png'),
              ),
            ),

            InkWell(
              onTap: () async {
                const url = 'https://www.instagram.com/sanabel';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: 32,
                child: Image.asset('assets/instagram.png'),
              ),
            ),
            InkWell(
              onTap: () async {
                if (_connectionStatus != 'ConnectivityResult.none') {
                  const url = 'https://flutter.dev';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                } else {
                  print('show snackbar');
                  showFloatingFlushbar(context);
                }
              },
              child: Container(
                width: 32,
                child: Image.asset('assets/youtube.png'),
              ),
            ),
          ],
        ),
        Center(
          child: Text('x.x.x : إصدار التطبيق',
              style: TextStyle(color: Colors.black, fontSize: 13)),
        ),
      ],
    );
  }

  void showFloatingFlushbar(BuildContext context) {
    Flushbar(
      duration: Duration(seconds: 2),
      padding: EdgeInsets.all(10),
      borderRadius: 8,
      backgroundGradient: LinearGradient(
        colors: [Colors.green.shade800, Colors.greenAccent.shade700],
        stops: [0.6, 1],
      ),
      boxShadows: [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(3, 3),
          blurRadius: 3,
        ),
      ],
      // All of the previous Flushbars could be dismissed by swiping down
      // now we want to swipe to the sides
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      // The default curve is Curves.easeOut
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      title: 'Vérifier votre connection internet',
      message: 'Il se peut que votre appareil n"est pas connecté au wifi/data',
    )..show(context);
  }

  _contactUs() {
    Size screenSize = MediaQuery.of(context).size;

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
                    margin: EdgeInsets.only(bottom: 16),
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
                      Container(
                        height: screenSize.height / 14,
                        // width: 100,
                        child: RaisedButton(
                          color: Colors.redAccent,
                          child: Text(
                            "إغلاق",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                        ),
                      ),
                      Container(
                        height: screenSize.height / 14,

                        // width: 100,
                        child: RaisedButton(
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
          print('tapped settings');
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
