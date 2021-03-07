import 'package:flutter/material.dart';

class FindDetailPhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String photoArgs = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Image.network(
        photoArgs,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
