import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:storiesbase/screens/story-details.dart';
import 'package:storiesbase/screens/widgets/sidebar-menu.dart';
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
          SliverToBoxAdapter(
            child: Column(
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
                              padding: EdgeInsets.only(
                                  left: 7, top: 10, right: 5, bottom: 0),
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
            ),
          ),
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
                  ));
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    this.myList = snapshot.data;
                    return SliverPadding(
                      padding: EdgeInsets.only(bottom: 100),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return makeList(snapshot.data[index]);
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

  /*CustomScrollView(
  controller: _scrollViewController,
  slivers: <Widget>[
  SliverAppBarView(),


  ],
  ),*/

  /*
  * This widget will create a lists by the length of object
  * Each list will contain the stories
  *
  * */
  Widget makeList(story) {
    return new Padding(
      padding: EdgeInsets.symmetric(vertical: 0),
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
                return makeStoryWidget(story["stories"][index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  /*
  * [makeStoryWidget] will create the story and return it to the Listview
  * by clicking on the story it will navigate to the story details
  *
  * In the Following [loadItem] function it will return story as a Future in order that the FutureBuilder can read it.
  *
  * */
  Future getStory(Object story) async {
    return story;
  }

  Widget loadStoryWidget(story) {
    return new FutureBuilder(
        future: getStory(story),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasData) {
                return makeStoryWidget(snapshot.data);
              } else if (snapshot.hasError) {
                return new Text(
                  '${snapshot.error}',
                  style: TextStyle(color: Colors.red),
                );
              }
              return new Text('');
            default:
              return new Text('');
          }
        });
  }

  Widget makeSubscriptionStories() {
    return Container(
      height: 50,
      child: CircleAvatar(
        foregroundColor: Colors.amber,
        backgroundColor: Colors.black,
        backgroundImage: NetworkImage(
          "https://blog.mynd.com/hs-fs/hubfs/DE_Blogartikel/030_Youtube%20Stories/Story-Use-Case-Unternehmen-Einblick-Arbeitsalltag.jpg?width=571&name=Story-Use-Case-Unternehmen-Einblick-Arbeitsalltag.jpg",
        ),
      ),
    );
  }

  Widget makeStoryWidget(story) {
    return new GestureDetector(
      child: Container(
        margin: EdgeInsets.all(6),
        child: Stack(
          children: <Widget>[
            Container(
              child: ClipRRect(
                borderRadius: new BorderRadius.circular(8.0),
                child: Image.network(
                    /*story["picture"]*/
                    "https://blog.mynd.com/hs-fs/hubfs/DE_Blogartikel/030_Youtube%20Stories/Story-Use-Case-Unternehmen-Einblick-Arbeitsalltag.jpg?width=571&name=Story-Use-Case-Unternehmen-Einblick-Arbeitsalltag.jpg",
                    fit: BoxFit.cover,
                    height: 260,
                    width: 150),
              ),
            ),
            Container(
              height: 260,
              width: 140,
              decoration: BoxDecoration(
                  borderRadius: new BorderRadius.circular(8.0),
                  gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0x00000000),
                      const Color(0x00000000),
                      const Color(0xCC000000),
                    ],
                    stops: [0.0, 0.5, 1.0],
                  )),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                    margin: EdgeInsets.all(6),
                    alignment: Alignment.bottomCenter,
                    width: 150,
                    child: Text(
                      story["name"],
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    )),
              ),
            ),
            Align(
              child: Container(
                alignment: Alignment.topRight,
                width: 150,
                /* margin: EdgeInsets.all(5),*/
                child: Container(
                  margin: EdgeInsets.only(right: 8, top: 8),
                  width: 45,
                  height: 45,
                  decoration: new BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87,
                        blurRadius: 6.0,
                      )
                    ],
                    border: Border.all(
                      width: 2.0,
                      style: BorderStyle.solid,
                      color: Colors.red,
                    ),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9nnwbIfLUkDSs_1D3v85j6wnGMXxcuRo2IPz8OJhjQRTjX3VZ",
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () => {
        Navigator.of(context)
            .push(CupertinoPageRoute(builder: (context) => ViewStory())),
      },
    );
  }
}
