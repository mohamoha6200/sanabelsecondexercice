import 'package:flutter/material.dart';
import 'package:volume_watcher/volume_watcher.dart';

class SliderExample extends StatefulWidget {
  @override
  _SliderExampleState createState() {
    return _SliderExampleState();
  }
}

class _SliderExampleState extends State {
  num initVolume = 0;
  num maxVolume = 0;

  bool vol = false;

  num realVolume = 0;

  @override
  void initState() {
    super.initState();

    initPlatformState();
  }

  Future<void> initPlatformState() async {
    num initVolume = await VolumeWatcher.getCurrentVolume;
    num maxVolume = await VolumeWatcher.getMaxVolume;
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      this.initVolume = initVolume;
      this.maxVolume = maxVolume;
      this.realVolume = initVolume;
      print('real volume ' + realVolume.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: size.width * 0.25,
            height: size.height * 0.10,
            decoration: new BoxDecoration(
              color: Color(0xFF767676),
              borderRadius: new BorderRadius.all(
                Radius.circular(40.0),
              ),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  // VolumeWatcher(onVolumeChangeListener: (num volume) {
                  //   setState(() async {
                  //     realVolume = await VolumeWatcher.getCurrentVolume;
                  //     print('real now' + realVolume.toString());
                  //   });
                  // }),
                  GestureDetector(
                    onTap: () {
                      VolumeWatcher.setVolume(realVolume + maxVolume * 0.34);
                      initPlatformState();
                      print('max');

                      print('test' + vol.toString());

                      print(realVolume);
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 38,
                    ),
                  ),
                  if (realVolume == 0)
                    Icon(
                      Icons.volume_off,
                      color: Colors.black,
                    ),
                  if ((realVolume > 0) && (realVolume <= maxVolume * 0.34))
                    Icon(
                      Icons.volume_mute,
                      color: Colors.black,
                    ),
                  if ((realVolume > maxVolume * 0.34) &&
                      (realVolume < maxVolume * 0.67))
                    Icon(
                      Icons.volume_down,
                      color: Colors.black,
                    ),
                  if (realVolume >= maxVolume * 0.67)
                    Icon(
                      Icons.volume_up,
                      color: Colors.black,
                    ),
                  GestureDetector(
                    onTap: () {
                      VolumeWatcher.setVolume(realVolume - maxVolume * 0.33);
                      initPlatformState();

                      print('min');

                      print(realVolume);
                    },
                    child: Icon(
                      Icons.remove,
                      color: Colors.black,
                      size: 38,
                    ),
                  ),
                ]),
          ),
        ]);
  }
}
