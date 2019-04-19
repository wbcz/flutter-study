import 'package:flutter/material.dart';

class TabBarPage2 extends StatefulWidget {

  String time;
  TabBarPage2({
    Key key,
    this.time
  });

  @override
  _TabBarPage2State createState() => _TabBarPage2State(time);
}

class _TabBarPage2State extends State<TabBarPage2> with AutomaticKeepAliveClientMixin {

  // final _suggestions = <String,Object> {};
  var gifts = new Map();
  final _biggerFont = const TextStyle(fontSize: 18.0);
  String _time;
  _TabBarPage2State(
    this._time
  ): super();

  Widget __getRowItem(IconData icon, String text) {
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
      )
    );
  }

  // Widget _buildRow(String pair) {
  //   return new Column(
  //     children: <Widget> [
  //       Flex(
  //         direction: Axis.horizontal,
  //         children: <Widget>[
  //           Expanded(
  //             flex: 1,
  //             child: Container(
  //               height: 50.0,
  //               color: Colors.blueGrey,
  //             ),
  //           ),
  //           Expanded(
  //             flex: 1,
  //             child: Container(
  //               height: 50.0,
  //               color: Colors.green,
  //               child: new Text("火车票")
  //             ),
  //           ),
  //         ],
  //       ),
  //       // __getRowItem(Icons.star,'111'),
  //       // __getRowItem(Icons.star,'111')
  //     ]
  //   );
  // }
  Widget _buildRow(int index) {
    double width = MediaQuery.of(context).size.width;
    return Wrap(
      //spacing: width/9, // 主轴(水平)方向间距
      //runSpacing: 4.0, // 纵轴（垂直）方向间距
      alignment: WrapAlignment.start, //沿主轴方向居中
      children: <Widget>[
        new Container(
          margin:  new EdgeInsets.only(left:width*1/36, right: width*1/36),
          color: Colors.green,
          width: width*4/9,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Padding(padding: new EdgeInsets.only(left:10.0)),
                new Text(gifts['2n-key']),
                new FlatButton(
                  shape: CircleBorder(),
                  onPressed: (){},
                  color: Colors.blue,
                  child: Text(gifts['2n-count']),
                ),
              ],
            ),
          )
        ),
        new Container(
          margin:  new EdgeInsets.only(left:width*1/36, right: width*1/36),
          color: Colors.blueGrey,
          width: width*4/9,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Padding(padding: new EdgeInsets.only(left:10.0)),
                new Text(gifts['2n+1-key']),
                new FlatButton(
                  shape: CircleBorder(),
                  onPressed: (){},
                  color: Colors.blue,
                  child: Text(gifts['2n+1-count']),
                ),
              ],
            ),
          )
        ),
        // new Chip(
        //   padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        //   labelPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        //   label: new Text('Hamilcccc', style: TextStyle(fontSize: 18)),
        //   avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('23')),
        // )
      ],
    );
  }


  Widget _buildSuggestions() {
    return new ListView.builder(
        //padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, index) {
           gifts['2n-key'] = 'xcy';
           gifts['2n-count'] = '123';
           gifts['2n+1-key'] = 'xls';
           gifts['2n+1-count'] = '456';
          return _buildRow(index);
        });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); // See AutomaticKeepAliveClientMixin.
    return _buildSuggestions();
  }
}