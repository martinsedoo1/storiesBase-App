import 'package:flutter/material.dart';
import 'package:storiesbase/shared/custom-tab-indicator.dart';

Widget userInfoView(BuildContext context, TabController _tabController) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () => {
                      Navigator.pop(context),
                    }),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () => {})
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 7, right: 5, left: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              profilePicture(),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 7, right: 5, left: 10),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          userInfo(
                            textItem(
                              "19",
                              EdgeInsets.all(0),
                              Colors.black,
                              16.0,
                            ),
                            textItem(
                              "Stories",
                              EdgeInsets.only(top: 7),
                              Colors.black54,
                              15.0,
                            ),
                          ),
                          userInfo(
                            textItem(
                                "70", EdgeInsets.all(0), Colors.black, 16.0),
                            textItem("Moments", EdgeInsets.only(top: 7),
                                Colors.black54, 15.0),
                          ),
                          userInfo(
                            textItem(
                                "170K", EdgeInsets.all(0), Colors.black, 16.0),
                            textItem("Followers", EdgeInsets.only(top: 7),
                                Colors.black54, 15.0),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 12, right: 12),
                              child: ButtonTheme(
                                height: 30,
                                child: RaisedButton(
                                  color: Color(0xFF5199B3),
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    "Follow",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10, top: 10),
          child: Text(
            "Robin newspaper",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10, top: 10),
          child: Text(
            "it is always morning somewhere in the wold !. it is always morning somewhere in the wold !",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
        ),
        Material(
          color: Colors.white12,
          child: Container(
            margin: EdgeInsets.only(left: 10, top: 15, right: 10),
            child: tabBar(_tabController),
          ),
        ),
        Expanded(
          child: Material(
            color: Colors.white30,
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                Container(
                  child: Text("1"),
                ),
                Container(
                  child: Text("2"),
                ),
                Container(
                  child: Text("3"),
                ),
                Container(
                  child: Text("4"),
                ),
                Container(
                  child: Text("5"),
                ),
                Container(
                  child: Text("5"),
                ),
              ],
            ),
          ),
        ),
      ],
    );

Widget userInfo(Widget userInfo, Widget userInfoText) => Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[userInfo, userInfoText],
    );

Widget textItem(
        String itemText, EdgeInsets margin, Color color, double fontSize) =>
    Container(
      margin: margin,
      child: new Text(
        itemText,
        style: TextStyle(color: color, fontSize: fontSize),
      ),
    );

Widget profilePicture() => InkWell(
      onTap: () => {},
      child: Container(
        width: 100.0,
        height: 100.0,
        child: CircleAvatar(
          backgroundImage: NetworkImage(
            "https://images.squarespace-cdn.com/content/5aee389b3c3a531e6245ae76/1530965251082-9L40PL9QH6PATNQ93LUK/linkedinPortraits_DwayneBrown08.jpg?format=1000w&content-type=image%2Fjpeg",
          ),
        ),
      ),
    );

Widget tabBar(TabController tabController) => TabBar(
      isScrollable: true,
      unselectedLabelColor: Colors.black87,
      labelColor: Colors.white,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: CustomTabIndicator(),
      indicatorColor: Colors.transparent,
      controller: tabController,
      tabs: <Widget>[
        new Container(
          child: new Tab(text: 'Stories'),
        ),
        new Container(
          child: new Tab(text: 'Moments'),
        ),
        new Container(
          child: new Tab(text: 'Contries'),
        ),
        new Container(
          child: new Tab(text: 'Timeline'),
        ),
        new Container(
          child: new Tab(text: 'Map'),
        ),
        new Container(
          child: new Tab(text: 'About'),
        ),
      ],
    );
