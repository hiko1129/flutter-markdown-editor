import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:bloc_provider/bloc_provider.dart';
import 'package:markdown_editor/bloc/editor_bloc.dart';

class Editor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<EditorBloc>(context);

    const TextStyle style = TextStyle(
      color: Colors.white,
    );

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Markdown Editor",
            style: style,
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Column(
                  children: <Widget>[
                    Icon(Icons.edit),
                    Text('Editing', style: style),
                  ],
                ),
              ),
              Tab(
                child: Column(
                  children: <Widget>[
                    Icon(Icons.remove_red_eye),
                    Text('Preview', style: style),
                  ],
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                maxLines: null,
                onChanged: (value) => {bloc.content.add(value)},
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '# h1\n## h2\n### h3',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: StreamBuilder<String>(
                stream: bloc.content,
                initialData: bloc.content.value,
                builder: (context, snap) {
                  return MarkdownBody(data: snap.data);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
