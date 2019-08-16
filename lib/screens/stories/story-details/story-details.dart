import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:storiesbase/screens/map/map-view/map.dart';

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
  double _radius = 20;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _scrollController = ScrollController();
  }

  /*
  *
  * [_animateUserInfoWidget] function will animate the userInfo widget by the position pixels
  * it will execute from initState function after the position is changed
  *
  * */
  void _animateUserInfoWidget(
      double _newMarginLeft, double _newMarginRight, double _newRadius) {
    _marginLeft = _newMarginLeft;
    _marginRight = _newMarginRight;
    _radius = _newRadius;
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  /*
  *
  * build Scaffold appbar and Body as a tabBarView to navigate between pages
  * [_tabController] will execute to give the [TabBarView] and [AppBar] the length instead Wrap it in [defaultTabBarView]
  *
  * */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: <Widget>[story(), MapPage(), Container(child: Text("ffef"))],
      ),
    );
  }

  /*
  *
  * [AppBar] widget will return PreferredSize with [AppBar] and [TabBar] as a child of appbar
  *
  * */
  Widget appBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(50),
      child: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        bottom: TabBar(
          isScrollable: true,
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: CustomTabIndicator(),
          indicatorColor: Colors.transparent,
          controller: _tabController,
          tabs: <Widget>[
            new Container(
              width: 100.0,
              child: new Tab(text: 'Story'),
            ),
            new Container(
              width: 100.0,
              child: new Tab(text: 'Map'),
            ),
            new Container(
              width: 100.0,
              child: new Tab(text: 'new'),
            ),
          ],
        ),
      ),
    );
  }

  /*
  *
  * [story] widget is all about the story
  * [NestedScrollView] will make it scrollable and build the [headerSliverBuilder]
  *
  * */
  Widget story() {
    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
        return <Widget>[
          SliverAppBar(
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
                  /*userInfo(),*/
                ],
              ),
            ),
            expandedHeight: 480.0,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(18),
              child: SafeArea(
                child: userInfo(),
              ),
            ),
          ),
        ];
      },
      body: Container(
        child: timeLine(),
      ),
    );
  }

  /*
  *
  * [UserInfo] widget will display the user info above timeline
  * by clicking [FlatButton] follow will follow the user
  *
  * */
  Widget userInfo() {
    return new AnimatedContainer(
      margin: EdgeInsets.only(left: _marginLeft, right: _marginRight),
      duration: Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(_radius),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(2.0, 6.0),
            blurRadius: 40.0,
          ),
        ],
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
                "Bela void",
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
    );
  }

  /*
  * This is the videoPlayer so that will display the video after combine the small stories
  * BoxDecoration will display the video in the background
  * */

  Widget videoPlayer() {
    return Container(
      height: 250,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "http://www.globalfashionstreet.com/wp-content/uploads/2017/10/fun-ways-to-make-your-memories-last-forever-know-how-to-truly-capture-those-travel-moments-1.jpg"),
              fit: BoxFit.fill)),
    );
  }

  /*
  * [timeLine] will create the timeline for the small stories
  * [ListView] has the small stories to make scrollable
  *
  * */
  Widget timeLine() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 25),
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return new Stack(
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: Card(
                color: new Color(0xFF333366),
                margin: new EdgeInsets.only(left: 15, bottom: 15, right: 10),
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
                        borderRadius: new BorderRadius.circular(8.0),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(10),
                            alignment: Alignment.topLeft,
                            child: Text("Hannover",
                                style: new TextStyle(
                                    fontSize: 18.0, color: Colors.white),),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(
                                left: 10, right: 5, top: 5, bottom: 10),
                            child: Text(
                                "Lorem Ipsum ist ein einfacher Demo-Text für die Print- und Schriftindustrie. Lorem Ipsum ist in der Industrie bereits der Standard Demo-Text seit 1500, als ein unbekannter Schriftsteller eine Hand voll Wörter nahm und diese durcheinander warf um ein Musterbuch zu erstellen.",
                                style: new TextStyle(
                                    fontSize: 15.0, color: Colors.white),),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            new Positioned(
              width: 5,
              top: 0.0,
              bottom: 0.0,
              left: 35.0,
              child: new Container(
                height: double.infinity,
                width: 1.0,
                color: Color(0xff1A355B),
              ),
            ),
            new Positioned(
              top: 100.0,
              left: 14.0,
              child: new Container(
                height: 47.0,
                width: 47.0,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: new Container(
                  margin: new EdgeInsets.all(4.0),
                  height: 25.0,
                  width: 25.0,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://recdonline.com.au/assets/admin/assets/pages/media/pages/photo3.jpg"),
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
}

/*
*
* CustomTabIndicator will paint the TabBar and animate it
* [Offset] is the position from where the decoration should be drawn.
*
* */

class CustomTabIndicator extends Decoration {
  @override
  _CustomPainter createBoxPainter([VoidCallback onChanged]) {
    return new _CustomPainter(this, onChanged);
  }
}

class _CustomPainter extends BoxPainter {
  final CustomTabIndicator decoration;

  _CustomPainter(this.decoration, VoidCallback onChanged)
      : assert(decoration != null),
        super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);
    final Rect rect =
        Offset(offset.dx, (configuration.size.height / 2) - 40.0 / 2) &
            Size(configuration.size.width, 40.0);
    final Paint paint = Paint();
    paint.color = Colors.blueAccent;
    paint.style = PaintingStyle.fill;
    canvas.drawRRect(
        RRect.fromRectAndRadius(rect, Radius.circular(20.0)), paint);
  }
}
