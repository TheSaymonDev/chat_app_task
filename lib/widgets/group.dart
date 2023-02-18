
import 'package:flutter/material.dart';

class Group extends StatelessWidget {
  const Group({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Center(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: Icon(Icons.group, size: 100,),
      ),
    );
  }
}
