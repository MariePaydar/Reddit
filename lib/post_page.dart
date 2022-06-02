library my_prj.globals;
import 'dart:js_util';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddit/data.dart';
import 'package:reddit/globals.dart';

class Post extends StatelessWidget {
  const Post({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
          title: Title(
            title: user.userName,
            color: Color.fromARGB(255, 113, 94, 94),
            child: Container(
             alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.all(10),
                child: Text(
                  user.communitylist[0].name,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 30),
                )

      ),
          ),
      ),
      );
  }
  }