import 'package:flutter/material.dart';
import '../constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {

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
          Icons.person_rounded,
          size: 200.0,
          color: primaryColorDim,
        ),
        const SizedBox
        (
          height: 8.0,
        ),
        Text
        (
          "Profile",
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