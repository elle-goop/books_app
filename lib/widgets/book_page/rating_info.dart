import 'package:flutter/material.dart';
import '../../theme/theme.dart';

class RatingInfo extends StatelessWidget {
  final int starTotal;
  final double rating;
  final double size;
  // final Color color;
  RatingInfo({
    this.starTotal: 5, 
    this.rating = 0, 
    this.size: 19.0})
    : assert(rating <= starTotal),
      assert(rating >= 0);

  Widget buildStar(BuildContext context,int index) {
    // Icon icon;
    if (index >= rating) {
      return Icon(Icons.star, color: Palette.yellowCitrine);
    } else {
      return Icon(Icons.star, color: Palette.brownCafe);
    }
  }
  Widget buildWithHalfStar(BuildContext context,int index) {
    // Icon icon;
    if (index >= rating) {
      return Icon(Icons.star, color: Palette.yellowCitrine);
    } else if (index > rating - 1 && index < rating){
      return Icon(Icons.star_half, color: Palette.brownCafe);
    } else {
      return Icon(Icons.star, color: Palette.brownCafe);
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        starTotal, 
        (index) => buildStar(context,index)),
    );
  }
}