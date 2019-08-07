import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:storiesbase/screens/widgets/suggestions-video-list.dart';

class VideoDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return VideoDetailsView();
  }
}

class VideoDetailsView extends State<VideoDetails> {
  var _layouts = [
    aboutVideo(),
    userInfo(),
    videoListHeader(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
    SuggestionsVideoList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[video()],
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 20, bottom: 60),
                children: _layouts,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget video() {
  return Hero(
    tag: "bassam",
    child: Container(
      height: 290,
      child: Image.network(
        "https://ichef.bbci.co.uk/news/976/media/images/83351000/jpg/_83351965_explorer273lincolnshirewoldssouthpicturebynicholassilkstone.jpg",
        fit: BoxFit.fill,
      ),
    ),
  );
}

Widget userInfo() {
  return new AnimatedContainer(
    duration: Duration(milliseconds: 200),
    decoration: BoxDecoration(
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
            subtitle: Text(
              "17,000 Followers",
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 15),
          child: FlatButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.add,
              color: Color(0xFF7D15C1),
            ),
            label: Text(
              "Follow",
              style: TextStyle(
                color: Color(0xFF7D15C1),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget videoListHeader() {
  return Container(
    margin: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: Text(
            "Videos",
            style: TextStyle(
              color: Color(0xFF1E2850),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          child: Text(
            "New stories",
            style: TextStyle(
              color: Color(0xFF7D15C1),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    ),
  );
}

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
