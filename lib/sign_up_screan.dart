// ignore_for_file: avoid_print
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:provider/provider.dart';
import 'package:reddit/home_screan.dart';
import 'package:reddit/login_screan.dart';
import 'package:reddit/data.dart';
import 'globals.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  StatefulWidget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(backgroundColor: background, body: SignUpPage()));
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
  String _emailErrorMessage = '';
  String _userErrorMessage = '';
  bool _passwordVisible = false;
  String _password = "";
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  bool emailIsChecked = false;
  bool usernameIsChecked = false;
  bool passwordIsChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 160,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: TextField(
                cursorColor: text,
                style: TextStyle(color: text, fontWeight: FontWeight.w600),
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  fillColor: backgroundWidget,
                  filled: true,
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  hintText: 'Email address',
                  hintStyle:
                      TextStyle(color: text, fontWeight: FontWeight.w300),
                ),
                onChanged: (val) {
                  validateEmail(val);
                },
              ),
            ),
            Text(
              _emailErrorMessage,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: const Color.fromARGB(255, 151, 9, 9),
                  height: 1),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: TextField(
                cursorColor: text,
                style: TextStyle(color: text, fontWeight: FontWeight.w600),
                controller: usernameController,
                decoration: InputDecoration(
                  fillColor: backgroundWidget,
                  filled: true,
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  hintText: 'User Name',
                  hintStyle:
                      TextStyle(color: text, fontWeight: FontWeight.w300),
                ),
                onChanged: (val) {
                  validateUsername(val);
                },
              ),
            ),
            Text(
              _userErrorMessage,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: const Color.fromARGB(255, 151, 9, 9),
                  height: 1),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: PasswordField(
                backgroundColor: backgroundWidget,
                passwordConstraint:
                    r'(?=.*?[A-Z])(?=.*?[a-z])(?=.*[0-9]).{8,}$',
                controller: passwordController,
                inputDecoration: PasswordDecoration(
                  errorStyle: const TextStyle(
                    color: Color.fromARGB(255, 151, 9, 9),
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                  inputStyle: TextStyle(
                    color: text,
                    fontWeight: FontWeight.w600,
                  ),
                  hintStyle:
                      TextStyle(color: text, fontWeight: FontWeight.w300),
                ),
                hintText: 'Password',
                border: PasswordBorder(
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                ),
                errorMessage: 'small & capital letters, number,at least 8 c',
              ),
            ),
            Container(
              height: 14,
            ),
            /*ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
                primary: backgroundWidget,
                onPrimary: Colors.black,
                minimumSize: Size(double.infinity, 50),
              ),
              icon: FaIcon(
                FontAwesomeIcons.google,
                color: Colors.red,
              ),
              label: Text('Sign Up with Google',
                  style: TextStyle(
                    color: text,
                  )),
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.googleLogin();
              },
            ),*/
            Container(
                padding: const EdgeInsets.fromLTRB(100, 5, 100, 5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: backgroundWidget),
                  child: Text(
                    'Sign up',
                    style: TextStyle(color: text),
                  ),
                  onPressed: () {
                    if (usernameIsChecked && emailIsChecked) {
                      user.userName = usernameController.text;
                      user.email = emailController.text;
                      user.password = passwordController.text;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Feed()));
                    }
                  },
                )),
            Row(
              children: <Widget>[
                Text(
                  'Already a member?',
                  style: TextStyle(color: text),
                ),
                TextButton(
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 15, color: text),
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
        _emailErrorMessage = "Email can not be empty";
        emailIsChecked = false;
      });
    } else if (!EmailValidator.validate(val, true)) {
      setState(() {
        _emailErrorMessage = "Invalid Email Address";
        emailIsChecked = false;
      });
    } else {
      setState(() {
        _emailErrorMessage = "";
        emailIsChecked = true;
      });
    }
  }

  void validateUsername(String val) {
    if (val.isEmpty) {
      setState(() {
        _userErrorMessage = "username can not be empty";
        usernameIsChecked = false;
      });
    } else {
      setState(() {
        _userErrorMessage = "";
        usernameIsChecked = true;
      });
    }
  }
}
