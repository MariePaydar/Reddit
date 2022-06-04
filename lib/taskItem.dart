library my_prj.globals;

import 'package:flutter/material.dart';
import 'package:reddit/community_screan.dart';
import 'package:reddit/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:reddit/globals.dart';

class taskItem extends StatelessWidget {
  taskItem({required this.taskModel, required this.changeIsDone});

  final DataOfCommunity taskModel;
  final Function changeIsDone;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundWidget,
      margin: const EdgeInsets.fromLTRB(5, 2.5, 5, 2.5),

      child: ListTile(
        title: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Community(taskModel.name, user.userName)));
          },
          child: Text(
            taskModel.name,
            style: TextStyle(color: text),
          ),
        ),
        trailing: GestureDetector(
          onTap: () {
            changeIsDone();
          },
          child: Container(
            color: backgroundWidget,
            width: 35,
            child: Row(
              children: [
                taskModel.isDone
                    ? Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ) //Icon
                    : Icon(Icons.star_outline),
              ],
            ), //Row
          ), //Container
        ),
        subtitle: Text(
          'description',
          style: TextStyle(color: text),
        ),
      ), //ListTile
    ); //Container
  }
}
