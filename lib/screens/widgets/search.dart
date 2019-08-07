import 'package:flutter/material.dart';

class Search extends SearchDelegate<String> {
  final videos = [
    "flying in",
    "special delivery",
    "delivery at door",
    "in-store pickup",
    "launch",
    "Mocha Current File",
    "basic",
    "Optional",
    "flying in",
    "special delivery",
    "delivery at door",
    "in-store pickup",
    "launch",
    "Mocha Current File",
    "basic",
    "Optional",
    "flying in",
    "special delivery",
    "delivery at door",
    "in-store pickup",
    "launch",
    "Mocha Current File",
    "basic",
    "Optional",
  ];

  final recentVideos = ["compound", "Flutter", "Day in the life"];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => {query = ""},
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () => {close(context, null)},
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentVideos
        : videos.where((name) => name.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => ListTile(
        leading: Icon(Icons.ondemand_video),
        title: Text(suggestionList[index]),
      ),
      itemCount: suggestionList.length,
    );
  }
}
