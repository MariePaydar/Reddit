// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

// remove main
void main() {
  runApp(const Profile());
}

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          title: const Center(
            child: Text('Profile'),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 250,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 151, 9, 9),
                    Color.fromARGB(255, 255, 255, 255)
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.5, 0.9],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const <Widget>[
                      CircleAvatar(
                        //backgroundColor: Colors.white70,
                        minRadius: 60.0,
                        backgroundImage:
                            AssetImage('assets/images/profile.png'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Leonardo Palmeiro', //username
                    style: TextStyle(
                      height: 1.5,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Container(
                          height: 40,
                          padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: const Color.fromARGB(255, 0, 0, 0)),
                            child: Row(
                              children: const [
                                Text('Edit'),
                                Icon(
                                  Icons.edit,
                                  size: 18,
                                ),
                              ],
                            ),
                            onPressed: () {
                              // ignore: avoid_print
                              print('edit');
                            },
                          )),
                      Expanded(child: Container()),
                    ],
                  )
                ],
              ),
            ),
            Column(
              children: const <Widget>[
                ListTile(
                  title: Text(
                    'Bio',
                    style: TextStyle(
                      color: Color.fromARGB(255, 151, 9, 9),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '...',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(179, 0, 0, 0),
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Email',
                    style: TextStyle(
                      color: Color.fromARGB(255, 151, 9, 9),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'palmeiro.leonardo@gmail.com',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(179, 0, 0, 0),
                    ),
                  ),
                ),
                Divider(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
