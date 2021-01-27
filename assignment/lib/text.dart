import 'package:flutter/material.dart';

// import './main.dart';

class Textclass extends StatelessWidget {
  Textclass(this.out);

  final String out;

  @override
  Widget build(BuildContext context) {
    // return Container(child: Text('This is changeable'));
    return Center(
      child: Text(out, style: TextStyle(fontSize: 25),),
    );
  }
}
