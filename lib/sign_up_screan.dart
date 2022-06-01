// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:reddit/home_screan.dart';
import 'package:reddit/login_screan.dart';
import 'package:reddit/data.dart';

import 'globals.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  StatefulWidget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        body: SignUpPage(),
      ),
    );
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String _errorMessage = '';
  bool _passwordVisible = false;
  String _password = "";
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 60,
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
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: TextField(
                cursorColor: const Color.fromARGB(255, 255, 255, 255),
                style: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w600),
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  fillColor: Color.fromARGB(255, 151, 9, 9),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(60, 50))),
                  hintText: 'Email address',
                  hintStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 254, 254),
                      fontWeight: FontWeight.w300),
                ),
                onChanged: (val) {
                  validateEmail(val);
                },
              ),
            ),
            Text(
              _errorMessage,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Color.fromARGB(255, 151, 9, 9),
                  height: 1),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: TextField(
                cursorColor: const Color.fromARGB(255, 255, 255, 255),
                style: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w600),
                controller: usernameController,
                decoration: const InputDecoration(
                  fillColor: Color.fromARGB(255, 151, 9, 9),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(60, 50))),
                  hintText: 'User Name',
                  hintStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 254, 254),
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
            Text(
              '',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Color.fromARGB(255, 151, 9, 9),
                  height: 1),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: PasswordField(
                backgroundColor: const Color.fromARGB(255, 151, 9, 9),
                passwordConstraint:
                    r'(?=.*?[A-Z])(?=.*?[a-z])(?=.*[0-9]).{8,}$',
                controller: passwordController,
                inputDecoration: PasswordDecoration(
                  errorStyle: const TextStyle(
                    color: Color.fromARGB(255, 151, 9, 9),
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                  inputStyle: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w600,
                  ),
                  hintStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 254, 254),
                      fontWeight: FontWeight.w300),
                ),
                hintText: 'Password',
                border: PasswordBorder(
                  border: const OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(60, 50))),
                ),
                errorMessage: 'small & capital letters, number,at least 8 c',
              ),
            ),
            Container(
              height: 14,
            ),
            Container(
                padding: const EdgeInsets.fromLTRB(100, 5, 100, 5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 151, 9, 9)),
                  child: const Text('Sign up'),
                  onPressed: () {
                    user.userName = usernameController.text;
                    user.email = emailController.text;
                    user.password = passwordController.text;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Feed()));
                  },
                )),
            Row(
              children: <Widget>[
                const Text(
                  'Already a member?',
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                ),
                TextButton(
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ));
  }

  void validateEmail(String val) {
    if (val.isEmpty) {
      setState(() {
        _errorMessage = "Email can not be empty";
      });
    } else if (!EmailValidator.validate(val, true)) {
      setState(() {
        _errorMessage = "Invalid Email Address";
      });
    } else {
      setState(() {
        _errorMessage = "";
      });
    }
  }
}
