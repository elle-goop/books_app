import 'package:flutter/material.dart';
import '../../theme/theme.dart';

class FavoriteButton extends StatefulWidget {
  final bool isFavorite;
  FavoriteButton({this.isFavorite});
  FavoriteButtonState createState() => 
    FavoriteButtonState(isFavorite: isFavorite);
}

class FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite;
  double size;
  FavoriteButtonState({this.isFavorite, this.size: 36});

  void toggleFavorite() {
    setState(() {
      isFavorite = isFavorite ? false : true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: toggleFavorite,
      elevation: 0,
      highlightElevation: 0,
      fillColor: Palette.red,
      child: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border, 
        color: Palette.white
      ),
      constraints: BoxConstraints(minHeight: size, minWidth: size),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      materialTapTargetSize: MaterialTapTargetSize.padded,
    );
  }
}