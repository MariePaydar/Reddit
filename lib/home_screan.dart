// ignore_for_file: prefer_const_constructors, prefer_final_fields
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reddit/Todo_list.dart';
import 'package:reddit/about_us_scraen.dart';
import 'package:reddit/add_post.dart';
import 'package:reddit/change_theme.dart';
import 'package:reddit/community_screan.dart';
import 'package:reddit/create_a_community_screan.dart';
import 'package:reddit/data.dart';
import 'package:reddit/globals.dart';
import 'package:reddit/login_screan.dart';
import 'package:reddit/post_detail.dart';
import 'package:reddit/post_page.dart';
import 'package:reddit/profile_screan.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:reddit/taskItem.dart';
import 'package:easy_search_bar/easy_search_bar.dart';

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: background,
        body: MyAppState(),
      ),
    );
  }
}

class MyAppState extends StatefulWidget {
  const MyAppState({Key? key}) : super(key: key);
  @override
  State<MyAppState> createState() => _MyAppState();
}

class _MyAppState extends State<MyAppState> {
  int _selectedIndex = 0;
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController textcontroller = TextEditingController();
  List<DataOfCommunity> tasksList = user.communitylist;
  String searchValue = '';
  void changeIsDone(int index) {
    bool currState = tasksList[index].isDone;
    setState(() {
      tasksList[index].setIsDone(!currState);
    });
  }

  void addTask(DataOfCommunity taskModel) {
    setState(() {
      tasksList.add(taskModel);
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  getPages(BuildContext context) {
    return <Widget>[
      const Icon(
        Icons.call,
        size: 150,
      ),
      Scaffold(
        body: Container(
          child: ListView.builder(
            itemCount: user.communitylist.length,
            itemBuilder: (contex, index) {
              return taskItem(
                taskModel: user.communitylist[index],
                changeIsDone: () => changeIsDone(index),
              ); // TaskItem
            },
          ), //ListView.builder
        ),
      ),
      Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 30, 0),
              child: TextField(
                cursorColor: text,
                style: TextStyle(color: text, fontWeight: FontWeight.w600),
                controller: titlecontroller,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  fillColor: backgroundWidget,
                  filled: true,
                  hintText: 'Add at title',
                  hintStyle:
                      TextStyle(color: text, fontWeight: FontWeight.w300),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 30, 0),
              child: TextField(
                cursorColor: text,
                style: TextStyle(color: text, fontWeight: FontWeight.w600),
                controller: textcontroller,
                decoration: InputDecoration(
                  fillColor: backgroundWidget,
                  filled: true,
                  /* border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(60, 50))),*/
                  hintText: 'Add text body',
                  hintStyle:
                      TextStyle(color: text, fontWeight: FontWeight.w300),
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.fromLTRB(100, 10, 100, 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: backgroundWidget, fixedSize: Size(10, 10)),
                  child: Text('Next',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: text)),
                  onPressed: () {
                    if (textcontroller != null && titlecontroller != null) {
                      user_posts.posts.add(
                          TextPost(titlecontroller.text, textcontroller.text));
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Post()));
                      print(user_posts.posts.toList());
                    }
                  },
                )),
          ])),
      ListView(children: [
        Container(
          height: 100,
        ),
        const Divider(),
        Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(100, 5, 100, 5),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: backgroundWidget),
              child: Text(
                'Your profile',
                style: TextStyle(color: text),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Profile()));
              },
            )),
        const Divider(),
        Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(100, 5, 100, 5),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: backgroundWidget),
              child: Text(
                'create a community',
                style: TextStyle(color: text),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateACommunity()));
              },
            )),
        const Divider(),
        Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(100, 5, 100, 5),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: backgroundWidget),
              child: Text(
                'Saved post',
                style: TextStyle(color: text),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DetailPost()));
              },
            )),
        const Divider(),
        Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(100, 5, 100, 5),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: backgroundWidget),
              child: Text(
                'about us',
                style: TextStyle(color: text),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AboutUs()));
              },
            )),
        Container(
          margin: EdgeInsets.fromLTRB(5, 10, 5, 5),
          padding: const EdgeInsets.fromLTRB(115, 5, 100, 5),
          height: 35,
          width: 150,
          alignment: Alignment.center,
          color: background,
          child: Row(
            children: [
              Text(
                'Dark mode ',
                style: TextStyle(color: const Color.fromARGB(255, 151, 9, 9)),
              ),
              Switch(
                value: darkModeStatus,
                activeColor: const Color.fromARGB(255, 151, 9, 9),
                onChanged: (val) {
                  setState(() {
                    darkModeStatus = val;
                    changeTheme(darkModeStatus);
                  });
                },
              ),
            ],
          ),
        ),
      ])
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      drawer: Drawer(
          backgroundColor: backgroundWidget,
          child: ListView(padding: EdgeInsets.fromLTRB(0, 30, 0, 0), children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 0, 0),
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
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Profile()))),
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
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AboutUs()))),
            ListTile(
                title: const Text('Log out'),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Login()))),
          ])),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: const Text(
          'Reddit',
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
      body: IndexedStack(
        index: _selectedIndex,
        children: getPages(context),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "feed"),
          BottomNavigationBarItem(
              icon: Icon(Icons.people_alt_outlined), label: "communities"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "new post"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "settings"),
        ],
        selectedItemColor: const Color.fromARGB(255, 151, 9, 9),
        iconSize: 18,
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
        unselectedItemColor: const Color.fromARGB(255, 0, 0, 0),
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  List<String> searchResults = ['Coronavirus', 'COVID-19'];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back),
      );

  @override
  Widget buildResults(BuildContext context) {
    return Center(
        child: Text(
      query,
      style: TextStyle(fontSize: 64, color: Colors.black),
    ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResults.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];
          return ListTile(
            title: Text(suggestion),
            onTap: () {
              query = suggestion;
              showResults(context);
            },
          );
        });
  }
}
