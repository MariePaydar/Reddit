// ignore_for_file: prefer_const_constructors, prefer_final_fields
import 'package:flutter/material.dart';
import 'package:reddit/about_us_scraen.dart';
import 'package:reddit/change_theme.dart';
import 'package:reddit/create_a_community_screan.dart';
import 'package:reddit/globals.dart';
import 'package:reddit/profile_screan.dart';
import 'package:flutter_switch/flutter_switch.dart';

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
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
      Icon(
        Icons.camera,
        size: 150,
      ),
      Icon(
        Icons.chat,
        size: 150,
      ),
      ListView(children: [
        Container(
          height: 100,
        ),
        const Divider(),
        Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(100, 5, 100, 5),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 151, 9, 9)),
              child: const Text('Your profile'),
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
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 151, 9, 9)),
              child: const Text('create a community'),
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
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 151, 9, 9)),
              child: const Text('Saved post'),
              onPressed: () {
                //forgot create community page
              },
            )),
        const Divider(),
        Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(100, 5, 100, 5),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 151, 9, 9)),
              child: const Text('about us'),
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
          color: Color.fromARGB(255, 0, 0, 0),
          child: Row(
            children: [
              Text(
                'Dark mode ',
                style: TextStyle(color: const Color.fromARGB(255, 151, 9, 9)),
              ),
              Switch(
                value: darkModeStatus,
                activeColor: Colors.red,
                onChanged: (val) {
                  setState(() {
                    darkModeStatus = val;
                    changeTheme(!darkModeStatus);
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
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: const Text(
          'Reddit',
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
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
