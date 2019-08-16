import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storiesbase/screens/stories/story-details/story-details.dart';



Widget storyView(story, context) {
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
