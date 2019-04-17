import 'package:flutter/material.dart';
import 'package:fly/DemoItem.dart';

class DemoPage extends StatefulWidget {
  List<String> items;
  DemoPage(this.items);

  @override
  _DemoPageState createState() => _DemoPageState(this.items);
}

class _DemoPageState extends State<DemoPage> {
  List<String> items;
  _DemoPageState(this.items);
  @override
  Widget build(BuildContext context) {
    ///一个页面的开始
    ///如果是新页面，会自带返回按键
    return new Scaffold(
      ///背景样式
      backgroundColor: Colors.blue,
      ///标题栏，当然不仅仅是标题栏
      appBar: new AppBar(
        ///这个title是一个Widget
        title: new Text("DEMO"),
      ),
      ///正式的页面开始
      ///一个ListView，20个Item
      body: new ListView.builder(
        itemBuilder: (context, index) {
          return new DemoStateWidget();
        },
        itemCount: items.length
      ),
    );
  }
}