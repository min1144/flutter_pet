import 'package:flutter/material.dart';

class HospitalInfoView extends StatelessWidget {
  final String text;
  final double topMargin;
  final double bottomMargin;
  final TextStyle textStyle;

  static const ITEM_MARGIN = 20.0;

  HospitalInfoView(this.text, this.textStyle, this.topMargin, this.bottomMargin);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: ITEM_MARGIN,
          top: topMargin,
          right: ITEM_MARGIN,
          bottom: bottomMargin),
      child: Text(
        text,
        style: textStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
