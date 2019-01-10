import 'package:flutter/material.dart';
import '../model/book.dart';
import '../widgets/app_bar_title.dart';
import '../widgets/bottom_fade.dart';
import '../widgets/book_page/rating_info.dart';
import '../widgets/book_page/book_info.dart';
import '../widgets/book_page/favorite.dart';
import '../theme/theme.dart';
import '../theme/custom_icons.dart';

class BookPage extends StatefulWidget {
  final Book book;
  BookPage({this.book});

  BookPageState createState() => BookPageState(
    book: book,
  );
}

class BookPageState extends State<BookPage> with SingleTickerProviderStateMixin{
  final Book book;
  BookPageState({this.book});

  final String text = """
  Completely updated and expanded, the second edition of David Airey's Logo Design Love contains more of just about everything that made the first edition so great: more case studies, more sketches, more logos, more tips for working with clients, more insider stories, and more practical information for getting the job and getting it done right.

  In Logo Design Love, David shows you how to develop an iconic brand identity from start to finish, using client case studies from renowned designers. In the process, he reveals how designers create effective briefs, generate ideas, charge for their work, and collaborate with clients. David not only shares his personal experiences working on identity projects - including sketches and
  """;

  AnimationController animationController;
  Animation<double> opacityAnimation;
  Animation<double> sizeAnimation;
  Animation<Offset> bookTitleTransition;

  Animation<Offset> animateOffset(
    {AnimationController controller, 
    Offset begin: Offset.zero, 
    Offset end: Offset.zero, 
    Interval interval}) => Tween<Offset>(
      begin: begin, end: end)
      .animate(CurvedAnimation(
        curve: interval,
        parent: controller,
      ));

  Animation<double> animateOpacity(
    double begin, 
    double end, 
    AnimationController controller, 
    {Interval interval}) => Tween<double>(
        begin: begin, end: end)
        .animate(CurvedAnimation(
          curve: interval,
          parent: controller,
      ));

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    bookTitleTransition = Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset.zero)
      .animate(CurvedAnimation(
        curve: Interval(0.0, 0.5, curve: Curves.easeIn),
        parent: animationController,
      ));

    opacityAnimation = Tween(begin: 0.3, end: 1.0)
      .animate(CurvedAnimation(
        curve: Interval(0.0, 0.5, curve: Curves.easeIn),
        parent: animationController,
      ));

    sizeAnimation = Tween(begin: 400.0, end: 0.0)
      .animate(CurvedAnimation(
        curve: Interval(0.0, 0.5, curve: Curves.fastOutSlowIn),
        parent: animationController,
      ));

    // animationController.addListener((){setState((){});});
    animationController.forward();
    // animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String fullPath = 'assets/books/${book.imageUrl}';
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CustomIcon.arrowb),
          iconSize: 11.0,
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        iconTheme: IconThemeData(
          color: Palette.mainBlack
        ),
        centerTitle: true,
        title: AppBarTitle(title: 'Design Books',),
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
        child: Stack(
          children: <Widget>[

            Column(
              children: <Widget>[
                ///////////////////////////////////////////////
                /////////// ** Books Description START **
                ///////////////////////////////////////////////
                Padding(
                  padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 26.0),
                  child: Column(
                    children: <Widget>[
                      ///////////////////////////////////////////////
                      /////////// ** Slide Transition START **
                      //////////////////////////////////////////////////
                      SizedBox.fromSize(
                        size: Size.fromHeight(130.0),
                        child: Row(
                          children: <Widget>[

                            Flexible(
                              flex: 1,
                              child: Hero(
                                tag: 'books_page_${book.imageUrl}',
                                child: Container(
                                  child: Image.asset(fullPath, fit: BoxFit.cover),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Palette.redShadow,
                                        offset: Offset(0, 20),
                                        blurRadius: 30,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(width: 20.0,),

                            Flexible(
                              flex: 2,
                              child: FadeTransition(
                                opacity: opacityAnimation,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[

                                    SlideTransition(
                                      position: bookTitleTransition,
                                      child: Text(
                                        book.title,
                                        style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),

                                    SlideTransition(
                                      position: animateOffset(
                                        controller: animationController,
                                        begin: Offset(1.0, 0),
                                        interval: Interval(0.1, 0.6, curve: Curves.easeIn)),
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 10.0),
                                        child: Text(
                                          book.author,
                                          style: TextStyle(
                                            color: Palette.yellowGrey,
                                            fontSize: 14,
                                          )),
                                      ),
                                    ),

                                    SlideTransition(
                                      position: animateOffset(
                                        controller: animationController,
                                        begin: Offset(1.0, 0),
                                        interval: Interval(0.3, 0.8, curve: Curves.easeIn)),
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 10.0),
                                        child: Row(
                                          children: <Widget>[

                                            Text(
                                              '\$${book.price}',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Palette.brown,
                                                fontWeight: FontWeight.bold,
                                              ),),

                                            SizedBox(width: 10.0,),

                                            RatingInfo(rating: book.starRating,),
                                            
                                          ],
                                        ),
                                      ),
                                    ),


                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ///////////////////////////////////////////////
                      /////////// ** Slide Transition START **
                      ///////////////////////////////////////////////
                      
                      SizedBox(height: 25.0,),

                      ///////////////////////////////////////////////
                      /////////// ** Fade Transition START **
                      ///////////////////////////////////////////////
                      
                      FadeTransition(
                        opacity: animateOpacity(
                          0.0, 1.0, 
                          animationController,
                          interval: Interval(0.5, 1.0)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[

                              SizedBox(width: 20.0,),

                              Expanded(
                                child: Text(
                                  '${book.pages} pages',
                                  style: TextStyle(
                                    color: Palette.yellowGrey,
                                    fontSize: 14.0,
                                  ),),
                              ),

                              Material(
                                color: Palette.blue,
                                borderRadius: BorderRadius.circular(20.0),
                                child: InkWell(
                                  onTap: () {},
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                          color: Palette.blueShadow,
                                          offset: Offset(0, 7),
                                          blurRadius: 15.0
                                        ),
                                      ],
                                    ),
                                    padding: EdgeInsets.fromLTRB(27, 8, 27, 13),
                                    child: Text(
                                      'BUY IT NOW', 
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold,
                                        color: Palette.white,
                                        fontFamily: 'Roboto',
                                      ),),
                                  ),
                                ),
                              ),

                              SizedBox(width: 2.0,),

                              FavoriteButton(isFavorite: book.isFavorite),
                              
                            ],
                        ),
                      ),
                      ///////////////////////////////////////////////
                      /////////// ** Fade Transition END **
                      ///////////////////////////////////////////////
                    ],
                  ),
                ),
                ///////////////////////////////////////////////
                /////////// ** Books Description END **
                ///////////////////////////////////////////////
                
                ///////////////////////////////////////////////
                /////////// ** Books Scroll Content START **
                ///////////////////////////////////////////////
                ///////////////////////////////////////////////
                /////////// ** Books Scroll Content END **
                ///////////////////////////////////////////////
                Expanded(
                  child: SingleChildScrollView(
                    child: BooksContent(
                        text: text,
                        opacity: animateOpacity(
                          0.1, 0.6,
                          animationController,
                          interval: Interval(0.0, 0.8, curve: Curves.easeIn))),
                  ),
                ),
              ],
            ),

            BottomFade(),

          ],
        ),
      ),
    );
  }
}