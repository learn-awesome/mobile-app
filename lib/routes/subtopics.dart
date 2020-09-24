import 'package:flutter/material.dart';
import '../models/topicsList.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class SubTopicList extends StatefulWidget {
  String parent;
  TopicsList topics;
  SubTopicList({@required this.parent , @required this.topics});
  @override
  _SubTopicListState createState() => _SubTopicListState();
}

class _SubTopicListState extends State<SubTopicList> {

  String searchQuery;
  AutoScrollController controller;
  final scrollDirection = Axis.vertical;

  List<String> subtopics = [];

  void getSubtopics(String parent){
    for (int i = 0 ; i < widget.topics.topics.length ; ++i){
      if (parent == "Other Topics"){
        if (widget.topics.topics[i].parent == null){
          subtopics.add(widget.topics.topics[i].name);
        } 
        else {
          continue;
        }
      }
      else {
        if (widget.topics.topics[i].parent != null){
          if (widget.topics.topics[i].parent.name == parent){
            subtopics.add(widget.topics.topics[i].name);
          }
          else {
            continue;
          }
        }
      }
    }
  }

  void searchTopic(String query){
    int index = subtopics.indexWhere((subtopic) => subtopic == query);
    _scrollToIndex(index);
  }

  Future _scrollToIndex(int index) async {
    await controller.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
    controller.highlight(index);
  }

  @override
  void initState() {
    super.initState();
    controller = AutoScrollController(
      viewportBoundaryGetter: () => Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: scrollDirection
    );
    getSubtopics(widget.parent);
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
        title: Text(widget.parent),
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
        itemCount: (subtopics.length == 0) ? 0 : subtopics.length,
        itemBuilder: (context , index){
          return Card(
              child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: getTile(index),
            ),
          );
        },
      )
    );
  }
   Widget getTile(int index){
  return _wrapScrollTag(
    index: index,
    child: ListTile(
      title: Text(subtopics[index])
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