library my_prj.globals;

import 'package:flutter/material.dart';
import 'package:reddit/comment.dart';
import 'package:reddit/data.dart';
import 'package:reddit/globals.dart';
import 'package:shamsi_date/shamsi_date.dart';

class commentWidget extends StatefulWidget {
  Textcomment taskModel;
  commentWidget(this.taskModel);

  @override
  State<StatefulWidget> createState() =>
      _MyPostWidgetState(this.taskModel.username, this.taskModel.text);
}

class _MyPostWidgetState extends State<StatefulWidget> {
  String username;
  String comment;
  _MyPostWidgetState(this.username, this.comment);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 1,
            child: Container(color: text),
          ),
          Row(
            children: [
              Icon(
                Icons.circle,
                size: 30,
                color: backgroundWidget,
              ),
              RichText(
                  text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: "\n /u$username\n$comment\n",
                    style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.normal,
                      color: text,
                    )),
              ]))
            ],
          ),
        ],
      ),
    );
  }
}
