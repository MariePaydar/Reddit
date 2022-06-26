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
  bool usernameIsChecked = false;
  bool passwordIsChecked = false;
  String _passwordErrorMessage = '';
  String _userErrorMessage = '';
  @override
  Widget build(BuildContext context) {
    String _errorMessage = "";
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
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: PasswordField(
                backgroundColor: backgroundWidget,
                controller: passwordController,
                passwordConstraint: user.password,
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
                    hintStyle: TextStyle(
                      color: text,
                      fontWeight: FontWeight.w300,
                    )),
                hintText: 'Password',
                errorMessage: _errorMessage,
                border: PasswordBorder(
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                ),
              ),
            ),
            TextButton(
              child: Text(
                'Forgot Password',
                style: TextStyle(color: text, height: 1),
              ),
              onPressed: () {
                //forgot password screen
              },
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
                    setState(() {
                      if(usernameIsChecked){
                      if (nameController.text == user.userName ) {
                        if(passwordIsChecked){
                          if(passwordController.text==user.password){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Feed()));}
                                else{
                                  _errorMessage = '             password is incorrect';
                                }
                                }
                                else{
                                  _errorMessage= '             password is empty';
                                }
                      } else {
                        _errorMessage = '             username is incorrect';
                      }}
                      else{
                        _errorMessage= '             username is empty';
                      }
                    });
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
  void validatePassword(String val) {
    if (val.isEmpty) {
      setState(() {
        _passwordErrorMessage = "password can not be empty";
        passwordIsChecked = false;
      });
    } else {
      setState(() {
        _passwordErrorMessage = "";
        passwordIsChecked= true;
      });
    }
  }

}
