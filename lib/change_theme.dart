import 'package:flutter/material.dart';
import 'package:reddit/home_screan.dart';
import 'globals.dart';

void changeTheme(bool isDark) {
  
  if (isDark) {
    LoginText = Color.fromARGB(255, 255, 255, 255);
    LoginBackground = Color.fromARGB(255, 0, 0, 0);
    LoginWidget = Color.fromARGB(255, 151, 9, 9);
  } else {
    LoginBackground = Color.fromARGB(255, 255, 255, 255);
    LoginText = Color.fromARGB(255, 0, 0, 0);
    LoginWidget = Color.fromARGB(255, 35, 133, 79);
  }
}
