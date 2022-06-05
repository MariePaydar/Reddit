import 'package:flutter/cupertino.dart';

class DataOfCommunity {
  String _name = "";
  bool _isPublic = false;
  bool _isDone;
  bool like;
  bool dislike;
  List<TextPost> posts = [
    TextPost(
      "\nWhat's that Johnny Cash song about a troublemaker who turns out to be Jesus?\n\n",
      "Sorry for the spoiler, but anyway--I've heard it a dozen times, but can't find it in a google search. I keep getting pointed to unrelated songs. This one has to be from between 1968 and '72, and it talks about this long-haired guy who's walkin' around in sandals talking against war and materialism and hangin' out with thieves and prostitutes and getting the young folks all riled up. And then the authorities finally round him up and nail him to a cross.\n ",
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
  TextPost(this.title, this.text);
}

class Data2 {
  List<TextPost> posts = [
    TextPost(
      "\nWelcome to Reddit\n\n",
      "This is our AP project in shahid beheshti university\n",
    )
  ];
}
