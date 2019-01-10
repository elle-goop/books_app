## With bottom fade
Home Page
```dart
body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[

            Column(
              children: <Widget>[
                RatingInfo(rating: 4.5,),
                RatingInfo(rating: 2.2,),
                RatingInfo(rating: 3.8,),
                
              ],
            ),

            // Container(child: BooksGrid(books: books),),

            // TODO: show only when scrolling
            BottomFade(
              colors: [Palette.bgYellowTransparent, Palette.bgYellow], 
              height: 60.0,)
            
          ],
        )
      ),
    );
```
------------
Books page
```dart
SafeArea(
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
                  // child: Container(
                    child: ListView(
                      children: <Widget>[

                        SizeTransition(
                          sizeFactor: sizeAnimation,
                          child: Container(
                            height: sizeAnimation.value,
                          ),
                        ),

                        BooksContent(
                          text: text,
                          opacity: animateOpacity(
                            0.1, 0.6,
                            animationController,
                            interval: Interval(0.0, 0.8, curve: Curves.easeIn)))
                      ],
                    ),
                  // ),
                )
              ],
            ),

            BottomFade(),

          ],
        ),
      ),
    
```