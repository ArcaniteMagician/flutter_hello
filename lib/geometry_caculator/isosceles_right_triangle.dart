import 'package:flutter/material.dart';

final shortKey = GlobalKey<_LengthTextFieldState>();
final middleKey = GlobalKey<_LengthTextFieldState>();
final longKey = GlobalKey<_LengthTextFieldState>();

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
          LengthTextField(
            key: shortKey,
            lengthValue: '1.0',
            callback: (value) {
              double shortValue = double.parse(value);
              longKey.currentState.setNewValue((2 * shortValue).toString());
              middleKey.currentState
                  .setNewValue((1.714 * shortValue).toString());
            },
          ),
          Text('b'),
          Text('60°'),
          LengthTextField(
            key: middleKey,
            lengthValue: '1.0',
            callback: (value) {
              double middleValue = double.parse(value);
            },
          ),
          Text('c'),
          Text('90°'),
          LengthTextField(
            key: longKey,
            lengthValue: '1.0',
            callback: (value) {
              double longValue = double.parse(value);
            },
          ),
        ],
        addRepaintBoundaries: true,
      ),
    );
  }
}

class LengthTextField extends StatefulWidget {
  final String lengthValue;
  final CalculateCallback callback;

  LengthTextField({Key key, this.lengthValue, this.callback}) : super(key: key);

  @override
  _LengthTextFieldState createState() => _LengthTextFieldState();
}

class _LengthTextFieldState extends State<LengthTextField> {
  String _value;

  @override
  void initState() {
    super.initState();
    _value = widget.lengthValue;
  }

  void setNewValue(String newValue) {
    setState(() {
      this._value = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
        keyboardType: TextInputType.number,
        onChanged: (value) {
          widget.callback(value);
        },
        decoration: InputDecoration(labelText: _value),
      ),
    );
  }
}

typedef CalculateCallback<String> = void Function(String value);
