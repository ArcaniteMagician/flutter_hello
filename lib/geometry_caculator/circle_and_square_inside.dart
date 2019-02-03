import 'package:flutter/material.dart';
import 'package:flutter_hello/geometry_caculator/form_widget.dart';

final radiusKey = GlobalKey<LengthTextFieldState>();
final diameterKey = GlobalKey<LengthTextFieldState>();
final squareSideKey = GlobalKey<LengthTextFieldState>();

class CircleAndSquare extends StatefulWidget {
  @override
  _CircleAndSquareState createState() => _CircleAndSquareState();
}

class _CircleAndSquareState extends State<CircleAndSquare> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('圆与内嵌正方形'),
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
              name: 'r',
              angle: '圆半径',
              valueText: LengthTextField(
                key: radiusKey,
                decorationText: '',
                editingValue: '1.0',
                callback: (text, radiusValue) {
                  radiusKey.currentState.setNewValue('', text);
                  diameterKey.currentState
                      .setNewValue('a * 2', (radiusValue * 2).toString());
                  squareSideKey.currentState
                      .setNewValue("a * √2", (1.414 * radiusValue).toString());
                },
              ),
            ),
            MyDataRow(
              name: 'd',
              angle: '圆直径',
              valueText: LengthTextField(
                key: diameterKey,
                decorationText: 'r * 2',
                editingValue: '2.0',
                callback: (text, diameterValue) {
                  radiusKey.currentState
                      .setNewValue('d / 2', (diameterValue / 2).toString());
                  diameterKey.currentState.setNewValue('', text);
                  squareSideKey.currentState.setNewValue(
                      'd / √2', (diameterValue / 1.414).toString());
                },
              ),
            ),
            MyDataRow(
              name: 'a',
              angle: '正方形边长',
              valueText: LengthTextField(
                key: squareSideKey,
                decorationText: 'r * √2',
                editingValue: '1.414',
                callback: (text, sideValue) {
                  radiusKey.currentState
                      .setNewValue('a * √2 / 2', (sideValue * 1.414 / 2).toString());
                  diameterKey.currentState
                      .setNewValue('a * √2', (sideValue * 1.414).toString());
                  squareSideKey.currentState.setNewValue('', text);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
