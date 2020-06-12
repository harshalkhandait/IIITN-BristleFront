import 'package:alphatesting/Animations/FadeAnimations.dart';
import 'package:alphatesting/Screens/AccessPage.dart';


import 'package:flutter/material.dart';

class EditSignatureButton extends StatelessWidget {
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
              'Signature isn\'t Correct?',
              style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
            ),
          ),
          FadeAnimation(
            1.5,
            FlatButton(
              onPressed: () {
                Navigator.of(context)
              .popUntil(ModalRoute.withName(AccessPage.id));
              },
              child: Text(
                'New Attempt',
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
