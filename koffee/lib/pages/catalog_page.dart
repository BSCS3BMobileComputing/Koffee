import 'package:flutter/material.dart';
import '../constants.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => CatalogPageState();
}

class CatalogPageState extends State<CatalogPage> {

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
          Icons.menu_book_rounded,
          size: 200.0,
          color: primaryColorDim,
        ),
        const SizedBox
        (
          height: 8.0,
        ),
        Text
        (
          "Catalog",
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