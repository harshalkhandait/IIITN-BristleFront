import 'dart:io';
import 'dart:typed_data';

import 'package:alphatesting/Components/DrawBar.dart';
import 'package:alphatesting/Screens/ImageUpload.dart';
import 'package:alphatesting/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:painter2/painter2.dart';

final _firestore = Firestore.instance;
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
  bool _imagePresent;
  String buttonValue = 'Upload';
  var downloadURL;
  PainterController _controller;

  var user;

  void getCurrentUser() async {
    try {
      user = await _auth.currentUser();
      if (user != null) {
        print(user.uid);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    _finished = false;
    _signaturePanel = false;
    _controller = newController();
    _imagePresent = false;
  }

  PainterController newController() {
    PainterController controller = PainterController();
    controller.thickness = 5.0;
    controller.backgroundColor = Colors.black;
    return controller;
  }

  @override
  Widget build(BuildContext context) {
    if (downloadURL != null) {
      _imagePresent = true;
    } else {
      _imagePresent = false;
    }
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
                  return ImageUpload(bytes: bytes);
                }),
              );
            }),
      ];
    }
    return Scaffold(
      appBar: _signaturePanel == false
          ? AppBar(
              leading: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                  tooltip: 'Log Out',
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
          ? Container(
              decoration: downloadURL != null
                  ? BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(downloadURL),
                      ),
                    )
                  : BoxDecoration(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  _imagePresent
                      ? Container()
                      : RaisedButton(
                          onPressed: _pickSavedImage,
                          child: Text(buttonValue),
                        ),
                  Center(
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: Painter(_controller),
                    ),
                  ),
                ],
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
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

  Future<String> _pickSavedImage() async {
    final _picker = ImagePicker();
    PickedFile _pickedFile =
        await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      buttonValue = ' Waiting to select Image';
    });
    StorageReference ref =
        FirebaseStorage.instance.ref().child('${user.uid}_${DateTime.now()})');

    final File _file = File(_pickedFile.path);

    StorageUploadTask uploadTask = ref.putFile(_file);
    setState(() {
      buttonValue = 'Uploading ...';
    });
    downloadURL = await (await uploadTask.onComplete).ref.getDownloadURL();
    setState(() {
      buttonValue = 'Upload';
    });
    print("Runtype of download url = ${downloadURL.runtimeType}");
    print("URL = $downloadURL");
    setState(() {});
    return downloadURL;
  }
}
