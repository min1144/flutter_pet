import 'package:flutter/material.dart';
import 'package:flutter_pet/constants.dart';
import 'package:flutter_pet/navigation.dart';

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
      ),
      routes: {

      },




      home: Navigation(),
    );
  }
}
