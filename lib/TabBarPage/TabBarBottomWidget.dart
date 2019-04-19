  
import 'package:flutter/material.dart';
import 'package:fly/TabBarPage/components/TabBarWidget.dart';
import 'package:fly/TabBarPage/components/TabBarPage1.dart';
import 'package:fly/TabBarPage/components/TabBarPage2.dart';

/**
 * Created by guoshuyu
 * on 2018/7/29.
 */

class TabBarBottomPageWidget extends StatefulWidget {
  @override
  _TabBarBottomPageWidgetState createState() => _TabBarBottomPageWidgetState();
}

class _TabBarBottomPageWidgetState extends State<TabBarBottomPageWidget> {
  final PageController topPageControl = new PageController();


  final List<String> tab = ["30m","1h","3h","6h","1d", "7d"];

  _renderTab() {
    List<Widget> list = new List();
    for (int i = 0; i < tab.length; i++) {
      list.add(new FlatButton(onPressed: () {
        topPageControl.jumpTo(MediaQuery
            .of(context)
            .size
            .width * i);
      }, child: new Text(
        tab[i],
        maxLines: 1,
      )));
    }
    return list;
  }

  _renderPage() {
    return [
      new TabBarPage2(
        time: "30m"
      ),
      new TabBarPage2(
        time: "1h"
      ),
      new TabBarPage2(
        time: "3h"
      ),
      new TabBarPage2(
        time: "6h"
      ),
      new TabBarPage2(
        time: "1d"
      ),
      new TabBarPage2(
        time: "7d"
      )
    ];
  }


  @override
  Widget build(BuildContext context) {
    return new TabBarWidget(
        type: TabBarWidget.TOP_TAB,
        ///渲染tab
        tabItems: _renderTab(),
        ///渲染页面
        tabViews: _renderPage(),
        topPageControl: topPageControl,
        backgroundColor: Colors.black45,
        indicatorColor: Colors.red,
        title: new Text("release"));
  }
}
