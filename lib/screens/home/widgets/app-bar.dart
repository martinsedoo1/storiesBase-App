import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:storiesbase/screens/home/widgets/search.dart';

class SliverAppBarView extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;
  const SliverAppBarView({Key key, this.scaffoldKey}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AppBarView();
  }
}

class AppBarView extends State<SliverAppBarView> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      snap: true,
      floating: true,
      forceElevated: false,
      backgroundColor: Colors.white,
      leading: InkWell(
        onTap: () => {widget.scaffoldKey.currentState.openDrawer()},
        child: new Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: ClipOval(
              child: Image.network(
                  'https://images.squarespace-cdn.com/content/5aee389b3c3a531e6245ae76/1530965251082-9L40PL9QH6PATNQ93LUK/linkedinPortraits_DwayneBrown08.jpg?format=1000w&content-type=image%2Fjpeg'),
            ),
          ),
        ),
      ),
      actions: <Widget>[
        IconButton(
          alignment: Alignment.centerLeft,
          icon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          onPressed: () {
            showSearch(context: context, delegate: Search());
          },
        ),
      ],
      title: Container(
        alignment: Alignment.centerLeft,
        child: Image.network(
          "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Instagram_logo.svg/1280px-Instagram_logo.svg.png",
          height: 40,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
