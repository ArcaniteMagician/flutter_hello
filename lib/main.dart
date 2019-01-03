import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Hello Flutter", home: MyScaffold()
//    Center(
//      child: Text(
//        'This is my truely Hello World!',
//        textDirection: TextDirection.rtl,// 不知道这个不同参数的区别
//      ),
//    ),
      ));
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          MyAppBar(
            wTitle: Text(
              'Practice',
              textDirection: TextDirection.ltr,
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          Expanded(
            child: Text(
              'This is my truely Hello World!',
              textDirection: TextDirection.ltr,
            ),
          )
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  final Widget wTitle;

  MyAppBar({this.wTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      decoration: BoxDecoration(color: Colors.blue[200]),
      // 中括号里只能填写小于1000的100的整数，数值越大颜色越深，具体意思未知
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation Menu',
            onPressed: null,
          ),
          Expanded(
            child: wTitle,
          ),
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          )
        ],
      ),
    );
  }
}
