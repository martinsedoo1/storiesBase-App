import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/*
*  Display a List of random Stories and search a story to find it 
* */
class ViewStories extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StoryList();
  }
}

class StoryList extends State<ViewStories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
