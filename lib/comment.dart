import 'dart:html';
import 'dart:io';
import 'package:flutter/material.dart';

class Comment extends StatelessWidget{
  const Comment({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Comments',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title:'Comments'),
    );
  }
}
class MyHomePage extends StatelessWidget{
  final String comment;
  
  const MyHomePage({Key? key,required this.comment}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.comment),
      ),
      body:colomn(
        children:const <Widget>[
          SendComment(),
          ShowComment(),
        ],
      ),
    );
  }
}
class SendCommnet extends StatefulWidget{
  const SendCommnet({Key? key}):super(key: key);

  State<SendCommnet> createState()=> _SendCommentState();
}
class _SendCommentState extends State<SendCommnet>{
  final TextEditingController _controller=TextEditingController(text:"");
  String _log="";
  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(15),
            child: TextField(
              decoration: const InputDecoration(hintText: 'Comment here' ),
              controller: _controller,
            ),
          ),
          IconButton(
            icon: Icon(
                  Icons.send,
                  color: Colors.red,
                ),
            onPressed: (() {
              send(_controller.text);
            }
            ),
          ),
          Text(_log)
        ],
      )
    );
  }
  send(String message) async{
    String request="send\nmessage:$message,,me:ali\u0000";

    await Socket.connect("192.168.1.3", 8000).then((serverSocket){
      serverSocket.write(request);
      serverSocket.flush();
      serverSocket.listen((response){
        print(String.fromCharCodes(response));
        setState((){
          _log +=String.fromCharCodes(response)+ "\n";
        });
      });
    });
  }
}
class  ShowComment extends StatefulWidget{
  const  ShowComment({Key? key}) : super(key:key);

  State< ShowComment> createState()=> _ShowCommentState();
  
}
class _ShowCommentState extends State< ShowComment>{
  List<Widget> messages=List.empty(growable: true);

  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(children: [
        ElevatedButton(
          onPressed: (){
            get(5);
          },
          child: const Text("show comments"),
        ),
        Column(
          children:messages,
          crossAxisAlignment: CrossAxisAlignment.start,
        )
      ],),
    );
  }
  get(int count) async{
    String request="get\ncount$count\u0000";

    await Socket.connect("192.168.1.3", 8000).then((serverSocket){
      serverSocket.write(request);
      serverSocket.flush();
      serverSocket.listen((response) {
        setState(() {
          addMessages(String.fromCharCodes(response));
        });
       });
    });
  }

  addMessages(String str){
    List<Map<String,String>> list= stringToMap(str);

    list.forEach((element) {
      messages.add(Container(
        decoration: BoxDecoration(border: Border.all(),),
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: Column(children: [
          Text(element['me']??"unknown"),
          Text(element['message']??"unknown")
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ));
    });
  }
  List<Map<String,String>> stringToMap(String str){
    List<Map<String,String>> list=List.empty(growable: true);
    final lines =str.trim().split('\n');
    lines.forEach((element) {
      final expr=element.split(",,");
      Map<String,String> map={};
      expr.forEach((el) { 
        int index=el.indexOf(":");
        String key=el.substring(0,index);
        String value=el.substring(index+1);
        map[key]=value;
      });
      list.add(map);
    });
    return list;
  }
}