import 'dart:io';
import 'dart:typed_data';

import 'package:alphatesting/Components/Confirmation.dart';
import 'package:alphatesting/Components/EditSignature.dart';
import 'package:alphatesting/Components/UploadButton.dart';
import 'package:alphatesting/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ImageUpload extends StatefulWidget {
  ImageUpload({this.bytes});
  final Uint8List bytes;
  static const String id = "ImageUpload";
  @override
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: kUniversalThemeColor,
        ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                UploadButton(
                  uploadFunction: () {
                    print(File.fromRawPath(widget.bytes));
                  },
                ),
              ],
            ),
            Container(
              child: Image.memory(widget.bytes),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ConfirmationButton(),
                EditSignatureButton(),
              ],
            )
          ],
        ),
      ),
    );
  }

  uploadImage(File image) async {
    StorageReference reference =
        FirebaseStorage.instance.ref().child(image.path.toString());
    StorageUploadTask uploadTask = reference.putFile(image);

    StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);

    String url = (await downloadUrl.ref.getDownloadURL());

    print(url);
  }

  Future<File> getImageFileFromAssets(String path) async {
    final byteData = widget.bytes;

    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    return file;
  }

  // Future<File> getImage() async {
  //   final File _image = Image.memory(widget.bytes);
  //   final String _path = (await getTemporaryDirectory()).path;
  // }
}
