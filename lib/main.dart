import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'theme/theme.dart';


void main() => runApp(App());

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reader App',
      // theme: AppTheme,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        primaryColor: Palette.bgYellow,
        accentColor: Colors.green[500],
        scaffoldBackgroundColor: Palette.bgYellow,
        iconTheme: IconThemeData(
          color: Palette.mainBlack,
        ),
      ),
      home: HomePage(title: 'Design Books'),
    );
  }
}
