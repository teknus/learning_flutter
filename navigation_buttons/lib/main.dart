import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class Screen1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold( // 1
      appBar: new AppBar(
        title: new Text("Screen 1"), // screen title

      ),
      body: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(onPressed:(){
              button1(context);
            } ,child: new Text("Go to Screen 2"),)
          ],
        ),
      ) ,
    );
  }
}


class Screen2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Screen 2"),

      ),
      body: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(onPressed:(){
              button2(context);
            } ,child: new Text("Back to Screen 1"),)
          ],
        ),
      ) ,
    );

  }
}


void main() {
  runApp(
    new MaterialApp(
      home: new Screen1(),
      routes: <String, WidgetBuilder> {
        '/screen1': (BuildContext context) => new Screen1(),
        '/screen2' : (BuildContext context) => new Screen2()
      },
    )
  );
}

void button1(BuildContext context){
  print("Button 1");
  Navigator.of(context).pushNamed('/screen2');
}

void button2(BuildContext context){
  print("Button 2");
  Navigator.of(context).pop(true);
}