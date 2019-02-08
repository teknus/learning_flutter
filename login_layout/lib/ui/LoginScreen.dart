import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Login();
}

class Login extends State<LoginScreen> {
  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  String _welcome = "Welcome!";

  void clean(){
    setState(() {
      _userController.clear();
      _passwordController.clear();
      _welcome = "Welcome!";
    });
  }

  void welcome_update(){
    setState(() {
     if( _userController.text.isNotEmpty && _passwordController.text.isNotEmpty){
       var _text = _userController.text;
       _welcome = " Welcome $_text!";
     } else {
       _welcome = "Im sorry, try again";
     }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      backgroundColor: Colors.white,
      body: new Container(
        alignment: Alignment.center,
        child: new ListView(
          children: <Widget>[
            new Image.asset(
              'images/face.png',
              width: 90.0,
              height: 90.0,
              color: Colors.cyan,
            ),
            new Container(
                height: 180.0,
                width: 380.0,
                color: Colors.white,
                child: new Column(
                  children: <Widget>[
                    new TextField(
                        controller: _userController,
                        decoration: new InputDecoration(
                          hintText: "User Name",
                          icon: new Icon(Icons.person),
                        )),
                    new TextField(
                      controller: _passwordController,
                      decoration: new InputDecoration(
                        hintText: "Password",
                        icon: new Icon(Icons.lock),
                      ),
                      obscureText: true,
                    ),
                    new Padding(
                      padding: new EdgeInsets.all(10),
                    ),
                    new Center(
                      child: new Row(
                        children: <Widget>[
                          // Login
                          new Container(
                            margin: const EdgeInsets.only(left: 38.0),
                            child: new RaisedButton(
                              onPressed: welcome_update,
                              color: Colors.cyan,
                              child: new Text(
                                "Login",
                                style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                          //Clear
                          new Container(
                            margin: const EdgeInsets.only(left: 120.0),
                            child: new RaisedButton(
                              onPressed: clean,
                              color: Colors.cyan,
                              child: new Text(
                                "Clear",
                                style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "$_welcome",
                  style: new TextStyle(
                      color: Colors.cyan,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
