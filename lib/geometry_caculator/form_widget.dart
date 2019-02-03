import 'package:flutter/material.dart';

class TitleRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final String data;

  const TitleRow({Key key, this.title, this.subtitle, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: _TipText(title),
          ),
          Expanded(
            flex: 2,
            child: _TipText(subtitle),
          ),
          Expanded(
            flex: 3,
            child: _TipText(data),
          ),
        ],
      ),
    );
  }
}

class MyDataRow extends StatelessWidget {
  final String name;
  final String angle;
  final Widget valueText;

  const MyDataRow({this.name, this.angle, this.valueText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10.0),
      child: Row(
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
  LengthTextFieldState createState() => LengthTextFieldState();
}

class LengthTextFieldState extends State<LengthTextField> {
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
      // TODO- 过长内容取到小数点后四位为止
//      if (newValue.length > 10) {
//        int endIndex = newValue.indexOf(".", newValue.length) + 4;
//        if (endIndex > newValue.length) {
//          endIndex = newValue.length;
//        }
//        newValue = newValue.substring(0, endIndex);
//      }
      this._decorationText = decorationText;
      this._editingValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      // TextField样式参考：https://juejin.im/post/5b6bdb406fb9a04f89785cb5
      child: TextField(
        keyboardType: TextInputType.number,
        onChanged: (value) {
          double num = double.tryParse(value) ?? -1;
          if (num > 0) {
            widget.callback(value, num);
          }
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

typedef CalculateCallback<String> = void Function(String text, double value);
