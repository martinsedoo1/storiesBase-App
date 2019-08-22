import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:storiesbase/screens/videos/videos-view/widgets/videos-list.dart';
import 'package:storiesbase/shared/reusable-widgets/nested-scroll-view.dart';

class VideosPage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const VideosPage({Key key, this.scaffoldKey}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return Videos();
  }
}

class Videos extends State<VideosPage> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomNestedScrollView(
      scaffoldKey: widget.scaffoldKey,
      nestedScrollViewBody: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return listVideo(context);
          },
        ),
      ),
    );
  }
}
