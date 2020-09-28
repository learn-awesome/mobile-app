import 'package:flutter/material.dart';
import 'package:mobile_app/models/index.dart';
import 'package:mobile_app/routes/subtopics.dart';
import '../models/topicsList.dart';
import 'package:scroll_to_index/scroll_to_index.dart';


class TopicList extends StatefulWidget {
  dynamic topic_dataset;
  TopicList({@required this.topic_dataset});
  @override
  _TopicListState createState() => _TopicListState();
}

class _TopicListState extends State<TopicList> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String searchQuery;
  AutoScrollController controller;
  final scrollDirection = Axis.vertical;
  
  TopicsList topics = TopicsList();
  var parentSet = <String>{};
  List<String> parentList = [];
  void getTopics(){
    setState(() {
      topics = TopicsList.fromJson(widget.topic_dataset['topics']);
    });
  }

  void getParents(){
    for (int i = 0 ; i < topics.topics.length ; ++i){
      if(topics.topics[i].children.length == 0){
        parentSet.add("Other Topics");
      }
      else {
        parentSet.add("${topics.topics[i].name}");
      }
    }
    parentList = parentSet.toList();
    print(parentList);
  }

  List<Topic> getOtherTopics(){
    List<Topic> otherTopics = [];
    for (int i = 0 ; i < topics.topics.length ; ++i){
      if(topics.topics[i].children.length == 0){
        otherTopics.add(topics.topics[i]);
      }
    }
    return otherTopics;
  }

  @override
  void initState() {
    getTopics();
    super.initState();
    controller = AutoScrollController(
      viewportBoundaryGetter: () => Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: scrollDirection
    );
    getParents();
  }

  void searchTopic(String query){
    int index = parentList.indexWhere((parent) => parent == query);
    if (index != -1){
      _scrollToIndex(index);
    }
    else {
      final snackbar = SnackBar(content: Text('Not found'),);
      _scaffoldKey.currentState.showSnackBar(snackbar);
    }
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
      key: _scaffoldKey,
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
        itemCount: (parentList.length == 0) ? 0 : parentList.length,  
        itemBuilder: (context , index){
          return Card(
                  child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: getTile(index),
                ),
          );
        },
      ),
    );
  }
  Widget getTile(int index){
  return _wrapScrollTag(
    index: index,
    child: GestureDetector(
          onTap: (){
            if (index == 0){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SubTopicList(parent: parentList[index] , children: getOtherTopics())));  
            }
            else {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SubTopicList(parent: parentList[index] , children: topics.topics[topics.topics.indexWhere((topic) => topic.name == parentList[index])].children,)));
            }
          },
          child: ListTile(
          title: Text(
            parentList[index],
            style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
          ),
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

