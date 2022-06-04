//library my_prj.globals;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddit/data.dart';
import 'package:reddit/globals.dart';
import 'package:reddit/task.dart';
import 'package:reddit/task2.dart';

import 'home_screan.dart';

class Post extends StatelessWidget {
  const Post({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: PostPage(),
      ),
    );
  }
}

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);
  @override
  State<PostPage> createState() => _PostPage();
}

class _PostPage extends State<PostPage> {
  int likeCounter = 0;
  int dislikeCounter = 0;
  void changeLike(int index) {
    bool currState = user.communitylist[index].like;
    setState(() {
      user.communitylist[index].setlike(!currState);
    });
  }

  void changeDislike(int index) {
    bool currState = user.communitylist[index].dislike;
    setState(() {
      user.communitylist[index].setdislike(!currState);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back,
                color: Color.fromARGB(255, 255, 255, 255)),
            tooltip: 'Back to setting page',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Feed()));
            },
          ),
          title: Text('Post'),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: ListView(children: [
          Row(
            children: [
              Icon(
                Icons.circle,
                size: 30,
                color: Color.fromARGB(255, 144, 24, 24),
              ),
              RichText(
                  text: const TextSpan(children: <TextSpan>[
                TextSpan(
                    text: "community name\n username\n ",
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                      color: Color.fromARGB(255, 255, 255, 255),
                    )),
              ])),
            ],
          ),
          /*Divider(
            thickness: 5, // thickness of the line
            indent: 20, // empty space to the leading edge of divider.
            endIndent: 20, // empty space to the trailing edge of the divider.
            color: Color.fromARGB(
                255, 144, 24, 24), // The color to use when painting the line.
            height: 20, // The divider's height extent.
          ),*/
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: RichText(
                    text: const TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: 'title\n\n\n posttext\n',
                      style: TextStyle(
                        fontSize: 30,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w300,
                        color: Color.fromARGB(255, 255, 255, 255),
                      )),
                ])),
              )
            ],
          ),
          Divider(
            thickness: 5, // thickness of the line
            indent: 20, // empty space to the leading edge of divider.
            endIndent: 20, // empty space to the trailing edge of the divider.
            color: Color.fromARGB(
                255, 0, 0, 0), // The color to use when painting the line.
            height: 20,
          ),
          Row(
            children: [
              Container(
                child: ListView.builder(
                  itemCount: user.communitylist.length,
                  itemBuilder: (contex, index) {
                    return task(
                      taskModel: user.communitylist[index],
                      changeLike: () => changeLike(index),
                    ); // TaskItem
                  },
                ),
              ),
              Container(
                child: ListView.builder(
                  itemCount: user.communitylist.length,
                  itemBuilder: (contex, index) {
                    return task2(
                      taskModel: user.communitylist[index],
                      changeDislike: () => changeDislike(index),
                    ); // TaskItem
                  },
                ),
              ),
            ],
          ),
        ]));
  }
}
