import 'package:flutter/material.dart';
import 'package:reddit/data.dart';
import 'globals.dart';

class CreateACommunity extends StatefulWidget {
  const CreateACommunity({Key? key}) : super(key: key);

  @override
  State<CreateACommunity> createState() => _CreateACommunity();
}

class _CreateACommunity extends State<CreateACommunity> {
  TextEditingController nameController = TextEditingController();
  String dropdownValue = 'Public';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Create a community',
        home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            title: const Center(
              child: Text(
                'Create a community',
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
          ),
          body: ListView(children: [
            const Text(
              '    community name',
              style: TextStyle(
                  //backgroundColor: Color.fromARGB(255, 18, 145, 96),
                  color: Color.fromARGB(255, 255, 255, 255),
                  height: 3),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
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
                    labelText: 'r/',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 254, 254),
                    )),
              ),
            ),
            const Text(
              '    community type',
              style: TextStyle(
                  //backgroundColor: Color.fromARGB(255, 18, 145, 96),
                  color: Color.fromARGB(255, 255, 255, 255),
                  height: 4),
            ),
            Center(
                child: DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(
                Icons.arrow_downward,
                size: 20,
              ),
              elevation: 0,
              style: const TextStyle(
                  color: Color.fromARGB(255, 151, 9, 9),
                  fontWeight: FontWeight.w600),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>['Public', 'Private'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            )),
            const Divider(),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 151, 9, 9),
                  ),
                  child: const Text('Create community'),
                  onPressed: () {
                    user.communitylist.add(DataOfCommunity(
                        nameController.text, dropdownValue == 'Public',false));
                    Navigator.pop(context);
                    print(user.communitylist.toList());
                  },
                )),
          ]),
        ));
  }
}
