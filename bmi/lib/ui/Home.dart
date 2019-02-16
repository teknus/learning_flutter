import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }}

  class HomeState  extends State {
	Color pinkTheme = Color.fromRGBO(204,29,184,1.0);
    
	final TextEditingController _ageControl = new TextEditingController();
	final TextEditingController _weightControl = new TextEditingController();
	final TextEditingController _heightControl = new TextEditingController();
	
	String _result = "Please enter your data";
	String stage = "";

	void _calculate () => setState((){
		if(_ageControl.text.isNotEmpty && 
		   _weightControl.text.isNotEmpty && 
		   _heightControl.text.isNotEmpty){
			num calculate_result = bmi(num.parse(_heightControl.text),num.parse(_weightControl.text));
			if(calculate_result < 18.5){
				stage = "Under Weight";
			} else if (calculate_result < 25){
				stage = "Normal Weight";
			}else if (calculate_result < 30){
			    stage = "Over Weight";
			}else{
				stage = "Obese";
			}
			_result = "Your BMI is ${calculate_result.toStringAsFixed(2)}";
		} else{
			_result = "Please enter your data";
		   stage = "";
		}
	
	});

	@override
    Widget build(BuildContext context) {
          return Scaffold(
            appBar: new AppBar(
              title: Text("BMI"),
              centerTitle: true,
              backgroundColor: pinkTheme,
            ),
			backgroundColor: Colors.white,
			body: new Container(
				alignment: Alignment.center,
				child: ListView(
					padding: EdgeInsets.all(4),
					children: <Widget>[
						Image.asset('images/bmilogo.png',width:120, height:120),
						TextField(
							controller: _ageControl,
							keyboardType: TextInputType.number,
							decoration: InputDecoration(
							hintText: "Age",
							icon: Icon(Icons.person)),
						),
						TextField(
							controller: _heightControl,
							keyboardType: TextInputType.number,
							decoration: InputDecoration(
							hintText: "Height in meters",
							icon: Icon(Icons.insert_chart)),
						),
						TextField(
							controller: _weightControl,
							keyboardType: TextInputType.number,
							decoration: InputDecoration(
							hintText: "Weight in kg",
							icon: Icon(Icons.line_weight)),
						),
						SizedBox(
								width: 40.0,
								height: 10.0,
						),
						Container(
							alignment: Alignment.center,
							child: Text(
	          					"$_result",
	        					style: TextStyle(
	             				color: pinkTheme, fontSize: 16, fontWeight: FontWeight.w500),
							)
						),
						Container(
							alignment: Alignment.center,
							child: Text(
	          					"$stage",
	        					style: TextStyle(
	             				color: pinkTheme, fontSize: 16, fontWeight: FontWeight.w500),
							)
						),
						SizedBox(
							width: 40.0,
							height: 10.0,
						),
						Container(
  			                height: 50.0,
			                width: 20.0,
							child: RaisedButton(
							 onPressed: _calculate,
							 color: pinkTheme,
							 child: Text(
									"Calculate",
									style: TextStyle(
										color: Colors.white,
									)
							 	),
							)
					   	),
					],
				),
			),
          );
    }
 }

num bmi (num height, weight){
	return weight/(height * height);
}
