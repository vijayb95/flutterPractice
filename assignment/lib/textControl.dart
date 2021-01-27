import 'package:flutter/material.dart';

class TextControl extends StatelessWidget {
  final Function indexSet;

  TextControl(this.indexSet);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: RaisedButton(
        color: Colors.blue,
        onPressed: indexSet,
        child: Text('Press here to change above Text'),
      ),
    );
  }
}
