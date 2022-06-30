import 'package:flutter/cupertino.dart';

class DataOfCommunity {
  String _name = "";
  bool _isPublic = false;
  bool _isDone;
  String admin = "";
  String index = "0";
  List<TextPost> posts = [
    TextPost("\nWelcome to our community\n\n", "...\n ", DateTime.now(), false,
        0, 0, 0, 0)
  ];
  DataOfCommunity(this._name, this.admin,this.index, this._isPublic, this._isDone);
  bool get isDone => _isDone;
  void setIsDone(bool currentState) {
    _isDone = currentState;
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
  String number = "";
  List<DataOfCommunity> communitylist = [];
  List<String> nameOfCommunity = ['choose a community'];
  bool isDarkMode = false;
  Data(this.userName, this.email, this.password);
}

class TextPost {
  String title = "";
  String text = "";

  bool isSaved = false;
  int commentCounters = 0;
  int like = 0;
  int dislike = 0;
  int index = 0;
  DateTime dateTime;
  TextPost(this.title, this.text, this.dateTime, this.isSaved,
      this.commentCounters, this.like, this.dislike, this.index);
}

class Textcomment {
  String username = "";
  String text = "";
  Textcomment(this.username, this.text);
}

class Data2 {
  List<TextPost> posts = [
    TextPost(
        "Welcome to Reddit",
        "This is our AP project in shahid beheshti university\n",
        DateTime.now(),
        false,
        0,
        0,
        0,
        0)
  ];
  List<TextPost> savedPost = [];
}
