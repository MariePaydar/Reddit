import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:reddit/data.dart';
import 'globals.dart';

void changeTheme(bool isDark) {
  if (isDark) {
    text = const Color.fromARGB(255, 255, 255, 255);
    background = const Color.fromARGB(255, 0, 0, 0);
    backgroundWidget = const Color.fromARGB(255, 151, 9, 9);
  } else {
    background = const Color.fromARGB(255, 255, 255, 255);
    text = const Color.fromARGB(255, 0, 0, 0);
    backgroundWidget = const Color.fromARGB(255, 135, 206, 235);
  }
}

void dataToArray(String data) {
  user.communitylist.clear();
  user.nameOfCommunity.clear();
  user.nameOfCommunity.add("choose a community");
  List<String> s = data.split("\n");
  for (int i = 0; i < s.length - 1; i++) {
    List<String> s2 = s.elementAt(i).split(" ");
    user.communitylist.add(DataOfCommunity(
        s2.elementAt(0), s2.elementAt(1), s2.elementAt(2), true, false));
    user.nameOfCommunity.add(s2.elementAt(0));
    print(s2.toString());
    print(user.communitylist.length);
  }
}
