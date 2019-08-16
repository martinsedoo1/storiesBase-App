import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:storiesbase/screens/stories/stories-view/stories.dart';
import 'package:storiesbase/screens/videos/videos-view/videos.dart';
import 'package:storiesbase/screens/home/widgets/custom-bottom-app-bar.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class Home extends StatefulWidget {
  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<Home> with TickerProviderStateMixin {
  int _selectPage = 0;
  final pages = [
    StoriesPage(),
    VideosPage(),
    Container(
      child: Text(
        "Profile",
        style: TextStyle(fontSize: 16),
      ),
    ),
    Container(
      child: Text(
        "Profile",
        style: TextStyle(fontSize: 16),
      ),
    ),
  ];

  void _selectedTab(int index) {
    setState(() {
      _selectPage = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.blueGrey);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
      body: IndexedStack(
        index: _selectPage,
        children: pages,
      ),
      bottomNavigationBar: FABBottomAppBar(
        onTabSelected: _selectedTab,
        selectedColor: Colors.blue,
        notchedShape: CircularNotchedRectangle(),
        items: [
          FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
          FABBottomAppBarItem(
              iconData: Icons.videocam, text: 'Videos', rightMargin: 35),
          FABBottomAppBarItem(
              iconData: Icons.notifications,
              text: 'Notifications',
              leftMargin: 35),
          FABBottomAppBarItem(iconData: Icons.menu, text: 'More'),
        ],
      ),
    );
  }
}
