import 'package:flutter/material.dart';
import 'package:reddit/feed_screan.dart';
import 'package:reddit/sign_up_screan.dart';
import 'package:passwordfield/passwordfield.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
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
                cursorColor: const Color.fromARGB(255, 255, 255, 255),
                style: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w600),
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'User Name',
                  hintStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 254, 254),
                      fontWeight: FontWeight.w300),
                  fillColor: Color.fromARGB(255, 151, 9, 9),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(60, 50))),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(70, 10, 70, 0),
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
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 255, 254, 254),
                      fontWeight: FontWeight.w300,
                    )),
                hintText: 'Password',
                border: PasswordBorder(
                  border: const OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(60, 50))),
                ),
                errorMessage: 'small & capital letters, number,at least 8 c',
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text(
                'Forgot Password',
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(100, 5, 100, 5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 151, 9, 9)),
                  child: const Text('Login'),
                  onPressed: () {
                    // ignore: avoid_print
                    print(nameController.text);
                    // ignore: avoid_print
                    print(passwordController.text);
                    runApp(const Feed());
                  },
                )),
            Row(
              children: <Widget>[
                const Text(
                  'Not on Reddit yet?',
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                ),
                TextButton(
                  child: const Text(
                    'Sign-up',
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  onPressed: () {
                    runApp(const SignUp());
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ));
  }
}
