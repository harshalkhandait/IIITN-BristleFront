import 'package:alphatesting/Animations/FadeAnimations.dart';
import 'package:alphatesting/Screens/HomePage.dart';

import 'package:flutter/material.dart';

class ConfirmationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FadeAnimation(
            1.5,
            Text(
              'Not Sure about the decision?',
              style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
            ),
          ),
          FadeAnimation(
            1.5,
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, HomePage.id);
              },
              child: Text(
                'Return Later',
                style: TextStyle(
                    color: Color.fromRGBO(143, 148, 251, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
