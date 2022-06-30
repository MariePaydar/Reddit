import 'package:flutter/material.dart';
import 'package:reddit/comment.dart';
import 'package:reddit/data.dart';
import 'package:reddit/globals.dart';
import 'package:reddit/home_screan.dart';
import 'package:reddit/post_widget.dart';

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
    color: text,
  );
  Icon disLiked = Icon(
    Icons.thumb_down_alt_outlined,
    color: text,
  );
  Icon bookMark = Icon(
    Icons.bookmark_border_outlined,
    color: text,
  );

  bool isLiked = false;
  bool isDisLiked = false;
  bool isMarked = false;

  bool showComment = false;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          tooltip: 'Back to home page',
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Feed()));
          },
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
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
      body: Scaffold(
          backgroundColor: background,
          body: Container(
              decoration: BoxDecoration(
                color: backgroundWidget,
                border: Border.all(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  width: 2,
                ),
              ),
              margin: const EdgeInsets.fromLTRB(10, 3, 10, 0),
              padding: const EdgeInsets.fromLTRB(15, 2, 15, 2),
              child: Column(children: [
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
                RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "\n" + taskModel.title + "\n",
                          style: TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            color: text,
                          )),
                      TextSpan(
                          text: taskModel.text + "\n ",
                          style: TextStyle(
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w300,
                            color: text,
                          )),
                    ])),
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
                            liked = Icon(
                              Icons.thumb_up_alt_outlined,
                              color: Color.fromARGB(255, 0, 0, 0),
                            );
                          } else {
                            isDisLiked = false;
                            isLiked = !isLiked;
                            disLiked = Icon(
                              Icons.thumb_down_alt_outlined,
                              color: Color.fromARGB(255, 0, 0, 0),
                            );
                            liked = Icon(
                              Icons.thumb_up_alt_rounded,
                              color: Color.fromARGB(255, 0, 0, 0),
                            );
                          }
                        });
                      },
                    ),
                    Text(
                      isLiked ? "1" : "0",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    IconButton(
                      icon: disLiked,
                      onPressed: () {
                        setState(() {
                          if (isDisLiked) {
                            isDisLiked = !isDisLiked;
                            disLiked = Icon(
                              Icons.thumb_down_alt_outlined,
                              color: Color.fromARGB(255, 0, 0, 0),
                            );
                          } else {
                            isDisLiked = !isDisLiked;
                            isLiked = false;
                            liked = Icon(
                              Icons.thumb_up_alt_outlined,
                              color: Color.fromARGB(255, 0, 0, 0),
                            );
                            disLiked = Icon(
                              Icons.thumb_down_alt_rounded,
                              color: Color.fromARGB(255, 0, 0, 0),
                            );
                          }
                        });
                      },
                    ),
                    Text(
                      isDisLiked ? "1" : "0",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: Icon(
                        Icons.comment,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Comment()));
                          //showComment = !showComment;
                        });
                      },
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(
                        Icons.share,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      onPressed: () {},
                    ),
                    Spacer(),
                    IconButton(
                      icon: bookMark,
                      onPressed: () {
                        setState(() {
                          if (isMarked) {
                            userPosts.savedPost.remove(TextPost(
                                taskModel.title,
                                taskModel.text,
                                true,
                                userPosts.posts[0].commentCounters,
                                userPosts.posts[0].like,
                                userPosts.posts[0].dislike));
                            isMarked = !isMarked;
                            bookMark = Icon(
                              Icons.bookmark_border_outlined,
                              color: Color.fromARGB(255, 0, 0, 0),
                            );
                          } else {
                            userPosts.savedPost.add(TextPost(
                                taskModel.title,
                                taskModel.text,
                                true,
                                userPosts.posts[0].commentCounters,
                                userPosts.posts[0].like,
                                userPosts.posts[0].dislike));
                            isMarked = !isMarked;
                            bookMark = Icon(
                              Icons.bookmark,
                              color: Color.fromARGB(255, 0, 0, 0),
                            );
                          }
                        });
                      },
                    )
                  ],
                ),
                showComment ? comment : Column(),
              ]))),
    );
  }
}
