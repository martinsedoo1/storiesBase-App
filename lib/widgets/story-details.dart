import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ViewStory extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StoryDetails();
  }
}

class StoryDetails extends State<ViewStory>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollController;
  double _marginLeft = 5;
  double _marginRight = 5;
  double _radius = 10;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        if (_scrollController.position.pixels > 450.0) {
          _marginLeft = 0;
          _marginRight = 0;
          _radius = 0;
        }
        if (_scrollController.position.pixels ==
            _scrollController.position.minScrollExtent) {
          _marginLeft = 5;
          _marginRight = 5;
          _radius = 10;
        }
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
            return [
              SliverAppBar(
                forceElevated: boxIsScrolled,
                pinned: true,
                backgroundColor: Colors.white,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.none,
                  background: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 270.0,
                        width: double.infinity,
                        color: Colors.grey,
                        child: videoPlayer(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Business Office',
                          style: TextStyle(fontSize: 25.0),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Open now\nStreet Address, 299\nCity, State',
                          style: TextStyle(fontSize: 15.0),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      userInfo(),
                    ],
                  ),
                ),
                expandedHeight: 540.0,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(18),
                  child: SafeArea(
                    child: AnimatedContainer(
                      margin: EdgeInsets.only(
                          left: _marginLeft, right: _marginRight),
                      duration: Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(_radius),
                        color: Colors.blue,
                      ),
                      child: tabBar(),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              timeLine(),
              timeLine(),
            ],
          )),
    );
  }

  Widget tabBar() {
    return new TabBar(
      isScrollable: false,
      indicatorColor: Colors.transparent,
      controller: _tabController,
      tabs: [
        Tab(icon: Icon(Icons.photo), text: "Stories"),
        Tab(icon: Icon(Icons.map), text: "Map"),
      ],
    );
  }

  Widget videoPlayer() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "http://www.globalfashionstreet.com/wp-content/uploads/2017/10/fun-ways-to-make-your-memories-last-forever-know-how-to-truly-capture-those-travel-moments-1.jpg"),
              fit: BoxFit.fill)),
    );
  }

  Widget videoInfo() {
    return Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(2.0, 6.0),
              blurRadius: 40.0,
            )
          ],
        ),
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ExpansionTile(
              title: new Text("What is Lorem Ipsum ?",
                  style: TextStyle(fontSize: 16)),
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  child: new Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                )
              ],
            )));
  }

  Widget userInfo() {
    return Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(2.0, 6.0),
              blurRadius: 40.0,
            )
          ],
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://recdonline.com.au/assets/admin/assets/pages/media/pages/photo3.jpg"),
                  ),
                  title: Text(
                    "sdsdfsdfsdfsdf",
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text("15,000 subscribers"),
                ),
              ),
              FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.play_circle_filled,
                    color: Colors.red,
                  ),
                  label: Text(
                    "SUBSCRIBE",
                    style: TextStyle(color: Colors.red),
                  ))
            ],
          ),
        ));
  }
}

Widget timeLine() {
  return ListView.builder(
    itemCount: 5,
    itemBuilder: (BuildContext context, int index) {
      return new Stack(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Card(
                color: new Color(0xFF333366),
                margin: new EdgeInsets.only(left: 20, bottom: 15, right: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                child: Column(
                  children: <Widget>[
                    new Container(
                      width: double.infinity,
                      height: 200.0,
                      decoration: new BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "http://www.globalfashionstreet.com/wp-content/uploads/2017/10/fun-ways-to-make-your-memories-last-forever-know-how-to-truly-capture-those-travel-moments-1.jpg")),
                        shape: BoxShape.rectangle,
                        borderRadius: new BorderRadius.circular(8.0),
                        boxShadow: <BoxShadow>[
                          new BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10.0,
                            offset: new Offset(0.0, 10.0),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: ExpansionTile(
                        title: Text("Hannover",
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white)),
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Text(
                                "Lorem Ipsum ist ein einfacher Demo-Text für die Print- und Schriftindustrie. Lorem Ipsum ist in der Industrie bereits der Standard Demo-Text seit 1500, als ein unbekannter Schriftsteller eine Hand voll Wörter nahm und diese durcheinander warf um ein Musterbuch zu erstellen.",
                                style: new TextStyle(
                                    fontSize: 15.0, color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
          new Positioned(
            width: 5,
            top: 0.0,
            bottom: 0.0,
            left: 33.0,
            child: new Container(
              height: double.infinity,
              width: 1.0,
              color: Color(0xff1A355B),
            ),
          ),
          new Positioned(
            top: 100.0,
            left: 10.0,
            child: new Container(
              height: 50.0,
              width: 50.0,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: new Container(
                margin: new EdgeInsets.all(2.0),
                height: 30.0,
                width: 30.0,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                  image: DecorationImage(
                    image: NetworkImage(
                        "http://www.globalfashionstreet.com/wp-content/uploads/2017/10/fun-ways-to-make-your-memories-last-forever-know-how-to-truly-capture-those-travel-moments-1.jpg"),
                  ),
                ),
              ),
            ),
          )
        ],
      );
    },
  );
}
