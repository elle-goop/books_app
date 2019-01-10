import 'package:flutter/material.dart';
import '../../theme/theme.dart';

class BooksContent extends StatelessWidget {
  final Animation<double> opacity;
  final String text;
  BooksContent({this.opacity, this.text: ''});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(17, 31, 17, 31),
      color: Palette.white,
      child: FadeTransition(
        opacity: opacity,
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 14.0,
            height: 2.1,
            color: Palette.greyTextColor
          ),
        ),
      ),
    );
  }
}