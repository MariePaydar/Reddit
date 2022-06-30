import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reddit/comment.dart';
import 'package:reddit/data.dart';
import 'package:reddit/globals.dart';
import 'package:reddit/home_screan.dart';
import 'package:reddit/post_widget.dart';
import 'package:shamsi_date/shamsi_date.dart';

class PostDetail extends StatelessWidget {
  final TextPost post;
  const PostDetail(this.post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: background,
        body: DetailPostState(post),
      ),
    );
  }
}

class DetailPostState extends StatefulWidget {
  final TextPost taskModel;

  const DetailPostState(this.taskModel, {Key? key}) : super(key: key);
  @override
  State<DetailPostState> createState() => _DetailPostState(taskModel);
}

class _DetailPostState extends State<DetailPostState> {
  TextPost taskModel;
  _DetailPostState(this.taskModel);
  int likeCounter = 0;
  int dislikeCounter = 0;
  int savedPostCounter = 0;
  Icon liked = Icon(
    Icons.thumb_up_alt_outlined,
    color: Color.fromARGB(255, 0, 0, 0),
  );
  Icon disLiked = Icon(
    Icons.thumb_down_alt_outlined,
    color: Color.fromARGB(255, 0, 0, 0),
  );
  Icon bookMark = Icon(
    Icons.bookmark_border_outlined,
    color: Color.fromARGB(255, 0, 0, 0),
  );

  bool isLiked = false;
  bool isDisLiked = false;
  bool isMarked = false;

  bool showComment = true;

