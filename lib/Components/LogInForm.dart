import 'package:alphatesting/Animations/FadeAnimations.dart';
import 'package:alphatesting/Screens/AccessPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SignInButton.dart';

class FormContainer extends StatefulWidget {
  @override
  _FormContainerState createState() => _FormContainerState();
}

class _FormContainerState extends State<FormContainer> {
  final _auth = FirebaseAuth.instance;

  bool showSpinner = false;

  String email;

  String password;

  final TextEditingController _controllerForUserName =
      new TextEditingController();
  final TextEditingController _controllerForPassword =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    _controllerForUserName.clear();
    _controllerForPassword.clear();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        FadeAnimation(
          1.8,
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(143, 148, 251, .2),
                    blurRadius: 50.0,
                    offset: Offset(0, 10))
              ],
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey[100]),
                    ),
                  ),
                  child: TextField(
                    controller: _controllerForUserName,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email or Phone number",
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    obscureText: true,
                    controller: _controllerForPassword,
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        MaterialButton(
          onPressed: _loginButton,
          child: SignIn(),
        ),
      ],
    );
  }

  void _loginButton() async {
    setState(() {
      showSpinner = true;
    });
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {
        Navigator.pushNamed(context, AccessPage.id);
      } else {
        setState(() {
          showSpinner = false;
        });
      }
      setState(() {
        showSpinner = false;
      });
    } catch (e) {
      print(e);
    }
  }
}
