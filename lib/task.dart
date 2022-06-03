library my_prj.globals;
import 'package:flutter/material.dart';
import 'package:reddit/data.dart';
import 'package:flutter/cupertino.dart';

class task extends StatelessWidget{
  task({required this.taskModel, required this.changeLike});

  final DataOfCommunity taskModel;
  final Function changeLike;
  @override
  Widget build(BuildContext context){
    return Container(
      child:ListTile(
        trailing:GestureDetector(
          onTap:(){
            changeLike();
          },
            child: Row(
            children: [
          taskModel.isDone
              ?Icon(
            Icons.thumb_up,
            color:Colors.red,
          )//Icon
              :Icon(Icons.thumb_up_outlined),

          ],
        ),//Row
      ),
      //Container
    ), //GestureDetector
    ); //Container
  }
}