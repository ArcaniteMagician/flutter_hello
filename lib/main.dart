import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Hello Flutter",
    home: Center(
      child: Text(
        'This is my truely Hello World!',
        textDirection: TextDirection.rtl,
      ),
    ),
  ));
}
