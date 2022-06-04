import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reddit/Todo_list.dart';
import 'package:reddit/about_us_scraen.dart';
import 'package:reddit/change_theme.dart';
import 'package:reddit/create_a_community_screan.dart';
import 'package:reddit/data.dart';
import 'package:reddit/globals.dart';
import 'package:reddit/home_screan.dart';
import 'package:reddit/login_screan.dart';
import 'package:reddit/profile_screan.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:reddit/task.dart';
import 'package:reddit/task2.dart';
import 'package:reddit/taskItem.dart';
import 'package:easy_search_bar/easy_search_bar.dart';

class DetailPost extends StatelessWidget {
  const DetailPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: background,
        body: DetailPostState(),
      ),
    );
  }
}

class DetailPostState extends StatefulWidget {
  const DetailPostState({Key? key}) : super(key: key);
  @override
  State<DetailPostState> createState() => _DetailPostState();
}

class _DetailPostState extends State<DetailPostState> {
  int likeCounter = 0;
  int dislikeCounter = 0;

  Icon liked = Icon(
    Icons.thumb_up_alt_outlined,
    color: text,
  );
  Icon disLiked = Icon(
    Icons.thumb_down_alt_outlined,
    color: text,
  );

  bool isLiked = false;
  bool isDisLiked = false;

  bool showComment = false;

