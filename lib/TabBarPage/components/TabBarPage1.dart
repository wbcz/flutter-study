import 'package:flutter/material.dart';
import 'package:fly/common/api/http.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class TabBarPage1 extends StatefulWidget {
  @override
  _TabBarPage1State createState() => _TabBarPage1State();
}
class _TabBarPage1State extends State<TabBarPage1> with AutomaticKeepAliveClientMixin {
  final _suggestions = <String>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  List<int> items = List.generate(15, (i) => i);
  ScrollController _scrollController = new ScrollController();
  bool isPerformingRequest = false;

  _getMoreData() async {
    List<int> newEntries = await fakeRequest(items.length, items.length + 15);
    if(items.length > 40) {
      double edge = 50.0;
      double offsetFromBottom = _scrollController.position.maxScrollExtent - _scrollController.position.pixels;
      if (offsetFromBottom < edge) {
        _scrollController.animateTo(
            _scrollController.offset - (edge -offsetFromBottom),
            duration: new Duration(milliseconds: 500),
            curve: Curves.easeOut);
        setState(() {
          isPerformingRequest = false;
        });
      }
    } else {
      setState(() {
        items.addAll(newEntries);
        isPerformingRequest = false;
      });
    }
  }

  _getLoadData() {
    if(!isPerformingRequest) {
      setState(() => isPerformingRequest = true);
      _getMoreData();
    }
  }

  _getPullData() {
    _getMoreData();
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _getLoadData();
      }
    });
  }


  Widget _buildRow(index) {
    return new ListTile(
      title: new Text("火车票 $index")
    );
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isPerformingRequest ? 1.0 : 0.0,
          child: SpinKitFadingCircle(
            itemBuilder: (_, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: index.isEven ? Colors.red : Colors.green,
                ),
              );
            },
          )
        ),
      ),
    );
  }

  Widget _buildSuggestions() {
    return new RefreshIndicator(
      onRefresh: () => _refresh(),
      child: new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, index) {
          if(index == items.length) {
            return _buildProgressIndicator();
          } else {
            return _buildRow(index);
          }
        },
        itemCount: items.length + 1,
        controller: _scrollController,
      )
    );
        
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); // See AutomaticKeepAliveClientMixin.
    return _buildSuggestions();
  }
  Future<Null> _refresh() async {
    items.clear();
    await _getPullData();
    return;
  }
}
