import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadWidget extends StatefulWidget {
  @override
  _UploadWidgetState createState() => _UploadWidgetState();
}

class _UploadWidgetState extends State<UploadWidget> {
  final _auth = FirebaseAuth.instance;
  var user;
  String buttonValue = 'Upload';
  var downloadURL;
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
    getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: RaisedButton(
            onPressed: _pickSaveImage,
            child: Text(buttonValue),
          ),
        ),
      ),
    );
  }

  Future<String> _pickSaveImage() async {
    final _picker = ImagePicker();
    PickedFile _pickedFile =
        await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      buttonValue = ' Waiting to select Image';
    });
    StorageReference ref =
        FirebaseStorage.instance.ref().child('${user.uid}_${DateTime.now()})');
    setState(() {
      buttonValue = 'Uploading ...';
    });
    final File _file = File(_pickedFile.path);
    StorageUploadTask uploadTask = ref.putFile(_file);
    downloadURL = await (await uploadTask.onComplete).ref.getDownloadURL();
    setState(() {
      buttonValue = 'Upload';
    });
    print("Runtype of download url = ${downloadURL.runtimeType}");
    print("URL = $downloadURL");

    return downloadURL;
  }
}
