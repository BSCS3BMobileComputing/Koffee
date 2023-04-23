import 'package:flutter/material.dart';
import '../constants.dart';

import '../card_carousel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) => ListView.builder
  (
    itemCount: carousels.length,
    itemBuilder: (context, index) => CardCarousel(carousel: carousels[index]),
  );
}