import 'package:flutter/material.dart';

Widget subscriptionStories() {
  return Column(
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(top: 0),
        height: 100.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 7, top: 10, right: 5, bottom: 0),
                    width: 80.0,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        "http://bo7.net/wp-content/uploads/2019/07/4415-7.jpg",
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text("Name"),
                ),
              ],
            );
          },
        ),
      ),
    ],
  );
}
