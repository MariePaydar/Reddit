import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Add extends StatelessWidget {
  const Add({Key? key}) : super(key: key);

  @override
  StatefulWidget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                /* border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(60, 50))),*/
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
        ]));
  }
}
