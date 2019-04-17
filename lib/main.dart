import 'package:flutter/material.dart';
import 'package:fly/DemoPage.dart';


void main() {
  runApp(new DemoApp(
    items: new List<String>.generate(10000, (i) => "Item $i"),
  ));
}

class DemoApp extends StatelessWidget {
  List<String> items;

  DemoApp({Key key, @required this.items});

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: DemoPage(items));
  }
}