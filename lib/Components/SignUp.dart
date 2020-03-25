import 'package:alphatesting/Animations/FadeAnimations.dart';
import 'package:alphatesting/Screens/SignUpPage.dart';
import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FadeAnimation(
            1.5,
            Text(
              "Don't have access?",
              style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
            ),
          ),
          FadeAnimation(
            1.5,
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, SignUp.id);
              },
              child: Text(
                " Request Access",
                style: TextStyle(
                    color: Color.fromRGBO(143, 148, 251, 1),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
