import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:scroll_to_index/scroll_to_index.dart';


class ItemTypesList extends StatefulWidget {
  @override
  _ItemTypesListState createState() => _ItemTypesListState();
}

class _ItemTypesListState extends State<ItemTypesList> {

  String searchQuery;
  final scrollDirection = Axis.vertical;
  AutoScrollController controller;
  @override
  void initState() {
    super.initState();
    controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: scrollDirection);
  }
  
  List<String> item_types = [
    "Apps and Software Tools",
    "Articles and Essays",
    "Audios and Podcasts",
    "Blogs and Twitter feeds",
    "Books",
    "Assessment and Certifications",
    "Forums and Chat Groups",
    "Cheatsheets",
    "Code",
    "Conferences",
    "Courses and MOOCs",
    "FlashCards",
    "Games",
    "Pictures and Infographics",
    "Interactives and Explorables",
    "Journals and Magazines",
    "Learning Plans",
    "Livestreams",
    "Meetups",
    "Newsletters",
    "People",
    "Q & A forums",
    "Research Papers",
    "Summary or notes",
    "Videos and Films",
    "Websites",
    "Wikis",
    "Discussion Threads",
    "Projects",
    "Online Meetups",
    "Online Conferences",
    "Things and Toys"
  ];

  void searchTopic(String query){
    int index = item_types.indexWhere((type) => type == query);
    _scrollToIndex(index);
    print(index);
  }

  createAlertDialog(BuildContext context){
    return showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text('Search Item Type'),
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
                      hintText: "Item Type Name",
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
        title: Text('Item Types'),
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
        scrollDirection: scrollDirection,
        controller: controller,
        itemCount: item_types.length,
        itemBuilder: (context, i) => Padding(
          padding: EdgeInsets.all(8),
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: _getRow(i)
            )
          ),
          ),
        ),
    );
 }
Future _scrollToIndex(int index) async {
    await controller.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
    controller.highlight(index);
  }

  Widget _getRow(int index) {
    return _wrapScrollTag(
        index: index,
        child: ListTile(
        title: Text(
          item_types[index],
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17.5,
          ),
        ),
        ));
  }

  Widget _wrapScrollTag({int index, Widget child}) => AutoScrollTag(
        key: ValueKey(index),
        controller: controller,
        index: index,
        child: child,
        highlightColor: Colors.purple.withOpacity(0.1),
      );

}





