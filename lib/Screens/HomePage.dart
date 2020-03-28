import 'package:alphatesting/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

final _firestore = Firestore.instance;
final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;
FirebaseUser loggedInUser;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final messageTextController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 28,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: setBit,
                child: Ink(
                  child: Icon(
                    Icons.power_settings_new,
                    size: 160,
                  ),
                ),
              ),
              //Icons.power_settings_new,
            ],
          ),
          Text(
            'Power Button',
            style: TextStyle(
              fontFamily: 'Srisakdi',
              color: kDeveloperCardThemeColor,
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
          ),
          SizedBox(
            height: 38,
          ),
        ],
      ),
    );
  }

  setBit() {
    _firestore.collection('buttonStatusBit').add({
      'onStatus': true,
      'time': DateTime.now(),
    });
  }
}
