import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:bloc_provider/bloc_provider.dart';
import 'package:markdown_editor/bloc/editor_bloc.dart';

class Editor extends StatefulWidget {
  @override
  _EditorState createState() => _EditorState();
}

class _EditorState extends State<Editor> with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<EditorBloc>(context);

    const TextStyle style = TextStyle(
      color: Colors.black,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Markdown Editor",
          style: style,
        ),
        bottom: TabBar(controller: _tabController, tabs: [
          Tab(
            child: Text('Editing', style: style),
          ),
          Tab(
            child: Text('Preview', style: style),
          )
        ]),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20),
            child: TextField(
              maxLines: null,
              onChanged: (value) => {bloc.content.add(value)},
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'INPUT TEXT',
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
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }
}
