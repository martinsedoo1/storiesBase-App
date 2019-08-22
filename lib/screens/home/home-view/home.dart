import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:storiesbase/screens/home/widgets/sidebar-menu.dart';
import 'package:storiesbase/screens/stories/stories-view/stories.dart';
import 'package:storiesbase/screens/videos/videos-view/videos.dart';
import 'package:storiesbase/screens/home/widgets/custom-bottom-app-bar.dart';

class Home extends StatefulWidget {
  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<Home> with TickerProviderStateMixin {
  static GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int _selectPage = 0;
  final pages = [
    StoriesPage(scaffoldKey: _scaffoldKey),
    VideosPage(scaffoldKey: _scaffoldKey),
    Container(
      child: Text(
        "Profile",
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
    ),
    Container(
      child: Text(
        "Profile",
        style: TextStyle(fontSize: 16, color: Colors.black),
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
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      drawer: Drawer(
        child: Sidebar(),
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
        elevation: 2.0,
        backgroundColor: Colors.blueAccent,
      ),
      body: IndexedStack(
        index: _selectPage,
        children: pages,
      ),
      bottomNavigationBar: CustomBottomAppBar(
        onTabSelected: _selectedTab,
        selectedColor: Colors.blue,
        notchedShape: CircularNotchedRectangle(),
        items: [
          BottomAppBarItem(iconData: Icons.home, text: 'Home'),
          BottomAppBarItem(
              iconData: Icons.videocam, text: 'Videos', rightMargin: 35),
          BottomAppBarItem(
              iconData: Icons.notifications,
              text: 'Notifications',
              leftMargin: 35),
          BottomAppBarItem(iconData: Icons.menu, text: 'More'),
        ],
      ),
    );
  }
}


