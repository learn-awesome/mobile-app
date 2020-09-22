import 'package:flutter/material.dart';
import '../models/expertsList.dart';

class Experts extends StatefulWidget {
  dynamic dataset;
  Experts({@required this.dataset});
  @override
  _ExpertsState createState() => _ExpertsState();
}

class _ExpertsState extends State<Experts> {
  
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Experts'),
      ),
      body: ListView.builder(
        itemCount: (experts == null || experts.experts == null || experts.experts.length == 0) ? 0 : experts.experts.length,  
        itemBuilder: (context , index){
          return Card(
            child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(experts.experts[index].name),
                    subtitle: Text('Description: ${experts.experts[index].description}'),
                  ),
                ),
          );
        },
      ),
    );
  }
}
