import 'package:flutter/material.dart';
import 'package:reddit/home_screan.dart';
import 'package:reddit/sign_up_screan.dart';
import 'package:passwordfield/passwordfield.dart';
import 'globals.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: background,
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'User Name',
                  hintStyle:
                      TextStyle(color: text, fontWeight: FontWeight.w300),
                  fillColor: backgroundWidget,
                  filled: true,
                  border: const OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(const Radius.elliptical(60, 50))),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: PasswordField(
                backgroundColor: backgroundWidget,
                passwordConstraint: user.password,
                controller: passwordController,
                inputDecoration: PasswordDecoration(
                    errorStyle: TextStyle(
                      color: const Color.fromARGB(255, 151, 9, 9),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                    inputStyle: TextStyle(
                      color: text,
                      fontWeight: FontWeight.w600,
                    ),
                    hintStyle: TextStyle(
                      color: text,
                      fontWeight: FontWeight.w300,
                    )),
                hintText: 'Password',
                border: PasswordBorder(
                  border: const OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(60, 50))),
                ),
                errorMessage: '             password is incorrect',
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: Text(
                'Forgot Password',
                style: TextStyle(color: text, height: 1),
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(100, 5, 100, 5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: backgroundWidget),
                  child: Text(
                    'Login',
                    style: TextStyle(color: text),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Feed()));
                  },
                )),
            Row(
              children: <Widget>[
                Text(
                  'Not on Reddit yet?',
                  style: TextStyle(color: text),
                ),
                TextButton(
                  child: Text(
                    'Sign-up',
                    style: TextStyle(fontSize: 15, color: text),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ));
  }
}
