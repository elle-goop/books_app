import 'package:flutter/widgets.dart';
import '../theme/theme.dart';

class AppBarTitle extends StatelessWidget {
  final String title;
  AppBarTitle({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 2.0,
            color: Palette.yellowLine,
          )
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
          fontFamily: 'Roboto',
          color: Palette.mainBlack,
        ),
      ),
    );
  }
}