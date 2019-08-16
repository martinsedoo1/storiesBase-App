import 'package:flutter/material.dart';
import 'package:storiesbase/screens/home/widgets/app-bar.dart';

class CustomNestedScrollView extends StatefulWidget {

  final Widget nestedScrollViewBody;

  const CustomNestedScrollView({Key key, this.nestedScrollViewBody})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => NestedScroll();
}

class NestedScroll extends State<CustomNestedScrollView> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBarView(),
          ];
        },
        body: widget.nestedScrollViewBody,
    );
  }
}
