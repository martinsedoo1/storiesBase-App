import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:storiesbase/screens/profile/user-profile/user-profile.dart';

class Sidebar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Menu();
  }
}

class Menu extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10, top: 10),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () => {
                        Navigator.pop(context),
                        Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (context) => UserProfile()),
                        ),
                      },
                      child: Container(
                        width: 60.0,
                        height: 60.0,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            "https://images.squarespace-cdn.com/content/5aee389b3c3a531e6245ae76/1530965251082-9L40PL9QH6PATNQ93LUK/linkedinPortraits_DwayneBrown08.jpg?format=1000w&content-type=image%2Fjpeg",
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: usernameAndEmail(
                          menuText("Bassam Seydo", Colors.black, 3.0,
                              FontWeight.w500, 17.0),
                          menuText("@Seydobassam", Colors.blueGrey, 0.0,
                              FontWeight.w500, 16.0),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    menuText("180", Colors.black, 5.0, FontWeight.w500, 18.0),
                    menuText("Followers", Colors.blueGrey, 6.0, FontWeight.w600,
                        18.0),
                    menuText("70", Colors.black, 12.0, FontWeight.w500, 18.0),
                    menuText("Following", Colors.blueGrey, 6.0, FontWeight.w600,
                        18.0),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Divider(
            color: Colors.grey,
          ),
          menuItem(
            menuItemIcon(AssetImage("assets/icons/user.png"), Colors.black54),
            menuItemIconText(
              menuText(
                "Profile",
                Colors.black,
                6.0,
                FontWeight.normal,
                20.0,
              ),
            ),
            UserProfile(),
            context,
          ),
          menuItem(
            menuItemIcon(
                AssetImage("assets/icons/timeline2.png"), Colors.black54),
            menuItemIconText(
              menuText(
                "Moments",
                Colors.black,
                6.0,
                FontWeight.normal,
                20.0,
              ),
            ),
            UserProfile(),
            context,
          ),
          menuItem(
            menuItemIcon(
              AssetImage("assets/icons/tag.png"),
              Colors.black54,
            ),
            menuItemIconText(
              menuText(
                "Saved",
                Colors.black,
                6.0,
                FontWeight.normal,
                20.0,
              ),
            ),
            UserProfile(),
            context,
          ),
          menuItem(
            menuItemIcon(
                AssetImage("assets/icons/private.png"), Colors.black54),
            menuItemIconText(
              menuText(
                "Private",
                Colors.black,
                6.0,
                FontWeight.normal,
                20.0,
              ),
            ),
            UserProfile(),
            context,
          ),
          Divider(
            color: Colors.grey,
          ),
          menuItem(
            menuItemIcon(
                AssetImage("assets/icons/controls.png"), Colors.black54),
            menuItemIconText(
              menuText(
                "Settings",
                Colors.black,
                6.0,
                FontWeight.normal,
                20.0,
              ),
            ),
            UserProfile(),
            context,
          ),
          menuItem(
            menuItemIcon(
                AssetImage("assets/icons/information.png"), Colors.black54),
            menuItemIconText(
              menuText(
                "Help",
                Colors.black,
                6.0,
                FontWeight.normal,
                20.0,
              ),
            ),
            UserProfile(),
            context,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Divider(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget menuText(String text, Color color, double padding, FontWeight fontWeight,
        double fontSize) =>
    Padding(
      padding: EdgeInsets.only(left: padding),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );

Widget usernameAndEmail(Widget username, Widget email) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        username,
        SizedBox(height: 8),
        email,
      ],
    );

Widget menuItem(Widget menuItemIcon, Widget menuItemIconText, page,
        BuildContext context) =>
    Container(
      child: InkWell(
        onTap: () => {

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          ),
        },
        child: Row(
          children: <Widget>[menuItemIcon, menuItemIconText],
        ),
      ),
    );

Widget menuItemIcon(AssetImage assetImage, Color iconColor) => Container(
      padding: EdgeInsets.only(left: 20),
      height: 60,
      child: ImageIcon(
        assetImage,
        size: 22,
        color: iconColor,
      ),
    );

Widget menuItemIconText(Widget menuItemText) => Container(
      padding: EdgeInsets.only(left: 20, top: 3),
      child: menuItemText,
    );
