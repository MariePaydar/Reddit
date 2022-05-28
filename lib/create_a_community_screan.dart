import 'package:flutter/material.dart';

class CreateACommunity extends StatefulWidget {
  const CreateACommunity({Key? key}) : super(key: key);

  @override
  State<CreateACommunity> createState() => _CreateACommunity();
}

class _CreateACommunity extends State<CreateACommunity> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Profile',
        home: Scaffold(
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            title: const Center(
              child: Text(
                'Create a community',
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
          ),
          body: Container(
            child: Column(children: [
              Text(
                '    community name',
                style: TextStyle(
                    backgroundColor: Color.fromARGB(255, 18, 145, 96),
                    color: Color.fromARGB(255, 255, 255, 255),
                    height: 3),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                child: TextField(
                  cursorColor: const Color.fromARGB(255, 255, 255, 255),
                  style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.w600),
                  controller: nameController,
                  decoration: const InputDecoration(
                    fillColor: Color.fromARGB(255, 151, 9, 9),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(6, 5))),
                    labelText: 'User Name',
                  ),
                ),
              )
            ]),
          ),
        ));
  }
}
