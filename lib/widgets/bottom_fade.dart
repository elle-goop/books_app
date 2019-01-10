import 'package:flutter/material.dart';
import '../theme/theme.dart';

class BottomFade extends StatelessWidget {
  final double height;
  final List<Color> colors;
  BottomFade({this.colors: const [Palette.whiteTransparent, Palette.white], this.height: 50.0});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox.fromSize(
        size: Size.fromHeight(height),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 1.0]
            ),
          ),
        ),
      ),
    );
  }
}