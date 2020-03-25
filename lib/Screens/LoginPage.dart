import 'package:alphatesting/Components/Form.dart';
import 'package:alphatesting/Components/Heading.dart';
import 'package:alphatesting/Components/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class HomePage extends StatefulWidget {
  static const String id = "Home Page";
  @override
  _HomePageState createState() => _HomePageState();
}

bool showSpinner = false;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Column(
            children: <Widget>[
              Heading(heading: "BristleFront"),
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
