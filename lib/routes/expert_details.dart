import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mobile_app/models/expert.dart';

class ExpertDetails extends StatelessWidget {
  Expert expert;
  Future<void> _launched;
  ExpertDetails({@required this.expert});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${expert.name}'),
      ),
      body: Padding(
          padding: EdgeInsets.all(12.5),
          child: ListView(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                width: 75,
                height: 175,
                child: Center(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(expert.image_url == null ? 'https://learnawesome.org/stream/assets/img/logo-mobile.png' : expert.image_url)
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
               '${expert.name}',
               textAlign: TextAlign.center,
               style: TextStyle(
                 fontSize: 25,
                 fontWeight: FontWeight.w600
               )
            ),
            SizedBox(height: 15),
            expert.description == null ? Text('') : Text(
              '${expert.description}',
              style: TextStyle(
                fontSize: 17.5,
                fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(height: 10,),
            (expert.website == null) || (expert.website == "") ? Text('') : GestureDetector(
              onTap: (){
                _launched = _launchInBrowser(expert.website);
              },
              child: Row(
                children: [
                  FaIcon(FontAwesomeIcons.globeAsia , size: 30),
                  SizedBox(width: 15),
                  Text(
                    'Link to website',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.lightBlue,
                      fontSize: 17.5
                    ), 
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            (expert.twitter == null) || (expert.twitter == "") ? Text('') : GestureDetector(
              onTap: (){
                _launched = _launchInBrowser(expert.twitter);
              },
              child: Row(
                children: [
                  FaIcon(FontAwesomeIcons.twitter , size: 30),
                  SizedBox(width: 15),
                  Text(
                    '${expert.twitter}',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.lightBlue,
                      fontSize: 17.5
                    ), 
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            (expert.goodreads == null) || (expert.goodreads == "") ? Text('') : GestureDetector(
              onTap: (){
                _launched = _launchInBrowser(expert.goodreads);
              },
              child: Row(
                children: [
                  FaIcon(FontAwesomeIcons.goodreads , size: 30),
                  SizedBox(width: 15),
                  Text(
                    'Link to GoodReads',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.lightBlue,
                      fontSize: 17.5
                    ), 
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}