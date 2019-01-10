import 'package:flutter/material.dart';
import '../theme/theme.dart';
import '../theme/custom_icons.dart';

import '../widgets/app_bar_title.dart';
import '../widgets/books_grid.dart';
import '../data/data.dart';

class HomePage extends StatefulWidget {
  final String title;
  HomePage({this.title});
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CustomIcon.menu),
          iconSize: 16.0,
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
      elevation: 0,
      iconTheme: IconThemeData(
        color: Palette.mainBlack
      ),
      centerTitle: true,
      title: AppBarTitle(title: widget.title,),
      actions: <Widget>[
        IconButton(
          icon: Icon(CustomIcon.search),
          iconSize: 19.0,
          onPressed: () {},
        ),
      ],
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          child: BooksGrid(books: books),),
      ),
    );
  }
}