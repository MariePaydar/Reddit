import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddit/home_screan.dart';
import 'package:reddit/sign_up_screan.dart';
/*
class GooglePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Somthing Went Wrong!'),
              );
            } else if (snapshot.hasData) {
              return Feed();
            } else {
              return SignUp();
            }
          }));
}*/
