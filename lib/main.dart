import 'package:flutter/material.dart';
import 'package:youtube/OwnDrawer.dart';

void main() => runApp(Youtube());

class Youtube extends StatefulWidget {
  @override
  _YoutubeState createState() => _YoutubeState();
}

class _YoutubeState extends State<Youtube> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: new OwnDrawer(),
        appBar: new AppBar(
          title: Text(
            "Youtube List",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              backgroundColor: Colors.lightBlueAccent,
            ),
          ),
        ),
        body: new Container(
          decoration: BoxDecoration(),
          child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new SizedBox(
                  width: 150,
                  height: 150.0,
                  child: new Image.asset(''),
                )
              ],
            ),
          ),
        ));
  }
}
