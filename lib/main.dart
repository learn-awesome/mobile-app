import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'routes/experts.dart';
import 'routes/topics_list.dart';
import 'routes/item_types_list.dart';

var dataset;

Future<String> loadJson() async {
    return await rootBundle.loadString('assets/dataset.json');
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Navigate(),
      routes: {
        "topic_list": (context) => TopicList(dataset: dataset,),
        "item_types_list": (context) => ItemTypesList(),
        "experts": (context) => Experts(dataset: dataset,)
      },
    );
  }
}

class Navigate extends StatefulWidget {
  @override
  _NavigateState createState() => _NavigateState();
}

class _NavigateState extends State<Navigate> {
  void decodeJson() async {
    String jsonString = await loadJson();
    final jsonResponse = json.decode(jsonString);
    setState((){
      dataset = jsonResponse;
    });
    print(dataset['topics'][0]['name']);
  }
  @override
  void initState() {
    decodeJson();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'LearnAwesome QuickSearch',
        ),
      ),
      body: Center(
        child: dataset == null ? CircularProgressIndicator() : Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FlatButton(
              onPressed: (){
                Navigator.pushNamed(context, 'topic_list');
              },
              color: Colors.purple,
              child: Text(
                'Topics',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                ),
                textAlign: TextAlign.center,
              ),
            ),
            FlatButton(
              onPressed: (){
                Navigator.pushNamed(context, 'item_types_list');
              },
              color: Colors.purple,
              child: Text(
                'Item Types',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                ),
                textAlign: TextAlign.center,
              ),
            ),
            FlatButton(
              onPressed: (){
                Navigator.pushNamed(context, 'experts');
              },
              color: Colors.purple,
              child: Text(
                'Experts',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//class _MyHomePageState extends State<MyHomePage> {
//  static const platform = const MethodChannel('org.learnawesome.app/shared.data');
//  String _url = 'https://flutter.dev';
//  @override
//  void initState() {
//    super.initState();
//    _init();
//  }
//  _init() async {
//    // Case 1: App is already running in background:
//    // Listen to lifecycle changes to subsequently call Java MethodHandler to check for shared data
//    SystemChannels.lifecycle.setMessageHandler((msg) {
//
//      // print("Got message $msg");
//
//      if (msg.contains('resumed')) {
//        _getSharedData().then((d) {
//          if (d.isEmpty) return;
//          // Your logic here
//          // E.g. at this place you might want to use Navigator to launch a new page and pass the shared data
//          setState(() => _url = d);
//        });
//      }
//    });
//
//    // Case 2: App is started by the intent:
//    // Call Java MethodHandler on application start up to check for shared data
//    var data = await _getSharedData();
//    setState(() => _url = data);
//
//    // You can use sharedData in your build() method now
//  }
//  Future<String> _getSharedData() async {
//    String sharedData;
//    try {
//      final String result = await platform.invokeMethod('getSharedData');
//      sharedData = result;
//    } on PlatformException catch (e) {
//      sharedData = "Failed to getSharedData: '${e.message}'.";
//    }
//    return sharedData;
//  }
//  _launchURL() async {
//    print("launch start");
//    String url = _url;
//    var isValidUrl = url != null && (url.startsWith("http:") || url.startsWith("https:"));
//    String laUrl = "https://learnawesome.org/items/search?app=true&ext=true&commit=Search+or+Add&q=${Uri.encodeComponent(url)}";
//
//    if (isValidUrl && await canLaunch(laUrl)) {
//      print("launching $laUrl");
//      await launch(laUrl);
//    } else {
//      throw 'Could not launch $laUrl';
//    }
//  }
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
//        title: Text(widget.title),
//      ),
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text(
//              '$_url'
//            ),
//            RaisedButton(
//              onPressed: _launchURL,
//              child: Text('Look up or add in LearnAwesome'),
//            )
//          ],
//        ),
//      ),
//
//    );
//  }
//}
