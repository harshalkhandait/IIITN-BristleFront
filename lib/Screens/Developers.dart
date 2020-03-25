import 'package:flutter/material.dart';

import '../constants.dart';

class DeveloperCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 80.0,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/Harshal.png'),
              ),
              Text(
                'Harshal Khandait',
                style: TextStyle(
                  fontFamily: 'Srisakdi',
                  color: kDeveloperCardThemeColor,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  color: kDeveloperCardThemeColor,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5.0,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: kDeveloperCardThemeColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ),
                  child: ListTile(
                    title: Text(
                      '+91 932 588 7800',
                      style: TextStyle(
                        color: kDeveloperCardThemeColor,
                        fontFamily: 'Pacifico',
                        fontSize: 20.0,
                      ),
                    ),
                    leading: Icon(
                      Icons.phone,
                      color: kDeveloperCardThemeColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ),
                  child: ListTile(
                    title: Text(
                      'harshalkhandait799@gmail.com',
                      style: TextStyle(
                        color: kDeveloperCardThemeColor,
                        fontFamily: 'Pacifico',
                        fontSize: 17.0,
                      ),
                    ),
                    leading: Icon(
                      Icons.email,
                      color: kDeveloperCardThemeColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
