// 1) Create a new Flutter App (in this project) and output an AppBar and some text
// below it
// 2) Add a button which changes the text (to any other text of your choice)
// 3) Split the app into three widgets: App, TextControl & Text

import 'package:flutter/material.dart';

import 'package:assignment/text.dart';
import 'package:assignment/textControl.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int ind = 0;
  final texts = ['This is first', 'This is second'];

  int _indSet() {
    setState(() {
      ind == 0 ? ind = 1 : ind = 0;
    });
    print(ind);
    return ind;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Assignment 1'),
          ),
          // body: Textclass(texts[ind]),
          // bottomNavigationBar: TextControl(_indSet),
          body: Center(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  width: 500,
                  height: 150,
                  child: Textclass(texts[ind]),
                ),
                Container(
                  child: TextControl(_indSet),
                )
              ],
            ),
          )),
    );
  }
}
