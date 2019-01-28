import 'package:flutter/material.dart';
import 'package:flutter_hello/geometry_caculator/form_widget.dart';

final shortKey = GlobalKey<LengthTextFieldState>();
final middleKey = GlobalKey<LengthTextFieldState>();
final longKey = GlobalKey<LengthTextFieldState>();

class IsoscelesRightTriangle extends StatefulWidget {
  @override
  _IsoscelesRightTriangleState createState() => _IsoscelesRightTriangleState();
}

class _IsoscelesRightTriangleState extends State<IsoscelesRightTriangle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('30°内角直角三角形'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: ListView(
          children: <Widget>[
            TitleRow(
              title: '代号',
              subtitle: '对应内角\n度数',
              data: '边长',
            ),
            MyDataRow(
              name: 'a',
              angle: '30°',
              valueText: LengthTextField(
                key: shortKey,
                decorationText: '',
                editingValue: '1.0',
                callback: (text, shortValue) {
                  shortKey.currentState.setNewValue('', text);
                  middleKey.currentState
                      .setNewValue('a * √3', (1.732 * shortValue).toString());
                  longKey.currentState
                      .setNewValue("a * 2", (2 * shortValue).toString());
                },
              ),
            ),
            MyDataRow(
              name: 'b',
              angle: '60°',
              valueText: LengthTextField(
                key: middleKey,
                decorationText: 'a * √3',
                editingValue: '1.732',
                callback: (text, middleValue) {
                  shortKey.currentState
                      .setNewValue('b / √3', (middleValue / 1.732).toString());
                  middleKey.currentState.setNewValue('', text);
                  longKey.currentState.setNewValue(
                      'b / √3 * 2', (middleValue / 1.732 * 2).toString());
                },
              ),
            ),
            MyDataRow(
              name: 'c',
              angle: '90°',
              valueText: LengthTextField(
                key: longKey,
                decorationText: 'a * 2',
                editingValue: '2.0',
                callback: (text, longValue) {
                  shortKey.currentState
                      .setNewValue('c / 2', (longValue / 2).toString());
                  middleKey.currentState.setNewValue(
                      'c * √3 / 2', (longValue * 1.732 / 2).toString());
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
