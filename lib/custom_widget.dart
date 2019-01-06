import 'package:flutter/material.dart';

// 无状态变化的组件，所有成员变量必须是final的
class MyAppBar extends StatelessWidget {
  final Widget wTitle;
  final String title;

  MyAppBar({this.wTitle, this.title});

  @override
  Widget build(BuildContext context) {
    if (wTitle != null) {
      return getTitleContainer(wTitle);
    } else {
      return getTitleContainer(
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              tooltip: 'Navigation Menu',
              onPressed: null,
            ),
            Expanded(
              child: Text(
                title,
                textDirection: TextDirection.ltr,
                style: Theme.of(context).primaryTextTheme.title,
              ),
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
}

Container getTitleContainer(Widget child) {
  return Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      // 中括号里只能填写小于1000的100的整数，数值越大颜色越深，具体意思未知
      decoration: BoxDecoration(color: Colors.blue[200]),
      child: child);
}

// Counter
class Counter extends StatefulWidget {
  _CounterState state;

  @override
  _CounterState createState() {
    state = _CounterState();
    return state;
  }

  void add() {
    state.increment();
  }
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Counter: $_counter'),
    );
  }
}
