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
          icon: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 255, 255, 255)),
          tooltip: 'Back to setting page',
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Feed()));
          },
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: ListView(
        children: [
          Row(
              children: 
              [
              Icon(
                Icons.circle,
                size: 30,
                color: Color.fromARGB(255, 144, 24, 24),
              ) , 
                Container(
                child: RichText(
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
              ),
            ],
            ),
            Divider(
   thickness: 5, // thickness of the line
   indent: 20, // empty space to the leading edge of divider.
   endIndent: 20, // empty space to the trailing edge of the divider.
   color: Color.fromARGB(255, 144, 24, 24), // The color to use when painting the line.
   height: 20, // The divider's height extent.
 ),
         
        ]
     )
    ); 
  }
  }