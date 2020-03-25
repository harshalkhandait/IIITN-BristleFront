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
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => HomePage(),
        AccessPage.id: (context) => AccessPage(),
        SignUp.id: (context) => SignUp(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
