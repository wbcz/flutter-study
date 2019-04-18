import 'package:flutter/material.dart';
import 'package:fly/ListView/DemoPage.dart';
import 'package:fly/TabBarPage/TabBarBottomWidget.dart';
import 'package:fly/PullRefresh/PullRefreshLoading.dart';


void main() {
  runApp(new DemoApp());
}

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: new MainPage()
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('title'),
      ),
      body: new Column(
        children: <Widget>[
          new FlatButton(
            color: Colors.blue,
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context)=> new ListDemo()));
            },
            child: new Text('ListView')
          ),
          new FlatButton(
            color: Colors.red,
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context)=> new TabBarBottomPageWidget()));
            },
            child: new Text('TabBarBottomWidget')
          )
        ],
      )
    );
  }
}