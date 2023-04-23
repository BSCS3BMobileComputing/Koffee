import 'package:flutter/material.dart';
import '../constants.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => FavoritesPageState();
}

class FavoritesPageState extends State<FavoritesPage> {

  @override
  Widget build(BuildContext context) => Center
  (
    child: Column
    (
      mainAxisAlignment: MainAxisAlignment.center,
      children:
      [
        Icon
        (
          Icons.favorite_rounded,
          size: 200.0,
          color: primaryColorDim,
        ),
        const SizedBox
        (
          height: 8.0,
        ),
        Text
        (
          "Favorites",
          style: TextStyle 
          (
            fontSize: 50.0,
            fontWeight: FontWeight.bold,
            color: primaryColorDim,
          ),
        )
      ],
    ),
  );
}