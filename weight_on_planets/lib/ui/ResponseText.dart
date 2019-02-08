import 'package:flutter/material.dart';

class ResponseText extends StatelessWidget {
  final String weightResult;

  const ResponseText(this.weightResult);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "$weightResult",
          style: TextStyle(
              color: Colors.cyan, fontSize: 20, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
