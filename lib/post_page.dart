library my_prj.globals;
import 'dart:js_util';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddit/data.dart';
import 'package:reddit/globals.dart';

import 'home_screan.dart';

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
       leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          tooltip: 'Back to setting page',
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Feed()));
          },
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title:RichText(
           text:  TextSpan(children: <TextSpan>[
                TextSpan(
                    text: user.userName+"\n"+'salam'+'\n',
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                      color: Color.fromARGB(255, 0, 0, 0),
                    )),
              ])),          
        ),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: ListView(
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                border: Border.all(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  width: 8,
                ),
              ),
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              padding: const EdgeInsets.fromLTRB(50, 20, 50, 10),
              child: RichText(
                  text: const TextSpan(children: <TextSpan>[
                TextSpan(
                    text: "AP final project, 1400-1401\nDr.Vahidi  \n ",
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                      color: Color.fromARGB(255, 0, 0, 0),
                    )),
              ])),
            ),
          ),
        ]
     )
    ); 
  }
  }