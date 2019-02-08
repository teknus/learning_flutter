import 'package:flutter/material.dart';
import 'package:weight_on_planets/ui/ResponseText.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _planetControl = TextEditingController();
  String _weight_result = "Please enter Weight";
  int _radioValue = -1;
  String _planet = "Earth";

  void handle_radio_value(int value) => setState(() {
      _radioValue = value;
      var gravity = 1.0;
      if(_planetControl.text.isNotEmpty){
      var massOnEarth = num.parse(_planetControl.text);
      switch (_radioValue) {
        case 0 :
            gravity = 0.72;
            _planet = "Venus";
          break;
        case 1 :
            gravity = 1.12;
            _planet = "Neptune";
          break;
       case 2 :
            gravity = 0.38;
            _planet = "Mars";
          break;
        default:
            gravity = 1;
      }
      var _result = calculateWeight(massOnEarth, gravity);
      _weight_result = "Your Weigth on $_planet is $_result";
      } else{
        _weight_result = "Please enter Weight";
      }
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weight On Planet X"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
          alignment: Alignment.topCenter,
          child: ListView(padding: EdgeInsets.all(2.5), children: <Widget>[
            Image.asset('images/planet.png', width: 120.0, height: 120.0),
            Container(
              margin: EdgeInsets.all(3.0),
              alignment: Alignment.center,
              height: 180.0,
              width: 380.0,
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _planetControl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "Your weight please",
                        icon: Icon(Icons.person)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                  ), //Space Between TextField and Radio Buttons

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio<int>(
                        activeColor: Colors.orangeAccent,
                        value: 0,
                        groupValue: _radioValue,
                        onChanged: handle_radio_value,
                      ),
                      Text(
                        "Venus",//0.72
                        style: TextStyle(color: Colors.white30),
                      ),
                      Radio<int>(
                        activeColor: Colors.blueAccent,
                        value: 1,
                        groupValue: _radioValue,
                        onChanged: handle_radio_value,
                      ),
                      Text(
                        "Neptune", //1.19
                        style: TextStyle(color: Colors.white30),
                      ),
                      Radio<int>(
                        activeColor: Colors.redAccent,
                        value: 2,
                        groupValue: _radioValue,
                        onChanged: handle_radio_value,
                      ),
                      Text(
                        "Mars",//0.38
                        style: TextStyle(color: Colors.white30),
                      ),
                    ],
                  )
                ],
              ),
            ),
            ResponseText(_weight_result)
          ])),
    );
  }
}

String calculateWeight(num massOnEarth, gravity){
    if(massOnEarth > 0){
      return (massOnEarth * gravity).toStringAsFixed(2);
    } return 0.toString();
}