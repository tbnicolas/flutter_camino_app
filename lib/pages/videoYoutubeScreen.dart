import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {
  final String id;
  final String description;

  VideoScreen({this.id, this.description});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    
    _controller = YoutubePlayerController(
      initialVideoId: widget.id,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: new Scaffold(
        //appBar: new AppBar(),
        body: new SingleChildScrollView(
          child: new Column(
            children: [
              new YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                onReady: () {
                  print('Player is ready.');
                },
    
              ),
              new Padding(
                padding: EdgeInsets.only(top:30.0),
                child: Container(
                  width: MediaQuery.of(context).size.width -25,
                  child: new Text(
                    widget.description,
                    textAlign: TextAlign.justify,
                  ),
                ),
              )
            ],
          ),
        ),
       floatingActionButton: new FloatingActionButton(
         onPressed: ()=> Navigator.pop(context),
         child: new Center(child: new Icon(Icons.arrow_back_ios)),
       ),
      ),
    );
  }
}
