library my_prj.globals;
import 'package:flutter/material.dart';
import 'package:reddit/data.dart';
import 'package:flutter/cupertino.dart';

class taskItem extends StatelessWidget{
  taskItem({required this.taskModel, required this.changeIsDone});

  final DataOfCommunity taskModel;
  final Function changeIsDone;
  @override
  Widget build(BuildContext context){
    return Container(
      child:ListTile(
        title: Text(taskModel.name),
        trailing:GestureDetector(
          onTap:(){
            changeIsDone();
          },
          child : Container(
            color: Colors.black,
            width:100,
            child: Row(
            children: [
          taskModel.isDone
              ?Icon(
            Icons.star,
            color:Colors.yellow,
          )//Icon
              :Icon(Icons.star_outline),

          ],
        ),//Row
      ),//Container
    ), //GestureDetector
    ), //ListTile
    ); //Container
  }
}