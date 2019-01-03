import 'package:flutter/material.dart';
import 'custom_widget.dart';

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
          MyAppBar(title: 'Practice Lesson 2',),
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
