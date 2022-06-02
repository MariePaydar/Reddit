import 'package:flutter/material.dart';
import 'globals.dart';

void changeTheme(bool isDark) {
  if (isDark) {
    text = const Color.fromARGB(255, 255, 255, 255);
    background = const Color.fromARGB(255, 0, 0, 0);
    backgroundWidget = const Color.fromARGB(255, 151, 9, 9);
  } else {
    background = const Color.fromARGB(255, 255, 255, 255);
    text = const Color.fromARGB(255, 0, 0, 0);
    backgroundWidget = const Color.fromARGB(255, 35, 133, 79);
  }
}
