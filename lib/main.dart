import 'package:flutter/material.dart';
import 'package:markdown_editor/bloc/editor_bloc.dart';
import 'package:markdown_editor/ui/editor.dart';
import 'package:bloc_provider/bloc_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Markdown Editor',
      home: BlocProvider<EditorBloc>(
        creator: (_context, _bag) => EditorBloc(),
        child: Editor(),
      ),
    );
  }
}
