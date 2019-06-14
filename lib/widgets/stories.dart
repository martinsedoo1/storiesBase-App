import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:storiesbase/services/stories-service.dart';
import 'package:storiesbase/widgets/story-details.dart';

/*
* The Stories page will contains all the stories
* */
class StoriesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Stories();
  }
}

/*
* Used list view to display all the Lists of stories horizontally -
* after getting them from the API
* */
class Stories extends State<StoriesPage> {
  StoriesService appService = new StoriesService();
  var myList = new List();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: FutureBuilder(
          future: appService.getStories(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.done:
                if (snapshot.hasData) {
                  this.myList = snapshot.data;
                  return Container(
                    child: ListView.builder(
                      itemCount: myList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return makeList(index);
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'Error, please try again later',
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                }
                return new Text('');
              default:
                return new Text('');
            }
          },
        ),

      /*
      * [FloatingActionButton] add new Story
      *
      * */

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),

    );
  }


  /*
  * This widget will create a lists by the length of object
  * Each list will contain the stories
  *
  * */
  Widget makeList(theIndex) {
    return new Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      height: 320,
      child: Column(
        children: <Widget>[
          new Row(children: <Widget>[
            new Container(
              margin: EdgeInsets.only(left: 10),
              child: new Text(
                myList[theIndex]["category"],
                style: TextStyle(fontSize: 18, color: Colors.black),
                textAlign: TextAlign.start,
              ),
            ),
          ]),
          new Container(
            height: 280,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: myList[theIndex]["stories"].length,
              itemBuilder: (BuildContext context, int index) {
                return makeStoryWidget(myList[theIndex]["stories"][index]);
              },
            ),
          ),
        ],
      ),
    );
  }


  /*loadItem(item[itemIndex]),*/
  /*
  * [makeStoryWidget] will create the story and return it to the Listview
  * by clicking on the story it will navigate to the story details
  *
  * In the Following [loadItem] function it will return story as a Future in order that the FutureBuilder can read it.
  *
  * */
  Future getStory(Object story) async {
    return story;
  }

  Widget loadStoryWidget(story) {
    return new FutureBuilder(
        future: getStory(story),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Container(
                margin: EdgeInsets.all(6),
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: ClipRRect(
                        borderRadius: new BorderRadius.circular(8.0),
                        child: Image.network(
                          "https://images.pexels.com/photos/414612/pexels-photo-414612.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=150",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            case ConnectionState.done:
              if (snapshot.hasData) {
                return makeStoryWidget(snapshot.data);
              } else if (snapshot.hasError) {
                return new Text(
                  '${snapshot.error}',
                  style: TextStyle(color: Colors.red),
                );
              }
              return new Text('');
            default:
              return new Text('');
          }
        });
  }

  Widget makeStoryWidget(story) {
    return new GestureDetector(
      child: Container(
        margin: EdgeInsets.all(6),
        child: Stack(
          children: <Widget>[
            Container(
              child: ClipRRect(
                borderRadius: new BorderRadius.circular(8.0),
                child: Image.network(
                    story["picture"],
                    fit: BoxFit.cover, height: 300, width: 150),
              ),
            ),
            Container(
              height: 300,
              width: 150,
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
                      style: TextStyle(fontSize: 17,color: Colors.white),
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
                            story["picture"],
                          ),
                        ))),
              ),
            ),
          ],
        ),
      ),
      onTap: () => {
        Navigator.of(context).push(CupertinoPageRoute(builder: (context) =>  ViewStory())),
      },
    );

  }
}
