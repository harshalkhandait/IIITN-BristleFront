import 'package:alphatesting/Screens/ChatScreen.dart';
import 'package:alphatesting/Screens/HomePage.dart';
import 'package:alphatesting/Screens/developers.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class AccessPage extends StatefulWidget {
  static const String id = "Access Page";
  @override
  _AccessPageState createState() => _AccessPageState();
}

class _AccessPageState extends State<AccessPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ChatScreen(),
    DeveloperCard(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: kBottomNaviagtionBarIconColor,
        selectedLabelStyle: TextStyle(
          fontStyle: FontStyle.italic,
          color: kChatScreenThemeColor,
          decorationColor: kChatScreenThemeColor,
        ),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Text('Chat Room'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build),
            title: Text('Developers'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
