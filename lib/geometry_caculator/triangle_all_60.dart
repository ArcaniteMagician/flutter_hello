import 'package:flutter/material.dart';
import 'package:flutter_hello/geometry_caculator/form_widget.dart';

final sideKey = GlobalKey<LengthTextFieldState>();
final heightKey = GlobalKey<LengthTextFieldState>();

class RegularTriangle extends StatefulWidget {
  @override
  _RegularTriangleState createState() => _RegularTriangleState();
}

class _RegularTriangleState extends State<RegularTriangle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('正三角形'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: ListView(
          children: <Widget>[
            TitleRow(
              title: '代号',
              subtitle: '描述',
              data: '长度',
            ),
            MyDataRow(
              name: 'a',
              angle: '边长',
              valueText: LengthTextField(
                key: sideKey,
                decorationText: '',
                editingValue: '2',
                callback: (text, sideValue) {
                  sideKey.currentState.setNewValue('', text);
                  heightKey.currentState
                      .setNewValue('a * √3 / 2', (sideValue * 1.732 / 2).toString());
                },
              ),
            ),
            MyDataRow(
              name: 'h',
              angle: '高线长度',
              valueText: LengthTextField(
                key: heightKey,
                decorationText: 'a / √3 * 2',
                editingValue: '1.732',
                callback: (text, heightValue) {
                  sideKey.currentState
                      .setNewValue('h / √3 * 2', (heightValue / 1.732 * 2).toString());
                  heightKey.currentState.setNewValue('', text);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
