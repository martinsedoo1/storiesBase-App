import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:storiesbase/screens/stories/stories-view/widgets/stories-list.dart';
import 'package:storiesbase/screens/stories/stories-view/widgets/subscription-stories.dart';
import 'package:storiesbase/services/stories-service.dart';
import 'package:storiesbase/shared/app-bar.dart';

/*
* The Stories page will contains all the stories
* */
class StoriesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Stories();
  }
}

Future<List> _storiesFuture;

/*
* Used list view to display all the Lists of stories horizontally -
* after getting them from the API
* */
class Stories extends State<StoriesPage>
    with AutomaticKeepAliveClientMixin<StoriesPage> {
  StoriesService appService = new StoriesService();
  ScrollController _scrollViewController;

  var myList = new List();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _storiesFuture = appService.getStories();
    super.initState();

    _scrollViewController = new ScrollController();
    _scrollViewController.addListener(() {
      setState(() {
        if (_scrollViewController.position.pixels ==
            _scrollViewController.position.maxScrollExtent) {}
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double padding = (MediaQuery.of(context).size.height / 2) - 100;
    super.build(context);
    return new Scaffold(
      body: CustomScrollView(
        controller: _scrollViewController,
        slivers: <Widget>[
          SliverAppBarView(),
          subscriptionStories(),
          FutureBuilder(
            future: _storiesFuture,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return SliverToBoxAdapter(
                    child: Container(
                      padding: EdgeInsets.only(top: padding),
                      child: Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    this.myList = snapshot.data;
                    return SliverPadding(
                      padding: EdgeInsets.only(bottom: 100),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return storiesList(snapshot.data[index], context);
                          },
                          childCount: snapshot.data.length,
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    SliverToBoxAdapter(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Error, please try again later',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    );
                  }
                  return new SliverToBoxAdapter(
                    child: Text(""),
                  );
                default:
                  return new SliverToBoxAdapter(
                    child: Text(""),
                  );
              }
            },
          ),
        ],
      ),
    );
  }

}
