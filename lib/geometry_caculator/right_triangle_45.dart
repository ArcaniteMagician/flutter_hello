import 'package:flutter/material.dart';
import 'package:flutter_hello/geometry_caculator/form_widget.dart';

final shortKey = GlobalKey<LengthTextFieldState>();
final middleKey = GlobalKey<LengthTextFieldState>();
final longKey = GlobalKey<LengthTextFieldState>();

class RightTriangle45 extends StatefulWidget {
  @override
  _RightTriangle45State createState() => _RightTriangle45State();
}

class _RightTriangle45State extends State<RightTriangle45> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('等腰直角三角形'),
      ),
      body: Container(
//        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: ListView(
          children: <Widget>[
            Image.asset(
              'images/right_triangle_45.jpg',
              fit: BoxFit.cover,
            ),
            TitleRow(
              title: '代号',
              subtitle: '对应内角\n度数',
              data: '边长',
            ),
            MyDataRow(
              name: 'a',
              angle: '45°',
              valueText: LengthTextField(
                key: shortKey,
                decorationText: '',
                editingValue: '1.0',
                callback: (text, shortValue) {
                  shortKey.currentState.setNewValue('', text);
                  middleKey.currentState
                      .setNewValue('a * 1', shortValue.toString());
                  longKey.currentState
                      .setNewValue("a * √2", (1.414 * shortValue).toString());
                },
              ),
            ),
            MyDataRow(
              name: 'b',
              angle: '45°',
              valueText: LengthTextField(
                key: middleKey,
                decorationText: 'a * 1',
                editingValue: '1.0',
                callback: (text, middleValue) {
                  shortKey.currentState
                      .setNewValue('b * 1', middleValue.toString());
                  middleKey.currentState.setNewValue('', text);
                  longKey.currentState.setNewValue(
                      'b * √2', (middleValue * 1.414).toString());
                },
              ),
            ),
            MyDataRow(
              name: 'c',
              angle: '90°',
              valueText: LengthTextField(
                key: longKey,
                decorationText: 'a * √2',
                editingValue: '1.414',
                callback: (text, longValue) {
                  shortKey.currentState
                      .setNewValue('c / √2', (longValue / 2).toString());
                  middleKey.currentState.setNewValue(
                      'c / √2', (longValue / 1.414).toString());
                  longKey.currentState.setNewValue('', text);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
