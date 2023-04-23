import 'package:flutter/material.dart';
import '../constants.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => CartPageState();
}

class CartPageState extends State<CartPage> {

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
          Icons.shopping_cart_rounded,
          size: 200.0,
          color: primaryColorDim,
        ),
        const SizedBox
        (
          height: 8.0,
        ),
        Text
        (
          "Cart",
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