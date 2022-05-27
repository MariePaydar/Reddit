import 'package:flutter/material.dart';
//import 'package:reddit/profile-screan.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Feed> {
  String text = "Feed";
  int index = 0;

  void onTapNavigation(index) {
    setState(() {
      switch (index) {
        case 0:
          text = "Feed";
          this.index = 0;
          break;
        case 1:
          this.index = 1;
          text = "Society";
          break;
        case 2:
          this.index = 2;
          text = "Create post";
          break;
        case 3:
          this.index = 3;
          text = "Settings";
          setState(() {
            //runApp(const Profile());
          });
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          title: Center(
            child: Text(
              text,
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        body: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.amber),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "feed"),
            BottomNavigationBarItem(
                icon: Icon(Icons.people_alt_outlined), label: "Society"),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "new post"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "settings"),
          ],
          selectedItemColor: const Color.fromARGB(255, 151, 9, 9),
          iconSize: 18,
          currentIndex: index,
          onTap: onTapNavigation,
          unselectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }
}
