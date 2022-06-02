// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:reddit/edit_profile.dart';
import 'package:reddit/home_screan.dart';
import 'globals.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            tooltip: 'Back to home page',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Feed()));
            },
          ),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          title: const Text(
            '                Profile',
            style: const TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 250,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    backgroundWidget,
                    const Color.fromARGB(255, 255, 255, 255)
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
                  Text(
                    user.userName, //username
                    style: const TextStyle(
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const EditProfile()));
                            },
                          )),
                      Expanded(child: Container()),
                    ],
                  )
                ],
              ),
            ),
            Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Bio',
                    style: TextStyle(
                      color: backgroundWidget,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    user.bio,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(179, 0, 0, 0),
                    ),
                  ),
                ),
                const Divider(),
                ListTile(
                  title: Text(
                    'Email',
                    style: TextStyle(
                      color: backgroundWidget,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    user.email,
                    style: const TextStyle(
                      fontSize: 18,
                      color: const Color.fromARGB(179, 0, 0, 0),
                    ),
                  ),
                ),
                const Divider(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
