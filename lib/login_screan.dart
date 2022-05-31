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
        backgroundColor: LoginBackground,
        body: MyStatefulWidget(),
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
              height: 60,
            ),
            SizedBox(
              height: 120,
              child: Image.asset("assets/images/icon.png"),
            ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Welcome to Reddit',
                  style: TextStyle(
                      color: LoginText,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: TextField(
                cursorColor: LoginText,
                style: TextStyle(color: LoginText, fontWeight: FontWeight.w600),
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'User Name',
                  hintStyle:
                      TextStyle(color: LoginText, fontWeight: FontWeight.w300),
                  fillColor: LoginWidget,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(60, 50))),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: PasswordField(
                backgroundColor: LoginWidget,
                passwordConstraint: user.password,
                controller: passwordController,
                inputDecoration: PasswordDecoration(
                    errorStyle: TextStyle(
                      color: LoginWidget,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                    inputStyle: TextStyle(
                      color: LoginText,
                      fontWeight: FontWeight.w600,
                    ),
                    hintStyle: TextStyle(
                      color: LoginText,
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
                style: TextStyle(color: LoginText, height: 1),
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(100, 5, 100, 5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: LoginWidget,
                  ),
                  child: const Text('Login'),
                  onPressed: () {
                    // ignore: avoid_print
                    print(nameController.text);
                    // ignore: avoid_print
                    print(passwordController.text);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Feed()));
                  },
                )),
            Row(
              children: <Widget>[
                Text(
                  'Not on Reddit yet?',
                  style: TextStyle(
                    color: LoginText,
                  ),
                ),
                TextButton(
                  child: Text(
                    'Sign-up',
                    style: TextStyle(
                      fontSize: 15,
                      color: LoginText,
                    ),
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
