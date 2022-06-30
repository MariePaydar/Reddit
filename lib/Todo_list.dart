library my_prj.globals;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddit/data.dart';
import 'package:reddit/globals.dart';
import 'package:reddit/taskItem.dart';
import 'package:easy_search_bar/easy_search_bar.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List<DataOfCommunity> tasksList = user.communitylist;
  String searchValue = '';
  void changeIsDone(int index) {
    bool currState = user.communitylist[index].isDone;
    setState(() {
      user.communitylist[index].setIsDone(!currState);
    });
  }

  void addTask(DataOfCommunity taskModel) {
    setState(() {
      user.communitylist.add(taskModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search',
      theme: ThemeData(primarySwatch: Colors.red),
      home: Scaffold(
        appBar: EasySearchBar(
          iconTheme: IconThemeData(
            color: Color.fromARGB(255, 0, 0, 0),
            opacity: 30,
            size: 40.0,
          ),

          title: const Text('Search'),
          onSearch: (value) => setState(() => searchValue = value),
          //suggestions: tasksList.getName,

          searchCursorColor: Colors.red,
          backgroundColor: Colors.red,
          foregroundColor: Colors.black,
          suggestionBackgroundColor: Colors.red,
        ),
        drawer: Drawer(
            child: ListView(
                padding: EdgeInsets.fromLTRB(100, 100, 100, 100),
                children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 151, 9, 9),
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(onTap: () => Navigator.pop(context)),
              ListTile(onTap: () => Navigator.pop(context))
            ])),
        body: Container(
          child: ListView.builder(
            itemCount: user.communitylist.length,
            itemBuilder: (contex, index) {
              return taskItemOfCommunity(
                taskModel: user.communitylist[index],
                changeIsDone: () => changeIsDone(index),
              ); // TaskItem
            },
          ), //ListView.builder
        ),
      ),
    );
  }
}
