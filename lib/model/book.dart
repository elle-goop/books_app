class Book {
  final String title;
  final String author;
  final String imageUrl;
  final bool isFavorite;
  final double starRating;
  final double price;
  final int pages;
  
  
  Book({this.title, this.author, this.imageUrl,
    this.isFavorite: false, this.starRating,
    this.pages = 0,
    this.price = 0.0});
}

