import 'package:flutter/material.dart';
import 'package:flutter_pet/constants.dart';
import 'package:flutter_pet/navigation.dart';
import 'package:flutter_pet/screen/find_detail.dart';
import 'package:flutter_pet/screen/find_detail_photo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.APP_NAME,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          bodyText1: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.brown[700]),

          bodyText2: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
        ),
      ),
      routes: {
        '/': (context) => Navigation(),
        Constants.FIND_DETAIL: (context) => FindDetail(),
        Constants.FIND_DETAIL_PHOTO: (context) => FindDetailPhoto()
      },
      // home: Navigation(),
    );
  }
}
