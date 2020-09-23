import 'package:flutter/material.dart';
import '../models/topicsList.dart';
import 'package:scroll_to_index/scroll_to_index.dart';


class TopicList extends StatefulWidget {
  dynamic dataset;
  TopicList({@required this.dataset});
  @override
  _TopicListState createState() => _TopicListState();
}

class _TopicListState extends State<TopicList> {
  
  String searchQuery;
  AutoScrollController controller;
  final scrollDirection = Axis.vertical;
  
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
    controller = AutoScrollController(
      viewportBoundaryGetter: () => Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: scrollDirection
    );
  }

  void searchTopic(String query){
    int index = topics.topics.indexWhere((topic) => topic.name == query);
    _scrollToIndex(index);
  }

  Future _scrollToIndex(int index) async {
    await controller.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
    controller.highlight(index);
  }

  createAlertDialog(BuildContext context){
    return showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text('Topic Name'),
          content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextField(
                    onChanged: (value){
                      setState(() {
                        searchQuery = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Search Topic",
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          actions: <Widget>[
            FlatButton(
                child: Text(
                  'Search',
                  style: TextStyle(
                    color:Colors.purple,
                  ),
                ),
                onPressed: () {
                  searchTopic(searchQuery);
                  Navigator.of(context).pop();
                },
              ),
            FlatButton(
                child: Text(
                  'Close',
                  style: TextStyle(
                    color:Colors.purple,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ), 
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Topics'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search , color: Colors.white,),
            onPressed: (){
              createAlertDialog(context);
            },
          ),
        ],
      ),
      body: ListView.builder(
        controller: controller,
        scrollDirection: scrollDirection,
        itemCount: (topics == null || topics.topics == null || topics.topics.length == 0) ? 0 : topics.topics.length,  
        itemBuilder: (context , index){
          return Padding(
                padding: const EdgeInsets.all(8.0),
                child: getTile(index),
              );
        },
      ),
    );
  }
  Widget getTile(int index){
  return _wrapScrollTag(
    index: index,
    child: ListTile(
            title: Text(topics.topics[index].name),
            subtitle: Text('Search Index: ${topics.topics[index].search_index}'),
      ),
    );
  }
  Widget _wrapScrollTag({int index, Widget child}) => AutoScrollTag(
    key: ValueKey(index),
    controller: controller,
    index: index,
    child: child,
    highlightColor: Colors.purple.withOpacity(0.1),
  );
}

