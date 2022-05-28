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
      children: const <Widget>[],
    );
  }
}

class _MyAppState extends State<Feed> {
  String text = "Feed";
  int index = 0;
  ListView C = ListView();

  void onTapNavigation(index) {
    setState(() {
      switch (index) {
        case 0:
          C = ListView(
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
          C = ListView(
            children: [
              Container(
                height: 50,
              ),
              Divider(),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(100, 5, 100, 5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 151, 9, 9)),
                    child: const Text('Your profile'),
                    onPressed: () {
                      //forgot create community page
                    },
                  )),
              Divider(),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(100, 5, 100, 5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 151, 9, 9)),
                    child: const Text('create a community'),
                    onPressed: () {
                      //forgot create community page
                    },
                  )),
              Divider(),
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
              Divider(),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(100, 5, 100, 5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 151, 9, 9)),
                    child: const Text('about us'),
                    onPressed: () {
                      //forgot create community page
                    },
                  )),
            ],
          );
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          title: Center(
            child: Text(
              text,
              style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
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
