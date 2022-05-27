import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class MainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[],
    );
  }
}

class _MyAppState extends State<Feed> {
  String text = "Feed";
  int index = 0;
  Column C = Column(
    children: const [
      Text(
        '1',
        style: TextStyle(color: Colors.amber),
      ),
      Text(
        '2',
        style: TextStyle(color: Colors.amber),
      )
    ],
  );

  void onTapNavigation(index) {
    setState(() {
      switch (index) {
        case 0:
          C = Column(
            children: const [
              Text(
                '1',
                style: TextStyle(color: Colors.amber),
              ),
              Text(
                '2',
                style: TextStyle(color: Colors.amber),
              )
            ],
          );
          text = "Feed";
          this.index = 0;
          break;
        case 1:
          this.index = 1;
          text = "communities";
          break;
        case 2:
          this.index = 2;
          text = "Create post";
          break;
        case 3:
          this.index = 3;
          text = "Settings";
          C = Column(children: <Widget>[
            ListView(
              children: [
                Text(
                  'Your profile',
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Create a community',
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Saved post',
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'about us',
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ]);
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
          child: C,
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
          currentIndex: index,
          onTap: onTapNavigation,
          unselectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }
}
