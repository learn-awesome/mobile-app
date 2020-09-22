import 'package:flutter/material.dart';

class IdeaSetsList extends StatefulWidget {
  @override
  _IdeaSetsListState createState() => _IdeaSetsListState();
}

class _IdeaSetsListState extends State<IdeaSetsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Idea Sets'),
      ),
    );
  }
}
