import 'package:flutter/material.dart';
import '../models/topicsList.dart';


class TopicList extends StatefulWidget {
  dynamic dataset;
  TopicList({@required this.dataset});
  @override
  _TopicListState createState() => _TopicListState();
}

class _TopicListState extends State<TopicList> {
  
  
  TopicsList topics = TopicsList();
  void getTopics(){
    setState(() {
      topics = TopicsList.fromJson(widget.dataset['topics']);
    });
  }

  @override
  void initState() {
    getTopics();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Topics'),
      ),
      body: ListView.builder(
        itemCount: (topics == null || topics.topics == null || topics.topics.length == 0) ? 0 : topics.topics.length,  
        itemBuilder: (context , index){
          return Card(
            child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(topics.topics[index].name),
                    subtitle: Text('Search Index: ${topics.topics[index].search_index}'),
                  ),
                ),
          );
        },
      ),
    );
  }
}
