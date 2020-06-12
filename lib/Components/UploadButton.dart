import 'package:alphatesting/Animations/FadeAnimations.dart';
import 'package:flutter/material.dart';

class UploadButton extends StatelessWidget {
  UploadButton({this.uploadFunction});
  final Function uploadFunction;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FadeAnimation(
            1.5,
            Text(
              'Are you Sure?',
              style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
            ),
          ),
          FadeAnimation(
            1.5,
            FlatButton(
              onPressed: uploadFunction,
              child: Text(
                'Upload',
                style: TextStyle(
                    color: Color.fromRGBO(143, 148, 251, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

//  Future<Uri> _pickSaveImage(String imageId) async {
//    StorageReference ref =
//        FirebaseStorage.instance.ref().child(imageId).child("image.jpg");
//    StorageUploadTask uploadTask = ref.putFile(imageFile);
//    return (await uploadTask.future).downloadUrl;
//  }
}
