import 'package:flutter/material.dart';
import 'package:reddit/data.dart';
import 'package:reddit/globals.dart';
import 'package:reddit/home_screan.dart';
import 'package:reddit/post_widget.dart';

class SavedPost extends StatelessWidget {
  final Data2 post;
  const SavedPost(this.post, {Key? key}) : super(key: key);

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
  final Data2 post;

  const DetailPostState(this.post, {Key? key}) : super(key: key);
  @override
  State<DetailPostState> createState() => _DetailPostState();
}

class _DetailPostState extends State<DetailPostState> {
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
          'SavedPost',
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
          child: ListView.builder(
            itemCount: widget.post.savedPost.length,
            itemBuilder: (contex, index) {
              return PostWidget(widget.post.savedPost[index]); // TaskItem
            },
          ), //ListView.builder
        ),
      ),
    );
  }
}
