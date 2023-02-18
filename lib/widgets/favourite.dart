
import 'package:flutter/material.dart';

class Favourite extends StatelessWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: Icon(Icons.favorite_border, size: 100,),
      ),
    );
  }
}
