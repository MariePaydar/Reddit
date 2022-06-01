import 'package:flutter/material.dart';  
import 'package:easy_search_bar/easy_search_bar.dart';
import 'Todo_list.dart';

class MyApp extends StatelessWidget {
  const MyApp({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ), //ThemeData
      home: ToDoList(),
    ); //MaterialApp
  }
}