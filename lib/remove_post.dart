import 'package:flutter/material.dart';
import 'package:reddit/data.dart';
import 'globals.dart';

void removePost(TextPost post) {
  for (int i = 0; i < userPosts.savedPost.length; i++) {
    if (userPosts.savedPost[i] == post) {
      userPosts.savedPost[i].isSaved = false;
      userPosts.savedPost.removeAt(i);
    }
  }
}
