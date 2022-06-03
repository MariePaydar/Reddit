import 'package:flutter/cupertino.dart';

class DataOfCommunity {
  String _name = "";
  bool _isPublic = false;
  bool _isDone;
  DataOfCommunity(this._name, this._isPublic, this._isDone);
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
  List<DataOfCommunity> communitylist = [];
  bool isDarkMode = false;
  Data(this.userName, this.email, this.password);
}
class TextPost{
String title="";
String text="";
TextPost(this.title,this.text);
}

class Data2{
  List<TextPost> posts=[];
}