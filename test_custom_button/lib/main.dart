import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp (),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _myColor = Colors.blue;


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text ("Tap me!"),
        centerTitle: true,
      ),
      body: new GestureDetector(
        onTapDown:(TapDownDetails details) { setState(() {
      _myColor = Colors.orange;
    });
        },
        onTapUp: (TapUpDetails details) {
          setState(() {
            _myColor = Colors.blue;
          });
        },

        child: new Container (
          color: _myColor,
        ),
      ),
    );
  }
}