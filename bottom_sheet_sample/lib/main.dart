import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.ƒ
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: new AppBar(
            title: new Text("ModalBottomSheet Demo"),
          ),
          body: new Center(
            child: BottomSheetButton(),
          ),
        ));
  }
}

class BottomSheetButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('show Buttom Sheet'),
      color: Colors.orange,
      textColor: Colors.white,
      onPressed: () async {
        var result = await showModalBottomSheet<int>(
          context: context,
          builder: (BuildContext context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.music_note),
                  title: Text('Music'),
                  onTap: () => Navigator.of(context).pop(1),
                ),
                ListTile(
                  leading: Icon(Icons.videocam),
                  title: Text('Video'),
                  onTap: () => Navigator.of(context).pop(2),
                ),
                ListTile(
                  leading: Icon(Icons.camera),
                  title: Text('Picture'),
                  onTap: () => Navigator.of(context).pop(3),
                ),
              ],
            );
          },
        );
        print('bottom sheet result: $result');
      },
    );
  }
}
