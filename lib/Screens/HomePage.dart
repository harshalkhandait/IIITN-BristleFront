import 'package:alphatesting/Components/Confirmation.dart';
import 'package:alphatesting/Components/DrawBar.dart';
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
  bool _signaturePanel;
  bool _finished;
  PainterController _controller;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
    _finished = false;
    _signaturePanel = false;
    _controller = newController();
  }

  PainterController newController() {
    PainterController controller = PainterController();
    controller.thickness = 5.0;
    controller.backgroundColor = Colors.black;
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
    List<Widget> actions;
    if (_finished) {
      actions = <Widget>[
        IconButton(
          icon: Icon(
            Icons.content_copy,
            color: Colors.black,
          ),
          tooltip: 'New Painting',
          onPressed: () => setState(() {
            _finished = false;
            _controller = newController();
          }),
        ),
      ];
    } else {
      actions = <Widget>[
        IconButton(
          icon: Icon(
            Icons.undo,
            color: Colors.black,
          ),
          tooltip: 'Undo',
          onPressed: () {
            if (_controller.canUndo) _controller.undo();
          },
        ),
        IconButton(
          icon: Icon(
            Icons.redo,
            color: Colors.black,
          ),
          tooltip: 'Redo',
          onPressed: () {
            if (_controller.canRedo) _controller.redo();
          },
        ),
        IconButton(
          icon: Icon(
            Icons.delete,
            color: Colors.black,
          ),
          tooltip: 'Clear',
          onPressed: () => _controller.clear(),
        ),
        IconButton(
            icon: Icon(
              Icons.check,
              color: Colors.black,
            ),
            onPressed: () async {
              setState(() {
                _finished = true;
              });
              Uint8List bytes = await _controller.exportAsPNGBytes();
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: Text(
                        'View your image',
                        style: TextStyle(
                          fontFamily: 'Srisakdi',
                          color: kDeveloperCardThemeColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      backgroundColor: Colors.white,
                    ),
                    body: Container(
                      child: Image.memory(bytes),
                    ),
                  );
                }),
              );
            }),
      ];
    }
    return Scaffold(
      appBar: _signaturePanel == false
          ? AppBar(
              leading: IconButton(
                  tooltip: 'Log Out',
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
            )
          : AppBar(
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
              actions: actions,
              title: Text(
                'Signature Access Page',
                style: TextStyle(
                  fontFamily: 'Srisakdi',
                  color: kDeveloperCardThemeColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              bottom: PreferredSize(
                child: DrawBar(_controller),
                preferredSize: Size(MediaQuery.of(context).size.width, 30.0),
              ),
            ),
      body: _signaturePanel == true
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: Painter(_controller),
                  ),
                ),
                ConfirmationButton(),
              ],
            )
          : Column(
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
                      GestureDetector(
                        onTap: enableSignaturePanel,
                        child: Icon(
                          Icons.power_settings_new,
                          size: 160,
                          color: Colors.grey,
                        ),
                      )
                      //Icons.power_settings_new,
                    ],
                  ),
                ),
                ConfirmationButton(),
              ],
            ),
    );
  }

  enableSignaturePanel() {
    setState(() {
      _signaturePanel = true;
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
