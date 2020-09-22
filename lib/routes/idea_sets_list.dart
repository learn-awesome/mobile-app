import 'package:flutter/material.dart';
import '../models/ideaSetList.dart';


class IdeaSetsList extends StatefulWidget {
  dynamic dataset;
  IdeaSetsList({@required this.dataset});
  @override
  _IdeaSetsListState createState() => _IdeaSetsListState();
}

class _IdeaSetsListState extends State<IdeaSetsList> {

  IdeaSetList ideaSetList = IdeaSetList();
  void getIdeaSets(){
    setState(() {
      ideaSetList = IdeaSetList.fromJson(widget.dataset['idea_sets']);
    });
  }

  @override
  void initState() {
    getIdeaSets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Idea Sets'),
      ),
      body: ListView.builder(
        itemCount: (ideaSetList == null || ideaSetList.ideaSetList == null || ideaSetList.ideaSetList.length == 0) ? 0 : ideaSetList.ideaSetList.length,  
        itemBuilder: (context , index){
          return Card(
            child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(ideaSetList.ideaSetList[index].name),
                    subtitle: Text('Id: ${ideaSetList.ideaSetList[index].id}'),
                  ),
                ),
          );
        },
      ),
    );
  }
}
