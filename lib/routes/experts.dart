import 'package:flutter/material.dart';
import '../models/expertsList.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class Experts extends StatefulWidget {
  dynamic dataset;
  Experts({@required this.dataset});
  @override
  _ExpertsState createState() => _ExpertsState();
}

class _ExpertsState extends State<Experts> {

  String searchQuery;
  AutoScrollController controller;
  final scrollDirection = Axis.vertical;
  
  ExpertsList experts = ExpertsList();
  
  void getExperts(){
    setState(() {
      experts = ExpertsList.fromJson(widget.dataset['experts']);
    });
  }

  @override
  void initState() {
    getExperts();
    super.initState();
    controller = AutoScrollController(
      viewportBoundaryGetter: () => Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: scrollDirection
    );
  }

  void searchTopic(String query){
    int index = experts.experts.indexWhere((expert) => expert.name == query);
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
          title: Text('Search Expert'),
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
                      hintText: "Expert Name",
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
        title: Text('Experts'),
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
        itemCount: (experts == null || experts.experts == null || experts.experts.length == 0) ? 0 : experts.experts.length,  
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
    child: ListTile(
            title: Text(experts.experts[index].name),
            subtitle: Text('Description: ${experts.experts[index].description}'),
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
