import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VideoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Video();
  }
}

class Video extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Videos"),
      ),
      body: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return listVideo();
        },
      ),
    );
  }

  Widget listVideo() {
    return Card(
        child: Column(
      children: <Widget>[
        Image.network(
            "https://www.hcc.de/wp-content/uploads/hannover-congress-centrum-hcc-aussenansicht.jpg",
            fit: BoxFit.fill),
        Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.topLeft,
          child: Text(
              "ist ein einfacher Demo-Text für die Print- und Schriftindustrie. Lorem Ipsum ist in der Industrie bereits der Standard Demo-Text seit 1500"),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 15),
          child: Row(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  onPressed: (){
                    setState(() {
                      print("test test");
                    });
                  },
                  child: Icon(Icons.add_comment),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: (){
                    setState(() {
                      print("test test");
                    });
                  },
                  child: Icon(Icons.share),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: (){
                    setState(() {
                      print("test test");
                    });
                  },
                  child: Icon(Icons.playlist_add),
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
