import 'package:flutter/material.dart';

class Spam extends StatelessWidget {
  const Spam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Center(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: Icon(Icons.announcement_outlined, size: 100,),
      ),
    );
  }
}
