
import 'package:flutter/material.dart';
import 'package:storiesbase/screens/stories/stories-view/widgets/story.dart';

Widget storiesList(story, context) {
  return  Padding(
    padding: EdgeInsets.only(top: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Container(
          margin: EdgeInsets.only(left: 10),
          child: new Text(
            story["category"],
            style: TextStyle(fontSize: 18, color: Colors.black),
            textAlign: TextAlign.start,
          ),
        ),
        new Container(
          height: 280,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: story["stories"].length,
            itemBuilder: (BuildContext context, int index) {
              return storyView(story["stories"][index], context);
            },
          ),
        ),
      ],
    ),
  );
}
