import 'package:flutter/cupertino.dart';

class DataOfCommunity {
  String _name = "";
  bool _isPublic = false;
  bool _isDone;
  bool like;
  bool dislike;
  List<TextPost> posts = [
    TextPost(
      "\nWelcome to our community\n\n",
      "...\n ",false
    )
  ];
  DataOfCommunity(
      this._name, this._isPublic, this._isDone, this.like, this.dislike);
  bool get isDone => _isDone;
  void setIsDone(bool currentState) {
    _isDone = currentState;
  }

  void setlike(bool currentState) {
    like = currentState;
  }

  void setdislike(bool currentState) {
    dislike = currentState;
  }

  bool get isPublic => _isPublic;
  set setDescription(bool value) {
    _isPublic = value;
  }

  String get name => _name;

  set setName(String value) {
    _name = value;
  }

  String get getName {
    return _name;
  }
}

class Data {
  String userName = "";
  String email = "";
  String password = "";
  String bio = "";
  List<DataOfCommunity> communitylist = [];
  List<String> nameOfCommunity = ['choose a community'];
  bool isDarkMode = false;
  Data(this.userName, this.email, this.password);
}

class TextPost {
  String title = "";
  String text = "";
  bool isSaved=false;
  TextPost(this.title, this.text,this.isSaved);
}

class Data2 {
  List<TextPost> posts = [
    TextPost(
      "\nWelcome to Reddit\n\n",
      "This is our AP project in shahid beheshti university\n",false
    )
  ];
   List<TextPost> savedPost=[];
 }
