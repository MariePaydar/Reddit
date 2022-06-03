library my_prj.globals;
import 'package:flutter/material.dart';
import 'package:reddit/data.dart';
import 'package:flutter/cupertino.dart';

class task2 extends StatelessWidget{
  task2({required this.taskModel, required this.changeDislike});

  final DataOfCommunity taskModel;
  final Function changeDislike;
  @override
  Widget build(BuildContext context){
    return Container(
      child:ListTile(
        trailing:GestureDetector(
          onTap:(){
            changeDislike();
          },
            child: Row(
            children: [
          taskModel.isDone
              ?Icon(
            Icons.thumb_down,
            color:Colors.red,
          )//Icon
              :Icon(Icons.thumb_down_outlined),

          ],
        ),//Row
      ),
      //Container
    ), //GestureDetector
    ); //Container
  }
}