import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Sidebar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Menu();
  }
}

class Menu extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          children: <Widget>[
            Text(
              "DashBoard",
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
            Text(
              "DashBoard",
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
            Text(
              "DashBoard",
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
            Text(
              "DashBoard",
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
