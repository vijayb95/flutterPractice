import 'package:flutter/material.dart';

class TextControl extends StatelessWidget {
  TextControl(this.indexSet);

  final Function indexSet;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: FlatButton(
        color: Colors.blue,
        onPressed: indexSet,
        child: Text('Press here to change above Text'),
      ),
    );
  }
}
