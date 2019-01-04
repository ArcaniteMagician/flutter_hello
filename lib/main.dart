import 'package:flutter/material.dart';
import 'custom_widget.dart';

void main() {
  runApp(MaterialApp(title: "Hello Flutter", home: TutorialHome()
//    Center(
//      child: Text(
//        'This is my truely Hello World!',
//        textDirection: TextDirection.rtl,// 不知道这个不同参数的区别
//      ),
//    ),
      ));
}

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null),
        title: Text('Tutorial'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          )
        ],
      ),
      body: Center(
        child: Text('Hello World'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add
            // 这个child难道默认就是个IconButton？
//        IconButton(
//          icon: Icon(Icons.add),
//          onPressed: null,
//          tooltip: 'Add',
            ),
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          MyAppBar(
            title: 'Practice Lesson 2',
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
