import 'package:flutter/material.dart';

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