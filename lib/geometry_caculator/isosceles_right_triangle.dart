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
          _TipText(' '),
          _TipText('对应内角\n度数'),
          _TipText('边长'),
          _TipText('a'),
          _TipText('30°'),
          LengthTextField(
            key: shortKey,
            decorationText: '1.0',
            editingValue: '1.0',
            callback: (value) {
              double shortValue = double.parse(value);

              shortKey.currentState.setNewValue('', shortValue.toString());
              middleKey.currentState
                  .setNewValue('a * √3', (1.732 * shortValue).toString());
              longKey.currentState
                  .setNewValue("a * 2", (2 * shortValue).toString());
            },
          ),
          _TipText('b'),
          _TipText('60°'),
          LengthTextField(
            key: middleKey,
            decorationText: 'a * √3',
            editingValue: '1.732',
            callback: (value) {
              double middleValue = double.parse(value);

              shortKey.currentState
                  .setNewValue('b / √3', (middleValue / 1.732).toString());
              middleKey.currentState.setNewValue('', middleValue.toString());
              longKey.currentState.setNewValue(
                  'b / √3 * 2', (middleValue / 1.732 * 2).toString());
            },
          ),
          _TipText('c'),
          _TipText('90°'),
          LengthTextField(
            key: longKey,
            decorationText: 'a * 2',
            editingValue: '2.0',
            callback: (value) {
              double longValue = double.parse(value);

              shortKey.currentState
                  .setNewValue('c / 2', (longValue / 2).toString());
              middleKey.currentState.setNewValue(
                  'c * √3 / 2', (longValue * 1.732 / 2).toString());
              longKey.currentState.setNewValue('', longValue.toString());
            },
          ),
        ],
        addRepaintBoundaries: true,
      ),
    );
  }
}

class LengthTextField extends StatefulWidget {
  final String editingValue;
  final String decorationText;
  final CalculateCallback callback;

  LengthTextField(
      {Key key, this.decorationText, this.editingValue, this.callback})
      : super(key: key);

  @override
  _LengthTextFieldState createState() => _LengthTextFieldState();
}

class _LengthTextFieldState extends State<LengthTextField> {
  String _decorationText;
  String _editingValue;

  @override
  void initState() {
    super.initState();
    _editingValue = widget.editingValue;
    _decorationText = widget.decorationText;
  }

  void setNewValue(String decorationText, String newValue) {
    setState(() {
      this._decorationText = decorationText;
      this._editingValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
        keyboardType: TextInputType.number,
        onSubmitted: (value) {
          widget.callback(value);
        },
        decoration: InputDecoration(labelText: _decorationText),
        controller: TextEditingController.fromValue(
            TextEditingValue(text: _editingValue)),
      ),
    );
  }
}

class _TipText extends StatelessWidget {
  final String text;

  const _TipText(this.text);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}

typedef CalculateCallback<String> = void Function(String value);
