import 'dart:typed_data';

import 'package:alphatesting/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class ImageUpload extends StatefulWidget {
  ImageUpload({this.bytes});
  final Uint8List bytes;
  static const String id = "ImageUpload";
  @override
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  var user;
  final _auth = FirebaseAuth.instance;
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: kUniversalThemeColor,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.cloud_upload),
            onPressed: () async {
              final Image _image = Image.memory(widget.bytes);
              final String _path = '/storage/emulated/0/Download';
              StorageReference ref = FirebaseStorage.instance
                  .ref()
                  .child('image_${DateTime.now()})');
              StorageUploadTask uploadTask = ref.putData(widget.bytes);
              var downloadURL =
                  await (await uploadTask.onComplete).ref.getDownloadURL();
              print(downloadURL);
              print(_image.runtimeType);
              print(widget.bytes.length);
            },
          )
        ],
        title: Text(
          'View your image',
          style: TextStyle(
            fontFamily: 'Srisakdi',
            color: kDeveloperCardThemeColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.memory(widget.bytes),
          ],
        ),
      ),
    );
  }
}
