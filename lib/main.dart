import 'package:flutter/material.dart';
import 'package:markdown_editor/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Markdown Editor',
      home: Home(),
    );
  }
}
