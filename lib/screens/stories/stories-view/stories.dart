import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:storiesbase/screens/stories/stories-view/widgets/stories-list.dart';
import 'package:storiesbase/screens/stories/stories-view/widgets/subscription-stories.dart';
import 'package:storiesbase/services/stories-service.dart';
import 'package:storiesbase/shared/reusable-widgets/nested-scroll-view.dart';

/*
* The Stories page will contains all the stories
* */
class StoriesPage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const StoriesPage({Key key, this.scaffoldKey}) : super(key: key);

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
  var myList = new List();
  List<Widget> _layouts = [];

  void _loadStories(context) {
    this._layouts.add(subscriptionStories());
    for (int i = 0; i < myList.length; i++) {
      this._layouts.add(storiesList(myList[i], context));
    }
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _storiesFuture = appService.getStories();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomNestedScrollView(
      scaffoldKey: widget.scaffoldKey,
      nestedScrollViewBody: FutureBuilder(
        future: _storiesFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Container(
                child: Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                ),
              );
            case ConnectionState.done:
              if (snapshot.hasData) {
                this.myList = snapshot.data;
                this._layouts = [];
                _loadStories(context);
                return MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView(
                    children: _layouts,
                  ),
                );
              } else if (snapshot.hasError) {
                Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Error, please try again later',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                );
              }
              return new Container(
                child: Text(""),
              );
            default:
              return new Container(
                child: Text(""),
              );
          }
        },
      ),
    );
  }
}
