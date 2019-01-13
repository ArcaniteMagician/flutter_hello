import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugPaintSizeEnabled=true;// 开启组件边距
  runApp(MaterialApp(
    title: 'Common Layout Widget',
    home: MyGridViewPage(),
  ));
}

// GridView的练习
class MyGridViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView'),
      ),
      body: _buildGrid(),
    );
  }
}

Widget _buildGrid() {
  return GridView.count(
    crossAxisCount: 2,
    mainAxisSpacing: 4.0,
    crossAxisSpacing: 4.0,
    padding: const EdgeInsets.all(4.0),
    children: _buildGridTileList(4),
  );
}

List<Container> _buildGridTileList(int count) {
  return List<Container>.generate(count, (int index) =>
      Container(
        child: Image.asset(
          index == 0 ? 'images/haibara.jpg' : "images/haibara${index - 1}.jpeg",
          fit: BoxFit.cover,)
      ,));
}

// Container的练习
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.black26,
            // 没有作用
            border: Border.all(color: Colors.black38, width: 10.0),
            // 没有作用
            borderRadius: const BorderRadius.all(Radius.circular(8.0))),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                _getImageExpanded('images/haibara.jpg'),
                _getImageExpanded('images/haibara0.jpeg'),
              ],
            ),
            Row(
              children: <Widget>[
                _getImageExpanded('images/haibara1.jpeg'),
                _getImageExpanded('images/haibara2.jpeg'),
              ],
            )
          ],
        ));
  }
}

Expanded _getImageExpanded(String imagePath) {
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        // 有作用
        border: Border.all(color: Colors.black38, width: 10.0),
        // TODO- 好像没有作用
        borderRadius: const BorderRadius.all(Radius.circular(18.0)),
      ),
      child: Image.asset(imagePath),
      margin: const EdgeInsets.all(4.0),
    ),
  );
}
