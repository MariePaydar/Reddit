library my_prj.globals;

import 'package:flutter/material.dart';
import 'package:reddit/comment.dart';
import 'package:reddit/data.dart';
import 'package:reddit/globals.dart';

class Postdetail extends StatefulWidget {
  TextPost taskModel;
  Postdetail(this.taskModel);

  @override
  State<StatefulWidget> createState() => _MyPostWidgetState(this.taskModel);
}

class _MyPostWidgetState extends State<StatefulWidget> {
  TextPost taskModel;

  _MyPostWidgetState(this.taskModel);

  int likeCounter = 0;
  int dislikeCounter = 0;
  Icon liked = const Icon(
    Icons.thumb_up_alt_outlined,
    color: Color.fromARGB(255, 0, 0, 0),
  );
  Icon disLiked = const Icon(
    Icons.thumb_down_alt_outlined,
    color: Color.fromARGB(255, 0, 0, 0),
  );
  Icon bookMark = const Icon(
    Icons.bookmark_border_outlined,
    color: Color.fromARGB(255, 0, 0, 0),
  );

  bool isLiked = false;
  bool isDisLiked = false;
  bool isMarked = false;

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

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Comment()));
                    //showComment = !showComment;
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
                          true,
                          userPosts.posts[0].commentCounters,
                          userPosts.posts[0].like,
                          userPosts.posts[0].dislike));
                      isMarked = !isMarked;
                      bookMark = const Icon(
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
          Column(),
        ]));
  }
}
