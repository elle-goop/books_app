import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'theme/theme.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reader App',
      theme: appTheme,
      home: HomePage(title: 'Design Books'),
    );
  }
}
