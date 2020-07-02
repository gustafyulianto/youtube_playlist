import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:youtube/OwnDrawer.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class PlaylistYoutube extends StatefulWidget {
  final String title;
  final String url;

  PlaylistYoutube({this.title, this.url});
  @override
  _PlaylistYoutubeState createState() => _PlaylistYoutubeState();
}

class _PlaylistYoutubeState extends State<PlaylistYoutube> {
  Future<List> getJsonData() async {
    final response = await http.get(widget.url);
    print(json.decode(response.body));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      drawer: new OwnDrawer(),
      body: new FutureBuilder<List>(
        future: getJsonData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListYoutube(list: snapshot.data)
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ListYoutube extends StatelessWidget {
  final List list;
  ListYoutube({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VideoPlayer(
                              url:
                                  "https://youtube.com/embed/${list[index]['contentDetails']['videoId']}")));
                },
                child: Container(
                  height: 230,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(list[index]['snippet']['thumbnails']
                            ['high']['url'])),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(24),
                child: Text(list[index]['snippet']['title']),
              ),
              Divider(),
            ],
          ),
        );
      },
    );
  }
}

class VideoPlayer extends StatelessWidget {
  final url;
  VideoPlayer({this.url});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: WebviewScaffold(url: url),
      ),
    );
  }
}
