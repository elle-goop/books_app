import 'package:flutter/material.dart';
import '../screens/book_page.dart';
import '../model/book.dart';
import '../theme/theme.dart';

class BooksGrid extends StatelessWidget {
  final List<Book> books;
  final int count;
  final double aspectRatio;
  BooksGrid({this.books, this.count: 3, this.aspectRatio: 10/13});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(10.0),
      crossAxisCount: count,
      childAspectRatio: aspectRatio,
      children: books.map((book){
        return GridTile(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Hero(
              tag: 'books_page_${book.imageUrl}',
              child: Material(
                child: Ink.image(
                  image: AssetImage('assets/books/${book.imageUrl}'),
                  fit: BoxFit.cover,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => BookPage(book: book,))
                      );
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => BookPage(imagePath: path, title: widget.title,)),
                      // );
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return GridView.builder(
  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //       crossAxisCount: count,
  //       childAspectRatio: aspectRatio,
  //     ),
  //     itemBuilder: (context, index) {
  //       var imagePath = books[index].imageUrl;
  //       return GridTile(
  //         child: Padding(
  //           padding: EdgeInsets.all(10.0),
  //           child: Hero(
  //             tag: 'book_page_$imagePath',
  //             child: Material(
  //               child: Ink.image(
  //                 image: AssetImage('assets/books/$imagePath'),
  //                 fit: BoxFit.cover,
  //                 child: InkWell(
  //                   onTap: () {
  //                     // Navigator.push(
  //                     //   context,
  //                     //   MaterialPageRoute(builder: (context) => BookPage(book: books[index])),
  //                     // );
  //                   },
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}