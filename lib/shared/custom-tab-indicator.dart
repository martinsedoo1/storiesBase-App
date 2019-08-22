import 'package:flutter/material.dart';


/*class CustomTabBar extends StatefulWidget{
  final TabController tabController;
  const CustomTabBar({Key key, this.tabController}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CustomTabBarView();
  }
}



class CustomTabBarView extends State<CustomTabBar>{
  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      unselectedLabelColor: Colors.grey,
      labelColor: Colors.white,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: CustomTabIndicator(),
      indicatorColor: Colors.transparent,
      controller: widget.tabController,
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
    );
  }

}*/





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
        Offset(offset.dx, (configuration.size.height / 2) - 35.0 / 2) &
            Size(configuration.size.width, 35.0);
    final Paint paint = Paint();
    paint.color =   Color(0xFF5199B3);
    paint.style = PaintingStyle.fill;
    canvas.drawRRect(
        RRect.fromRectAndRadius(rect, Radius.circular(7.0)), paint);
  }
}
