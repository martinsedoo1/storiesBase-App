import 'package:flutter/material.dart';

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






