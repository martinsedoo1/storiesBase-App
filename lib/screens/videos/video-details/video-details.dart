import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:storiesbase/screens/videos/video-details/widgets/about-video.dart';
import 'package:storiesbase/screens/videos/video-details/widgets/suggestions-video-list.dart';
import 'package:storiesbase/screens/videos/video-details/widgets/user-info.dart';
import 'package:storiesbase/screens/videos/video-details/widgets/video.dart';

class VideoDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return VideoDetailsView();
  }
}

class VideoDetailsView extends State<VideoDetails> {
  var _layouts = [
    aboutVideo(),
    userInfo(),
    videoListHeader(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[video()],
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 20, bottom: 60),
                children: _layouts,
              ),
            ),
          ],
        ),
      ),
    );
  }
}






