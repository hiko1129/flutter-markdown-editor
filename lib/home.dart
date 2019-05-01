import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;
  String text = '';
  @override
  Widget build(BuildContext context) {
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
              onChanged: (value) => {
                    setState(() => {this.text = value})
                  },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'INPUT TEXT',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: MarkdownBody(data: text),
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
