import 'package:flutter/material.dart';
import 'package:youtube/PlaylistYoutube.dart';

class OwnDrawer extends StatefulWidget {
  @override
  _OwnDrawerState createState() => _OwnDrawerState();
}

class _OwnDrawerState extends State<OwnDrawer> {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new ListTile(
              leading: new Icon(Icons.home),
              title: new Text("Home"),
            ),
            new Divider(),
            new ListTile(
              leading: new Icon(Icons.video_library),
              title: new Text("Video"),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new PlaylistYoutube())),
            )
          ],
        ),
      ),
    );
  }
}
