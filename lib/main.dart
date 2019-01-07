import 'package:flutter/material.dart';
import 'custom_widget.dart';

void main() {
  runApp(MaterialApp(title: "Hello Flutter", home: TutorialHome()
//    Center(
//      child: Text(
//        'This is my truly Hello World!',
//        textDirection: TextDirection.rtl,// 不知道这个不同参数的区别
//      ),
//    ),
      ));
}

// stful组件之间的通信方式一：通过使用GlobalKey构造组件，另一组件通过key调用State中的public方法
final countKey = GlobalKey<CounterState>();
// TODO-未实验成功。stful组件之间的通信方式二：通过单值变更通知器ValueNotifier的监听实现
final countNotifier = CountNotifier(0);

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
        child: Column(
          children: <Widget>[
            Text('Hello World'),
            MyButton(),
            Counter(countKey: countKey, countNotifier: countNotifier,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countKey.currentState.increment();
          countNotifier.value--;
        },
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

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        print('MyButton Tap Down, and x = ${details.globalPosition.dx}');
      },
      onTap: () {
        print('MyButton Tap!');
      },
      onDoubleTap: () {
        print('MyButton Double Tap!');
      },
      child: Container(
        height: 36.0,
        padding: const EdgeInsets.all(5.0),
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0), color: Colors.blue[200]),
        child: Center(
          child: Text('Engage'),
        ),
      ),
    );
  }
}
