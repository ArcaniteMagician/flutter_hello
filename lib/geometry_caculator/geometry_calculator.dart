import 'package:flutter/material.dart';
import 'package:flutter_hello/geometry_caculator/isosceles_right_triangle.dart';

void main() => runApp(MaterialApp(
      home: CalculatorHomePage(),
    ));

class CalculatorHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('这个多长'),
      ),
      body: _ListBody(
        itemList: <_ItemData>[
          _ItemData(Icons.signal_cellular_null, '所有直角三角形', '无'),
          _ItemData(Icons.signal_cellular_null, '等腰直角三角形', '无'),
          _ItemData(
              Icons.signal_cellular_null, '经典2：1直角三角形', '内角分别为30°、60°和90°的三角形'),
          _ItemData(Icons.details, '正三角形', '三个内角都是60°'),
          _ItemData(Icons.watch_later, '圆形内嵌正方形', '无'),
        ],
      ),
    );
  }
}

class _ListBody extends StatelessWidget {
  final List<_ItemData> itemList;

  const _ListBody({Key key, this.itemList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: itemList.map((_ItemData itemData) {
        return _getItem(context, itemData);
      }).toList(),
    );
  }
}

ListTile _getItem(BuildContext context, _ItemData itemData) {
  return ListTile(
    leading: Icon(
      itemData.iconData,
      color: Theme.of(context).primaryColor,
    ),
    title: Text(itemData.title),
    subtitle: Text(itemData.subtitle),
    onTap: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => IsoscelesRightTriangle()));
    },
  );
}

class _ItemData {
  IconData iconData;
  String title;
  String subtitle;

  _ItemData(this.iconData, this.title, this.subtitle);
}
