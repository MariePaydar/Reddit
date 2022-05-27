import 'package:flutter/material.dart';
//import 'package:reddit/profile-screan.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Feed> {
  String text = "Welcome to Home";
  int index = 0;

  void onTapNavigation(index) {
    setState(() {
      switch (index) {
        case 0:
          text = "Welcome to Home";
          this.index = 0;
          break;
        case 1:
          this.index = 1;
          text = "Welcome to Store";
          break;
        case 2:
          this.index = 2;
          text = "Welcome to add";
          break;
        case 3:
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
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        body: Center(
          child: Text(text),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "feed"),
            BottomNavigationBarItem(icon: Icon(Icons.store), label: "Society"),
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
