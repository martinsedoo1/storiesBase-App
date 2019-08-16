import 'package:flutter/material.dart';

class SuggestionsVideoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return List();
  }
}

class List extends State<SuggestionsVideoList> {
  @override
  Widget build(BuildContext context) {
    return suggestionVideoList();
  }
}

Widget suggestionVideoList() {
  return Container(
    child: Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 15, top: 15),
          height: 85,
          width: 150,
          child: ClipRRect(
            borderRadius: new BorderRadius.circular(4.0),
            child: Image.network(
                "https://www.denverpost.com/wp-content/uploads/2018/01/day_in_pictures_010818_001.jpg?w=620",
                fit: BoxFit.fill),
          ),
        ),
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 15, top: 14),
                  child: Text(
                    "The Begin of the Drema S1(St 01) - Breaking bad",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, top: 3),
                  child: Text(
                    "Bassam Seydo",
                    style: TextStyle(color: Color(0xFF7D15C1), fontSize: 12),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 3),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            IconData(0xe417, fontFamily: 'MaterialIcons'),
                            color: Colors.green,
                            size: 17,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text("100K Views"),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 3),
                      child:   Row(
                        children: <Widget>[
                          Icon(
                            IconData(59517, fontFamily: 'MaterialIcons'),
                            color: Colors.red,
                            size: 17,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text("127 Likes"),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            )),
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
