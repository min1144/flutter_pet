import 'package:flutter/material.dart';

class AnimalDetailView extends StatelessWidget {
  final String title;
  final String content;

  final TextStyle TITLE_STYLE = TextStyle(color: Colors.grey[700], fontSize: 14.0, fontWeight: FontWeight.bold);
  final TextStyle CONTENT_STYLE = TextStyle(color: Colors.grey[700], fontSize: 14.0);

  AnimalDetailView(this.title, this.content);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(title, style: TITLE_STYLE),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(content, style: CONTENT_STYLE),
        ),
      ],
    );
  }
}
