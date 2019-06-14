import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:storiesbase/widgets/stories.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          bottomNavigationBar: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                icon: Icon(Icons.search),
              ),
              Tab(
                icon: Icon(Icons.notifications),
              ),
              Tab(
                icon: Icon(Icons.person),
              ),
            ],
              unselectedLabelColor: Color(0xff999999),
              labelColor: Colors.black,
              indicatorColor: Colors.transparent,
          ),
          body: TabBarView(
            children: <Widget>[
              StoriesPage(),
              Center(
                child: Text("page 2"),
              ),
              Center(
                child: Text("page 3"),
              ),
              Center(
                child: Text("page 4"),
              ),
            ],
          ),
        ),
      ),
    );
  }


}