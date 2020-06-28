import 'package:alphatesting/Components/Heading.dart';
import 'package:alphatesting/Components/LogInForm.dart';
import 'package:alphatesting/Components/SignUpButton.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginPage extends StatefulWidget {
  static const String id = "Home Page";
  @override
  _LoginPageState createState() => _LoginPageState();
}

bool showSpinner = false;

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Column(
            children: <Widget>[
              Heading(heading: "Virtual Signature System"),
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: Column(
                  children: <Widget>[
                    FormContainer(),
                    SizedBox(
                      height: 70,
                    ),
                    SignUpButton()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
