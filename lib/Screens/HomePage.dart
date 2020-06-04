import 'package:alphatesting/Components/Confirmation.dart';
import 'package:alphatesting/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:painter2/painter2.dart';
import 'dart:typed_data';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
final _firestore = Firestore.instance;
final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;
FirebaseUser loggedInUser;

class HomePage extends StatefulWidget {
  static const String id = "Home Page";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  bool signaturePanel;
  bool _finished;
  PainterController _controller;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
    _finished = false;
    signaturePanel = false
    _controller = newController();
  }

PainterController newController() {
    PainterController controller = PainterController();
    controller.thickness = 5.0;
    controller.backgroundColor = Colors.white;
    return controller;
  }
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(user.uid);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
      signaturePanel == false?
      AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.black,
            ),
            onPressed: () {
              _auth.signOut();
              Navigator.pop(context);
            }),
        backgroundColor: Colors.white,
        title: Text(
          'Signature Access Page',
          style: TextStyle(
            fontFamily: 'Srisakdi',
            color: kDeveloperCardThemeColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ):Container(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                signaturePanel == false
                    ? GestureDetector(
                        onTap: enableSignaturePanel,
                        child: Icon(
                          Icons.power_settings_new,
                          size: 160,
                          color: Colors.grey,
                        ),
                      )
                    : ,
                //Icons.power_settings_new,
              ],
            ),
          ),
          ConfirmationButton(),
        ],
      ),
    );
  }
  enableSignaturePanel(){
    setState(() {
      signaturePanel = true;
    });
  }
  setBit() {
    _firestore.collection('buttonStatusBit').add({
      'onStatus': true,
      'time': DateTime.now(),
      'signaturePhotoLink': '',
      'userName': loggedInUser.uid,
    });
  }
}
