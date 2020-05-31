import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

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
      home: MyHomePage(title: 'LearnAwesome QuickSearch'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = const MethodChannel('org.learnawesome.app/shared.data');
  String _url = 'https://flutter.dev';

  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() async {
    // Case 1: App is already running in background:
    // Listen to lifecycle changes to subsequently call Java MethodHandler to check for shared data
    SystemChannels.lifecycle.setMessageHandler((msg) {
      if (msg.contains('resumed')) {
        _getSharedData().then((d) {
          if (d.isEmpty) return;
          // Your logic here
          // E.g. at this place you might want to use Navigator to launch a new page and pass the shared data
          setState(() => _url = d);
        });
      }
    });

    // Case 2: App is started by the intent:
    // Call Java MethodHandler on application start up to check for shared data
    var data = await _getSharedData();
    setState(() => _url = data);

    // You can use sharedData in your build() method now
  }


  Future<String> _getSharedData() async {
    String sharedData;
    try {
      final String result = await platform.invokeMethod('getSharedData');
      sharedData = result;
    } on PlatformException catch (e) {
      sharedData = "Failed to getSharedData: '${e.message}'.";
    }

    setState(() {
      _url = sharedData;
    });
  }

  _launchURL() async {
    print("launch start");
    String url = _url;
    var is_valid_url = url != null && (url.startsWith("http:") || url.startsWith("https:"));
    String la_url = "https://learnawesome.org/items/search?app=true&ext=true&commit=Search+or+Add&q=${Uri.encodeComponent(url)}";

    if (is_valid_url && await canLaunch(la_url)) {
      print("launching ${la_url}");
      await launch(la_url);
    } else {
      throw 'Could not launch $la_url';
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_url'
            ),
            RaisedButton(
              onPressed: _launchURL,
              child: Text('Look up or add in LearnAwesome'),
            )
          ],
        ),
      ),

    );
  }
}
