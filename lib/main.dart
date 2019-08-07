import 'package:flutter/material.dart';
import 'package:storiesbase/screens/home.dart';

void main() => runApp(new StoriesBase());

class StoriesBase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Infinite Scrolling',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
