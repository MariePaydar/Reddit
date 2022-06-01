library my_prj.globals;
import 'dart:js_util';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddit/data.dart';

class Post extends StatelessWidget {
  Post({Key? key}) : super(key: key);

  @override
  StatefulWidget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
        
        appBar:AppBar(
          toolbarHeight: 100,
         title: Title(
           title: 'community name',
           color: Colors.white,
           child: Container(
             
           ),
         ),
        ),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        body: PostPage(),
      ),
    );
  }
}

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {}
}