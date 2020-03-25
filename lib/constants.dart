import 'package:flutter/material.dart';

TextStyle kSendButtonTextStyle = TextStyle(
  color: kChatScreenThemeColor,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

InputDecoration kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

BoxDecoration kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: kChatScreenThemeColor, width: 2.0),
  ),
);

Color kUniversalThemeColor = Color.fromRGBO(143, 148, 251, 1);
IconThemeData kBottomNaviagtionBarIconColor =
    IconThemeData(color: kUniversalThemeColor);
Color kDeveloperCardThemeColor = kUniversalThemeColor;
Color kChatScreenThemeColor = kUniversalThemeColor;
Color kHomeScreenThemeColor = kUniversalThemeColor;

TextStyle kBottomNaviagtionBarLabelColor =
    TextStyle(color: kUniversalThemeColor);
