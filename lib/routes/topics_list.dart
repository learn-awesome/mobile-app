import 'package:flutter/material.dart';

class TopicList extends StatefulWidget {
  @override
  _TopicListState createState() => _TopicListState();
}

class _TopicListState extends State<TopicList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Topics'),
      ),
    );
  }
}
