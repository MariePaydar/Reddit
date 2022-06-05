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
import 'package:reddit/post_widget.dart';
import 'package:reddit/profile_screan.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:reddit/taskItem.dart';
import 'package:easy_search_bar/easy_search_bar.dart';

class Community extends StatelessWidget {
  final DataOfCommunity com;

  final String moderator;
  const Community(this.com, this.moderator, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: background,
        body: CommunityState(com, moderator),
      ),
    );
  }
}

class CommunityState extends StatefulWidget {
  DataOfCommunity com;

  String moderator;

  CommunityState(this.com, this.moderator, {Key? key}) : super(key: key);
  @override
  State<CommunityState> createState() => _CommunityState();
}

class _CommunityState extends State<CommunityState> {
  _CommunityState();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: background,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(300.0), // here the desired height
            child: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: backgroundWidget,
                  shadows: const [
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 1.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ],
                ),
                tooltip: 'Back to home page',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Feed()));
                },
              ),
              bottom: TabBar(
                labelColor: text,
                indicatorColor: backgroundWidget,
                tabs: [
                  Tab(
                    text: 'Posts',
                  ),
                  Tab(
                    text: 'About',
                  ),
                ],
              ),
              flexibleSpace: Column(
                //mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Image(
                    image: AssetImage('assets/images/communityImage.jpg'),
                    fit: BoxFit.fitWidth,
                  ),
                  Row(
                    children: [
                      Spacer(flex: 5),
                      RichText(
                          text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: widget.com.getName + "\n",
                            style: TextStyle(
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0),
                            )),
                        TextSpan(
                            text: "1 members  1 online",
                            style: TextStyle(
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w300,
                              color: Color.fromARGB(255, 0, 0, 0),
                            )),
                      ])),
                      Spacer(flex: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          alignment: Alignment.center,
                          primary: backgroundWidget,
                          shadowColor: text,
                        ),
                        child: Text(
                          join,
                        ),
                        onPressed: () {
                          setState(() {
                            if (join == "Join")
                              join = "Joined";
                            else
                              join = "Join";
                          });
                        },
                      ),
                      Spacer(flex: 5),
                    ],
                  ),
                ],
              ),
              iconTheme: IconThemeData(
                color: backgroundWidget,
                shadows: const [
                  Shadow(
                    offset: Offset(2.0, 2.0),
                    blurRadius: 1.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: backgroundWidget,
                    shadows: const [
                      Shadow(
                        offset: Offset(2.0, 1.0),
                        blurRadius: 1.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ],
                  ),
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: MySearchDelegate(),
                    );
                  },
                )
              ],
              backgroundColor: Colors.transparent,
            ),
          ),
          body: TabBarView(
            children: [
              Scaffold(
                body: Container(
                  child: ListView.builder(
                    itemCount: widget.com.posts.length,
                    itemBuilder: (contex, index) {
                      return PostWidget(widget.com.posts[index]); // TaskItem
                    },
                  ), //ListView.builder
                ),
              ),
              Column(children: <Widget>[
                const Divider(),
                ListTile(
                  title: Text(
                    'Moderators',
                    style: TextStyle(
                      color: backgroundWidget,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '    u/' + widget.moderator,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(179, 0, 0, 0),
                    ),
                  ),
                )
              ])
            ],
          ),
        ));
  }
}
