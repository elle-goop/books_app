import 'package:flutter/material.dart';
import '../../theme/theme.dart';

class RatingInfoOld extends StatelessWidget {
  final int starTotal;
  final double rating;
  final double size;
  RatingInfoOld({this.starTotal: 5, this.rating, this.size: 19.0})
    : assert(rating <= starTotal),
      assert(rating >= 0);

  // Widget _starsBuilder(int starRating) {
  // }
  @override
  Widget build(BuildContext context) {
    var stars = <Widget>[];
    Icon star;
    for (var i = 1; i <= starTotal; i++) {
      var color = i <= rating ? Palette.brownCafe : Palette.yellowCitrine;
      star = Icon(Icons.star, color: color, size: size);
      // if (!(rating % 1 == 0)) {
      // // if (rating. ) {
      //   star = Icon(Icons.star_half, color: color, size: size);
      // }
      stars.add(star);
    }
    return Row(
      children: stars,
    );
    // return Row(
    //   children: List.generate(starTotal, (int i) => {
    //     return Icon();
    //   }),
    // );
  }
}

class RatingInfo extends StatelessWidget {
  final int starTotal;
  final double rating;
  final double size;
  RatingInfo({this.starTotal: 5, this.rating, this.size: 19.0})
    : assert(rating <= starTotal),
      assert(rating >= 0);

  
  @override
  Widget build(BuildContext context) {
    // var maxRating = rating.ceil();
    // (rating % 1 != 0)
    var maxRating = rating;
    var stars = List.generate(starTotal, (i) {
      while (i < maxRating) {
        if (i >= maxRating && i > (maxRating - 1 )) {
          return Icon(Icons.star_half, color: Palette.brownCafe);
        } else if (i < maxRating) {
        return Icon(Icons.star, color: Palette.brownCafe);
        }
      }
      return Icon(Icons.star, color: Palette.yellowCitrine);
    });
    return Row(
      // children: List.generate(starTotal, (i) {
      //   if (i >= maxRating) {
      //     return Icon(Icons.star, color: Palette.brownCafe);
          
      //   } else if (i > maxRating - 1 && i < maxRating) {
      //     return Icon(Icons.star_half, color: Palette.brownCafe);
      //   } else {
      //     return Icon(Icons.star, color: Palette.yellowCitrine);
      //   }
      // },)
      children: stars,
    );
  }
}