  Column comment = Column(
    children: [
      SizedBox(
        height: 1,
        child: Container(color: text),
      ),
      Row(
        children: [
          Icon(
            Icons.circle,
            size: 30,
            color: backgroundWidget,
          ),
          RichText(
              text: TextSpan(children: <TextSpan>[
            TextSpan(
                text:
                    "\n u/mahdi\n....................................................\n",
                style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                  color: text,
                )),
          ]))
        ],
      ),
    ],
  );

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
        backgroundColor: background,
        drawer: Drawer(
            backgroundColor: backgroundWidget,
            child:
                ListView(padding: EdgeInsets.fromLTRB(0, 30, 0, 0), children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: background,
                ),
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 40.0,
                      backgroundImage: AssetImage('assets/images/icon.png'),
                    ),
                    Text(
                      'Reddit',
                      style: TextStyle(fontSize: 30, color: backgroundWidget),
                    )
                  ],
                ),
              ),
              ListTile(
                  title: const Text('Profile'),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Profile()))),
              ListTile(
                  title: const Text('Create a communities'),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateACommunity()))),
              ListTile(
                  title: const Text('Saved post'),
                  onTap: () => Navigator.pop(context)),
              ListTile(
                  title: const Text('About us'),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutUs()))),
              ListTile(
                  title: const Text('Log out'),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Login()))),
            ])),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          title: const Text(
            'Post',
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: MySearchDelegate(),
                );
              },
            )
          ],
        ),
        body: ListView(
          children: [
            Container(
                height: 465,
                decoration: BoxDecoration(
                  color: background,
                  border: Border.all(
                    color: text,
                    width: 4,
                  ),
                ),
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                padding: const EdgeInsets.fromLTRB(15, 2, 15, 2),
                child: Column(children: [
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        size: 60,
                        color: backgroundWidget,
                      ),
                      RichText(
                          text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: " r/music\n u/coleman57",
                            style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w300,
                              color: text,
                            )),
                      ])),
                    ],
                  ),
                  RichText(
                      text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text:
                            "\nWhat's that Johnny Cash song about a troublemaker who turns out to be Jesus?\n\n",
                        style: TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          color: text,
                        )),
                    TextSpan(
                        text:
                            "Sorry for the spoiler, but anyway--I've heard it a dozen times, but can't find it in a google search. I keep getting pointed to unrelated songs. This one has to be from between 1968 and '72, and it talks about this long-haired guy who's walkin' around in sandals talking against war and materialism and hangin' out with thieves and prostitutes and getting the young folks all riled up. And then the authorities finally round him up and nail him to a cross.\n ",
                        style: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w300,
                          color: text,
                        )),
                  ])),
                  SizedBox(
                    height: 1,
                    child: Container(color: text),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: liked,
                        onPressed: () {
                          setState(() {
                            if (isLiked) {
                              isLiked = !isLiked;
                              liked = Icon(
                                Icons.thumb_up_alt_outlined,
                                color: text,
                              );
                            } else {
                              isLiked = !isLiked;
                              liked = Icon(
                                Icons.thumb_up_alt_rounded,
                                color: text,
                              );
                            }
                          });
                        },
                      ),
                      Text(
                        isLiked ? "1" : "0",
                        style: TextStyle(color: text),
                      ),
                      IconButton(
                        icon: disLiked,
                        onPressed: () {
                          setState(() {
                            if (isDisLiked) {
                              isDisLiked = !isDisLiked;
                              disLiked = Icon(
                                Icons.thumb_down_alt_outlined,
                                color: text,
                              );
                            } else {
                              isDisLiked = !isDisLiked;
                              disLiked = Icon(
                                Icons.thumb_down_alt_rounded,
                                color: text,
                              );
                            }
                          });
                        },
                      ),
                      Text(
                        isDisLiked ? "1" : "0",
                        style: TextStyle(color: text),
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(
                          Icons.comment,
                          color: text,
                        ),
                        onPressed: () {
                          setState(() {
                            showComment = !showComment;
                          });
                        },
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(
                          Icons.share,
                          color: text,
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                  showComment ? comment : Column(),
                ])),
            Container(
                height: 465,
                decoration: BoxDecoration(
                  color: background,
                  border: Border.all(
                    color: text,
                    width: 4,
                  ),
                ),
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                padding: const EdgeInsets.fromLTRB(15, 2, 15, 2),
                child: Column(children: [
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        size: 60,
                        color: backgroundWidget,
                      ),
                      RichText(
                          text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: " r/music\n u/coleman57",
                            style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w300,
                              color: text,
                            )),
                      ])),
                    ],
                  ),
                  RichText(
                      text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text:
                            "\nWhat's that Johnny Cash song about a troublemaker who turns out to be Jesus?\n\n",
                        style: TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          color: text,
                        )),
                    TextSpan(
                        text:
                            "Sorry for the spoiler, but anyway--I've heard it a dozen times, but can't find it in a google search. I keep getting pointed to unrelated songs. This one has to be from between 1968 and '72, and it talks about this long-haired guy who's walkin' around in sandals talking against war and materialism and hangin' out with thieves and prostitutes and getting the young folks all riled up. And then the authorities finally round him up and nail him to a cross.\n ",
                        style: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w300,
                          color: text,
                        )),
                  ])),
                  SizedBox(
                    height: 1,
                    child: Container(color: text),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: liked,
                        onPressed: () {
                          setState(() {
                            if (isLiked) {
                              isLiked = !isLiked;
                              liked = Icon(
                                Icons.thumb_up_alt_outlined,
                                color: text,
                              );
                            } else {
                              isLiked = !isLiked;
                              liked = Icon(
                                Icons.thumb_up_alt_rounded,
                                color: text,
                              );
                            }
                          });
                        },
                      ),
                      Text(
                        isLiked ? "1" : "0",
                        style: TextStyle(color: text),
                      ),
                      IconButton(
                        icon: disLiked,
                        onPressed: () {
                          setState(() {
                            if (isDisLiked) {
                              isDisLiked = !isDisLiked;
                              disLiked = Icon(
                                Icons.thumb_down_alt_outlined,
                                color: text,
                              );
                            } else {
                              isDisLiked = !isDisLiked;
                              disLiked = Icon(
                                Icons.thumb_down_alt_rounded,
                                color: text,
                              );
                            }
                          });
                        },
                      ),
                      Text(
                        isDisLiked ? "1" : "0",
                        style: TextStyle(color: text),
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(
                          Icons.comment,
                          color: text,
                        ),
                        onPressed: () {
                          setState(() {
                            showComment = !showComment;
                          });
                        },
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(
                          Icons.share,
                          color: text,
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                  showComment ? comment : Column(),
                ])),
          ],
        ));
  }
}
