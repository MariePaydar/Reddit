import 'package:flutter/material.dart';
import 'package:reddit/login_screan.dart';
import 'package:reddit/sign_up_screan.dart';
import 'globals.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  StatefulWidget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: const WelcomePage(),
      ),
    );
  }
}

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(children: <Widget>[
          const SizedBox(
            height: 170,
          ),
          SizedBox(
            height: 120,
            child: Image.asset("assets/images/icon.png"),
          ),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Welcome to Reddit',
                style: TextStyle(
                    color: Color.fromARGB(255, 135, 206, 235),
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ]),
              )),
          SizedBox(
            height: 25,
          ),
          Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(90, 5, 90, 5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: backgroundWidget),
                child: Text(
                  'Login',
                  style: TextStyle(color: text),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Login()));
                },
              )),
          SizedBox(
            height: 10,
          ),
          Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(90, 5, 90, 5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: backgroundWidget),
                child: Text(
                  'Sign up',
                  style: TextStyle(color: text),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUp()));
                },
              )),
        ]));
  }
}