  String output = "";
  TextEditingController textcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    int index = taskModel.index;
    return Scaffold(
        backgroundColor: backgroundWidget,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            tooltip: 'Back to home page',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Feed()));
            },
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          title: const Text(
            'Post Detail',
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
            padding: const EdgeInsets.fromLTRB(15, 8, 15, 2),
            children: [
              Row(
                children: [
                  Icon(
                    Icons.circle,
                    size: 60,
                    color: background,
                  ),
                  RichText(
                      text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: " Reddit" "\n" + user.userName,
                        style: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300,
                          color: text,
                        )),
                  ])),
                ],
              ),
              Row(
                children: [
                  const SizedBox(width: 20),
                  RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: "\n" + taskModel.title + "\n\n",
                            style: TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              color: text,
                            )),
                        TextSpan(
                            text: taskModel.text + "\n ",
                            style: TextStyle(
                              fontSize: 14,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              color: text,
                            )),
                      ])),
                ],
              ),
              Row(
                children: [
                  const Spacer(),
                  RichText(
                      textAlign: TextAlign.right,
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: Jalali.fromDateTime(taskModel.dateTime)
                                    .year
                                    .toString() +
                                " , " +
                                Jalali.fromDateTime(taskModel.dateTime)
                                    .month
                                    .toString() +
                                " , " +
                                Jalali.fromDateTime(taskModel.dateTime)
                                    .day
                                    .toString() +
                                "  -  " +
                                Jalali.fromDateTime(taskModel.dateTime)
                                    .hour
                                    .toString() +
                                " : " +
                                Jalali.fromDateTime(taskModel.dateTime)
                                    .minute
                                    .toString() +
                                "\n",
                            style: TextStyle(
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: text,
                            )),
                      ])),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              SizedBox(
                height: 1,
                child: Container(color: const Color.fromARGB(255, 0, 0, 0)),
              ),
              Row(
                children: [
                  IconButton(
                    icon: liked,
                    onPressed: () {
                      setState(() {
                        if (isLiked) {
                          isLiked = !isLiked;
                          liked = const Icon(
                            Icons.thumb_up_alt_outlined,
                            color: Color.fromARGB(255, 0, 0, 0),
                          );
                        } else {
                          isDisLiked = false;
                          isLiked = !isLiked;
                          disLiked = const Icon(
                            Icons.thumb_down_alt_outlined,
                            color: Color.fromARGB(255, 0, 0, 0),
                          );
                          liked = const Icon(
                            Icons.thumb_up_alt_rounded,
                            color: Color.fromARGB(255, 0, 0, 0),
                          );
                        }
                      });
                    },
                  ),
                  Text(
                    isLiked ? "1" : "0",
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  IconButton(
                    icon: disLiked,
                    onPressed: () {
                      setState(() {
                        if (isDisLiked) {
                          isDisLiked = !isDisLiked;
                          disLiked = const Icon(
                            Icons.thumb_down_alt_outlined,
                            color: Color.fromARGB(255, 0, 0, 0),
                          );
                        } else {
                          isDisLiked = !isDisLiked;
                          isLiked = false;
                          liked = const Icon(
                            Icons.thumb_up_alt_outlined,
                            color: Color.fromARGB(255, 0, 0, 0),
                          );
                          disLiked = const Icon(
                            Icons.thumb_down_alt_rounded,
                            color: Color.fromARGB(255, 0, 0, 0),
                          );
                        }
                      });
                    },
                  ),
                  Text(
                    isDisLiked ? "1" : "0",
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(
                      Icons.comment,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    onPressed: () {
                      setState(() {
                        showComment = !showComment;
                        if (showComment) {
                          showCommentRequest(index.toString());
                        }
                      });
                    },
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(
                      Icons.share,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    onPressed: () {},
                  ),
                  const Spacer(),
                  IconButton(
                    icon: bookMark,
                    onPressed: () {
                      setState(() {
                        if (isMarked) {
                          userPosts.savedPost.remove(TextPost(
                              taskModel.title,
                              taskModel.text,
                              taskModel.dateTime,
                              true,
                              userPosts.posts[0].commentCounters,
                              userPosts.posts[0].like,
                              userPosts.posts[0].dislike,
                              userPosts.posts[0].index));
                          isMarked = !isMarked;
                          bookMark = const Icon(
                            Icons.bookmark_border_outlined,
                            color: Color.fromARGB(255, 0, 0, 0),
                          );
                        } else {
                          userPosts.savedPost.add(TextPost(
                              taskModel.title,
                              taskModel.text,
                              taskModel.dateTime,
                              true,
                              userPosts.posts[0].commentCounters,
                              userPosts.posts[0].like,
                              userPosts.posts[0].dislike,
                              userPosts.posts[0].index));
                          isMarked = !isMarked;
                          bookMark = const Icon(
                            Icons.bookmark,
                            color: Color.fromARGB(255, 0, 0, 0),
                          );
                        }
                      });
                    },
                  )
                ],
              ),
              TextField(
                cursorColor: text,
                style: TextStyle(color: text, fontWeight: FontWeight.w600),
                controller: textcontroller,
                decoration: InputDecoration(
                  hintText: 'comment',
                  hintStyle:
                      TextStyle(color: text, fontWeight: FontWeight.w300),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.send_outlined,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      print(textcontroller.text);
                      addCommentRequest(
                          user.userName, textcontroller.text, index.toString());
                      textcontroller.text = "";
                    },
                  ),
                  fillColor: backgroundWidget,
                  filled: true,
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                ),
              ),
              SizedBox(
                height: 5,
                child: Container(),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 13,
                  ),
                  Text(
                    output,
                    style: TextStyle(
                        color: text, fontSize: 18, fontWeight: FontWeight.w700),
                  )
                ],
              )
            ]));
  }

  Future<void> showCommentRequest(String post) async {
    String request = "showcomment\npost:$post\u0000";
    await Socket.connect("10.0.2.2", 8000).then((clientSocket) {
      clientSocket.write(request);
      clientSocket.flush();
      clientSocket.listen((response) {
        print(String.fromCharCodes(response));
        if (String.fromCharCodes(response).startsWith("accepted")) {
          print("accepted");
          output = String.fromCharCodes(response).substring(8);
          print(output);
        } else {
          print("not accepted");
        }
      });
    });
  }

  Future<void> addCommentRequest(
      String username, String comment, String post) async {
    String request =
        "addcomment\nusername:$username,,comment:$comment,,post:$post\u0000";
    await Socket.connect("10.0.2.2", 8000).then((clientSocket) {
      clientSocket.write(request);
      clientSocket.flush();
      clientSocket.listen((response) {
        print(String.fromCharCodes(response));
        if (String.fromCharCodes(response).startsWith("accepted")) {
          print("accepted");
        } else {
          print("not accepted");
        }
      });
    });
  }
}
