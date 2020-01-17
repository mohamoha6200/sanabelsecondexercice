import 'dart:core';
import 'package:flame/flame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SoundSettings extends StatefulWidget {
  @override
  _SoundSettingsState createState() => _SoundSettingsState();
}

class _SoundSettingsState extends State<SoundSettings> {
  bool _interactionSound = true;

  bool _backgroundSound = true;

  @override
  void initState() {
    super.initState();
    print('before gettingSettings');
    gettingSettings();
  }

  gettingSettings() async {
    final prefs = await SharedPreferences.getInstance();
    // final myexercice =
    //     Provider.of<DrawerStateInfo>(context, listen: false).getCurrentDrawer;
    // prefs.getInt('currentExercice') ?? 0;
    setState(() {
      _interactionSound = prefs.getBool('interactionSound') ?? true;
      _backgroundSound = prefs.getBool('backgroundSound') ?? true;
    });
    print('after gettingSettings');
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Material(
        type: MaterialType.transparency,
        child: AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            'إعدادات عامة',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.blue),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Divider(),
              Directionality(
                textDirection: TextDirection.rtl,
                child: SwitchListTile(
                  title: Text('صوت الموسيقى'),
                  value: _backgroundSound,
                  onChanged: (bool newValue) async {
                    print('newValue=' + newValue.toString());
                    setState(() {
                      _backgroundSound = newValue;
                      if (_backgroundSound == false) {
                        print('should pause' + newValue.toString());
                        Flame.bgm.pause();
                      } else if (_backgroundSound == true) {
                        print('should play' + newValue.toString());
                        Flame.bgm.play('funny.mp3');
                      }
                    });
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setBool('backgroundSound', newValue);
                  },
                  activeColor: Colors.blue,
                ),
              ),
              Divider(),
              Directionality(
                textDirection: TextDirection.rtl,
                child: SwitchListTile(
                  title: Text('صوت التفاعل'),
                  value: _interactionSound,
                  onChanged: (bool newValue) async {
                    print('newValue=' + newValue.toString());

                    setState(() {
                      _interactionSound = newValue;
                    });
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setBool('interactionSound', newValue);
                  },
                  activeColor: Colors.blue,
                ),
              ),
              Divider(),
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
        ));
  }
}
