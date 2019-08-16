import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:storiesbase/screens/videos/video-details/video-details.dart';
import 'package:storiesbase/screens/videos/videos-view/widgets/videos-list.dart';
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

