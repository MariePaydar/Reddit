import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:reddit/login-screan.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  StatefulWidget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        body: const LogInPage(),
      ),
    );
  }
}

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
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
              height: 150,
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
              padding: const EdgeInsets.fromLTRB(70, 10, 70, 10),
              child: TextField(
                cursorColor: Color.fromARGB(255, 255, 255, 255),
                style: TextStyle(
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
                ),
                onChanged: (val) {
                  validateEmail(val);
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(70, 10, 70, 10),
              child: TextField(
                cursorColor: Color.fromARGB(255, 255, 255, 255),
                style: TextStyle(
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
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(70, 10, 70, 0),
              child: PasswordField(
                backgroundColor: Color.fromARGB(255, 151, 9, 9),
                passwordConstraint:
                    r'(?=.*?[A-Z])(?=.*?[a-z])(?=.*[0-9]).{8,}$',
                controller: passwordController,
                inputDecoration: PasswordDecoration(
                    errorStyle: TextStyle(
                      color: Color.fromARGB(255, 151, 9, 9),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                    inputStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.w600,
                    ),
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w400,
                    )),
                hintText: 'Password',
                border: PasswordBorder(
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(60, 50))),
                ),
                errorMessage: 'small & capital letters, number,at least 8 c',
              ),
            ),
            Container(
              height: 5,
            ),
            Container(
                padding: const EdgeInsets.fromLTRB(100, 5, 100, 5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 151, 9, 9)),
                  child: const Text('Sign up'),
                  onPressed: () {
                    print(emailController.text);
                    print(usernameController.text);
                    print(passwordController.text);
                  },
                )),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _errorMessage,
                style: TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
            ),
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
                    runApp(const Login());
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
