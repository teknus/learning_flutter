import 'package:flutter/material.dart';

class ResponseText extends StatelessWidget {
  final String weightResult;

  const ResponseText(this.weightResult);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
       Container( 
			   child:Text(
          			"$weightResult From Vim",
          			style: TextStyle(
              		color: Colors.cyan, fontSize: 16, fontWeight: FontWeight.w500),
        		)
		)
      ],
    );
  }
}
