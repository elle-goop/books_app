import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/book_page.dart';
import 'theme/theme.dart';


void main() => runApp(App());

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reader App',
      // theme: AppTheme,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        primaryColor: Palette.bgYellow,
        // primaryColorBrightness: Brightness.light,
        accentColor: Colors.green[500],
        // accentColorBrightness: Brightness.light,
        scaffoldBackgroundColor: Palette.bgYellow,
        iconTheme: IconThemeData(
          // color: Palette.mainBlack,
          color: Colors.green[500],
        ),
      ),
      home: HomePage(title: 'Design Books'),
    );
  }
}
