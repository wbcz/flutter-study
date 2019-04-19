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

class MainPage extends StatefulWidget {
  MainPage();
  @override
  _MainPage createState() => new _MainPage();
}

class _MainPage extends State<MainPage> {
  int _currentIndex = 0;
  _MainPage(): super();
  __onTabTapped(int index) {
    setState(() {
     _currentIndex = index;
   });
  }
  //TabController _tabController = new TabController(vsync: this, length: _tabItems.length);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // TODO: implement build
    return new Scaffold(
      body: new TabBarBottomPageWidget(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: __onTabTapped, // new
        currentIndex: _currentIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('monitor'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail),
            title: new Text('Warning'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile')
          )
        ],
      ),
      //footer
      // body: ConstrainedBox(
      //     constraints: BoxConstraints.expand(),
      //     child: Stack(
      //       alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
      //       children: <Widget>[
      //         Positioned(
      //           left: 0.0,
      //           bottom: 0,
      //           width: width,
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             textDirection: TextDirection.ltr,
      //             children: <Widget>[
      //               Expanded(
      //                 child: new FlatButton(
      //                   child: new Text('告警'),
      //                   color: Colors.red,
      //                   onPressed: () => {
      //                     Navigator.push(context, new MaterialPageRoute(builder: (context) => new TabBarBottomPageWidget()))
      //                   },
      //                 )
      //               ),
      //               Expanded(
      //                 child: new FlatButton(
      //                   child: new Text('发布'),
      //                   color: Colors.blue,
      //                   onPressed: () => {
      //                     Navigator.push(context, new MaterialPageRoute(builder: (context) => new TabBarBottomPageWidget()))
      //                   },
      //                 )
      //               ),
      //               Expanded(
      //                 child: new FlatButton(
      //                   child: new Text('监控'),
      //                   color: Colors.green,
      //                   onPressed: () => {
      //                     Navigator.push(context, new MaterialPageRoute(builder: (context) => new TabBarBottomPageWidget()))
      //                   },
      //                 )
      //               ),
      //               Expanded(
      //                 child: new FlatButton(
      //                   child: new Text('我的'),
      //                   color: Colors.blue,
      //                   onPressed: () => {
      //                     Navigator.push(context, new MaterialPageRoute(builder: (context) => new TabBarBottomPageWidget()))
      //                   },
      //                 )
      //               ),
      //             ],
      //           )
      //         )     
      //       ]
      //     ),
      //   )
    );
  }
}