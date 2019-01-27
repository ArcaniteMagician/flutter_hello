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
        title: Text('30°内角直角三角形'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: ListView(
          children: <Widget>[
            _TitleRow(),
            _DataRow(
              name: 'a',
              angle: '30°',
              valueText: LengthTextField(
                key: shortKey,
                decorationText: '',
                editingValue: '1.0',
                callback: (shortValue) {
                  middleKey.currentState.setFocused(false);
                  longKey.currentState.setFocused(false);

                  shortKey.currentState.setNewDecorationText('');
                  middleKey.currentState
                      .setNewValue('a * √3', (1.732 * shortValue).toString());
                  longKey.currentState
                      .setNewValue("a * 2", (2 * shortValue).toString());
                },
              ),
            ),
            _DataRow(
              name: 'b',
              angle: '60°',
              valueText: LengthTextField(
                key: middleKey,
                decorationText: 'a * √3',
                editingValue: '1.732',
                callback: (middleValue) {
                  shortKey.currentState.setFocused(false);
                  longKey.currentState.setFocused(false);

                  shortKey.currentState
                      .setNewValue('b / √3', (middleValue / 1.732).toString());
                  middleKey.currentState
                      .setNewValue('', null);
                  longKey.currentState.setNewValue(
                      'b / √3 * 2', (middleValue / 1.732 * 2).toString());
                },
              ),
            ),
            _DataRow(
              name: 'c',
              angle: '90°',
              valueText: LengthTextField(
                key: longKey,
                decorationText: 'a * 2',
                editingValue: '2.0',
                callback: (longValue) {
                  shortKey.currentState.setFocused(false);
                  middleKey.currentState.setFocused(false);

                  shortKey.currentState
                      .setNewValue('c / 2', (longValue / 2).toString());
                  middleKey.currentState.setNewValue(
                      'c * √3 / 2', (longValue * 1.732 / 2).toString());
                  longKey.currentState.setNewValue('', null);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TitleRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: _TipText('代号'),
        ),
        Expanded(
          flex: 2,
          child: _TipText('对应内角\n度数'),
        ),
        Expanded(
          flex: 3,
          child: _TipText('边长'),
        ),
      ],
    );
  }
}

class _DataRow extends StatelessWidget {
  final String name;
  final String angle;
  final Widget valueText;

  const _DataRow({this.name, this.angle, this.valueText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: _TipText(name),
        ),
        Expanded(
          flex: 2,
          child: _TipText(angle),
        ),
        Expanded(
          flex: 3,
          child: valueText,
        )
      ],
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
  bool _isFocused;

  @override
  void initState() {
    super.initState();
    _editingValue = widget.editingValue;
    _decorationText = widget.decorationText;
  }

  void setNewDecorationText(String decorationText) {
    setState(() {
      this._decorationText = decorationText;
    });
  }

  void setNewValue(String decorationText, String newValue) {
    setState(() {
      this._decorationText = decorationText;
      this._editingValue = newValue;
    });
  }

  void setFocused(bool isFocused) {
    this._isFocused = isFocused;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      // TextField样式参考：https://juejin.im/post/5b6bdb406fb9a04f89785cb5
      child: TextField(
        keyboardType: TextInputType.number,
        onChanged: (value) {
          if (_isFocused) {
            double num = double.tryParse(value) ?? -1;
            if (num > 0) {
              widget.callback(num);
            }
          }
        },
        onTap: () {
          _isFocused = true;
        },
        decoration: InputDecoration(
          labelText: _decorationText,
        ),
        controller: TextEditingController.fromValue(TextEditingValue(
            text: _editingValue,
            // 保持光标在文末
            selection: TextSelection.fromPosition(TextPosition(
                affinity: TextAffinity.downstream,
                offset: _editingValue.length)))),
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

typedef CalculateCallback<String> = void Function(double value);
