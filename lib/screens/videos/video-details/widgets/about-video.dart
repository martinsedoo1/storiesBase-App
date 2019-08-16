import 'package:flutter/material.dart';

Widget aboutVideo() {
  return Column(
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 5.0, top: 0.0),
        alignment: Alignment.topLeft,
        child: Text(
          "About",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color(0xFF1E2850),
          ),
        ),
      ),
      ListTile(
        subtitle: Text(
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo",
          style: TextStyle(color: Colors.black87, fontSize: 14),
        ),
      ),
    ],
  );
}