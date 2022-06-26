import 'package:flutter/material.dart';
import 'package:reddit/data.dart';
import 'package:reddit/home_screan.dart';
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
          backgroundColor: background,
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
            title: const Center(
              child: Text(
                'Create a community',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
          ),
          body: ListView(children: [
            Text(
              '    community name:',
              style: TextStyle(
                  //backgroundColor: Color.fromARGB(255, 18, 145, 96),
                  color: text,
                  height: 3),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: TextField(
                cursorColor: text,
                style: TextStyle(color: text, fontWeight: FontWeight.w600),
                controller: nameController,
                decoration: InputDecoration(
                    fillColor: backgroundWidget,
                    filled: true,
                    border: const OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(6, 5))),
                    labelText: 'r/',
                    labelStyle: TextStyle(
                      color: text,
                    )),
              ),
            ),
            Text(
              '    community type:',
              style: TextStyle(
                  //backgroundColor: Color.fromARGB(255, 18, 145, 96),
                  color: text,
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
              style: TextStyle(
                  color: backgroundWidget, fontWeight: FontWeight.w600),
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
                    primary: backgroundWidget,
                  ),
                  child:
                      Text('Create community', style: TextStyle(color: text)),
                  onPressed: () {
                    user.nameOfCommunity.add('r/' + nameController.text);
                    user.communitylist.add(DataOfCommunity(
                        'r/' + nameController.text,
                        dropdownValue == 'Public',
                        false,
                        false,
                        false));
                    Navigator.pop(context);
                  },
                )),
          ]),
        ));
  }
}
