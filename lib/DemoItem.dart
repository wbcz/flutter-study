import 'package:flutter/material.dart';

class DemoStateWidget extends StatelessWidget{
  String text;

 @override
  Widget build(BuildContext context) {
    return ListTile(
        title: _getBottomItem(),
    );
  }
  __getRowItem(IconData icon, String text) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: new Row(
      ///主轴居中,即是横向居中
      mainAxisAlignment: MainAxisAlignment.center,
      ///大小按照最大充满
      mainAxisSize : MainAxisSize.max,
      ///竖向也居中
      crossAxisAlignment : CrossAxisAlignment.center,
      
      children: <Widget>[
        ///一个图标，大小16.0，灰色
        new Icon(
          icon,
          size: 16.0,
          color: Colors.black,
        ),
        ///间隔
        new Padding(padding: new EdgeInsets.only(left:5.0)),
        ///显示文本
        new Text(
          text,
          //设置字体样式：颜色灰色，字体大小14.0
          style: new TextStyle(color: Colors.black, fontSize: 14.0),
          //超过的省略为...显示
          overflow: TextOverflow.ellipsis,
          //最长一行
          maxLines: 1,
        ),
      ],
    ));
  }
  _getBottomItem() {
    return new Row(
      children: <Widget> [
        __getRowItem(Icons.star,'111'),
        __getRowItem(Icons.star,'222'),
        __getRowItem(Icons.star,'333'),
      ]
    );
}}