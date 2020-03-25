import 'package:alphatesting/Components/Heading.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  static const String id = "SignUp";
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Heading(heading: "BristleFront"),
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: Column(
                children: <Widget>[],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
