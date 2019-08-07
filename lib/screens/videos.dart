import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:storiesbase/screens/video-details.dart';
import 'package:storiesbase/shared/app-bar.dart';
import 'package:video_player/video_player.dart';

class VideosPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Videos();
  }
}

class Videos extends State<VideosPage> with SingleTickerProviderStateMixin {
  VideoPlayerController playerController;
  ScrollController _scrollViewController;

  @override
  void initState() {
    super.initState();
    _scrollViewController = new ScrollController();
    playerController = VideoPlayerController.asset("assets/input1.mp4")
      ..setVolume(1.0)
      ..initialize();
    _scrollViewController.addListener(() {
      setState(() {
        if (_scrollViewController.position.pixels ==
            _scrollViewController.position.maxScrollExtent) {}
      });
    });
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "bassam",
      child: Material(
        child: CustomScrollView(
          controller: _scrollViewController,
          slivers: <Widget>[
            SliverAppBarView(),
            SliverPadding(
              padding: EdgeInsets.only(bottom: 100, top: 15),
              sliver: new SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => listVideo(context),
                  childCount: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget listVideo(BuildContext context) {
  return InkWell(
    onTap: () => Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => VideoDetails()),
    ),
    child: Container(
      margin: EdgeInsets.only(bottom: 15, left: 10, right: 10, top: 0),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image.network(
                "https://ichef.bbci.co.uk/news/976/media/images/83351000/jpg/_83351965_explorer273lincolnshirewoldssouthpicturebynicholassilkstone.jpg",
                fit: BoxFit.fill,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 10, left: 20, bottom: 5),
                  child: Text(
                    "Demo-Text sdfvsdv für die Print- dfdfv und dscdc . Lorem Ipsum dssdcsd ascasca  ...",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
              Container(
                width: 30,
                margin: EdgeInsets.only(right: 10),
                child: IconButton(
                  onPressed: () => {},
                  icon: Icon(Icons.more_vert),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 18, top: 10, right: 10),
            child: Row(
              children: <Widget>[
                new Container(
                  height: 33.0,
                  width: 33.0,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://recdonline.com.au/assets/admin/assets/pages/media/pages/photo3.jpg",
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 15),
                  child: Text(
                    "Bela void",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 30),
                    alignment: Alignment.center,
                    child: Text(
                      "9.7k views",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    alignment: Alignment.centerRight,
                    child: Text(
                      "17 hours ago",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
