import 'package:flutter/material.dart';

class IsoscelesRightTriangle extends StatefulWidget {
  @override
  _IsoscelesRightTriangleState createState() => _IsoscelesRightTriangleState();
}

class _IsoscelesRightTriangleState extends State<IsoscelesRightTriangle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('等腰直角三角形'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: <Widget>[
          Text(' '),
          Text('内角度数'),
          Text('长度'),
          Text('a'),
          Text('30°'),
          TextField(),
          Text('b'),
          Text('60°'),
          TextField(),
          Text('c'),
          Text('90°'),
          TextField(),
        ],
      ),
    );
  }
}
