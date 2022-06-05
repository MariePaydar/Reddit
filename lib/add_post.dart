import 'package:flutter/material.dart';
import 'package:reddit/data.dart';

import 'globals.dart';

class Add extends StatelessWidget {
  const Add({Key? key}) : super(key: key);

  @override
  StatefulWidget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        body: AddPage(),
      ),
    );
  }
}

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 30, 0),
            child: TextField(
              cursorColor: const Color.fromARGB(255, 255, 255, 255),
              style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.w600),
              controller: titlecontroller,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                fillColor: Color.fromARGB(255, 0, 0, 0),
                filled: true,
                hintText: 'Add at title',
                hintStyle: TextStyle(
                    color: Color.fromARGB(255, 151, 148, 148),
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 30, 0),
            child: TextField(
              cursorColor: const Color.fromARGB(255, 255, 255, 255),
              style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.w600),
              controller: textcontroller,
              decoration: const InputDecoration(
                fillColor: Color.fromARGB(255, 0, 0, 0),
                filled: true,
                /* border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(60, 50))),*/
                hintText: 'Add text body',
                hintStyle: TextStyle(
                    color: Color.fromARGB(255, 151, 148, 148),
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
          Container(
              height: 30,
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: backgroundWidget, fixedSize: Size(10, 10)),
                child: Text('Next',
                    textAlign: TextAlign.center, style: TextStyle(color: text)),
                onPressed: () {
                  if (textcontroller != null && titlecontroller != null) {
                    user_posts.posts.add(
                        TextPost(titlecontroller.text, textcontroller.text));

                    print(user_posts.posts.toList());
                  }
                },
              )),
        ]));
  }
}
