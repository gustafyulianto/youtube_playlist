import 'package:flutter/material.dart';
import 'package:youtube/OwnDrawer.dart';

void main() => runApp(Youtube());

class Youtube extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: OwnDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Youtube Playlist API",
            style: TextStyle(fontSize: 30, fontFamily: 'DancingScript')),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/samara.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            "Video Youtube API",
            style: TextStyle(fontSize: 30, fontFamily: 'DancingScript'),
          ),
        ),
      ),
    );
  }
}
