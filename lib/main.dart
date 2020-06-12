import 'package:alphatesting/Screens/ChatScreen.dart';
import 'package:alphatesting/Screens/Developers.dart';
import 'package:alphatesting/Screens/ImageUpload.dart';
import 'package:flutter/material.dart';

import 'Screens/AccessPage.dart';
import 'Screens/LoginPage.dart';
import 'Screens/SignUpPage.dart';

void main() => runApp(MyApp());

// Login - harshalkhandait@starkindustries.com
// Password - 12345678
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginPage.id,
      routes: {
        AccessPage.id: (context) => AccessPage(),
        ChatScreen.id: (context) => ChatScreen(),
        DeveloperCard.id: (context) => DeveloperCard(),
        LoginPage.id: (context) => LoginPage(),
        ImageUpload.id : (context) => ImageUpload(),
    
        SignUp.id: (context) => SignUp(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
