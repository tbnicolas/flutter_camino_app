import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart'; 
 
 
class OpenImagePage extends StatefulWidget {
  static final String routeName = 'openImage';
  /* 
  String url;
  OpenImagePage({this.url}); */
  @override
  _OpenImagePageState createState() => _OpenImagePageState();
}

class _OpenImagePageState extends State<OpenImagePage> {
  @override
  Widget build(BuildContext context) {
    print(ModalRoute.of(context).settings.arguments);
    String url = ModalRoute.of(context).settings.arguments;
    return new  Scaffold( 
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(''),
        ),
        body: new Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black,
            child: new PhotoView(imageProvider: new NetworkImage(url))
          ),
    );
  }
}