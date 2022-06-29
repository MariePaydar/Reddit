import 'dart:io';

import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:email_validator/email_validator.dart';
import 'package:reddit/profile_screan.dart';
import 'globals.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        body: EditProfilePage(),
      ),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);
  @override
  State<EditProfilePage> createState() => _EditProfilePage();
}

class _EditProfilePage extends State<EditProfilePage> {
  TextEditingController passController = TextEditingController();
  String _emailErrorMessage = '';
  @override
  void initState() {
    super.initState();
  }

  bool emailIsChecked = false;
  bool usernameIsChecked = false;
  bool passwordIsChecked = false;

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
        usernameIsChecked = false;
      });
    } else {
      setState(() {
        usernameIsChecked = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Center(
          child: Text(
            'Edit Profile',
            style: TextStyle(color: text),
          ),
        ),
      ),
      backgroundColor: background,
      body: Center(
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              '    user name',
              style: TextStyle(color: text, height: 3),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: TextFormField(
                  initialValue: user.userName,
                  cursorColor: text,
                  style: TextStyle(color: text, fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    fillColor: backgroundWidget,
                    filled: true,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                  onChanged: (value) {
                    setState(() {
                      user.userName = value;
                      validateUsername(value);
                    });
                  }),
            ),
            Text(
              '    bio',
              style: TextStyle(color: text, height: 3),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: TextFormField(
                initialValue: user.bio,
                cursorColor: text,
                style: TextStyle(color: text, fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  fillColor: backgroundWidget,
                  filled: true,
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
                onChanged: (value) => setState(() {
                  user.bio = value;
                }),
              ),
            ),
            Text(
              '    email address',
              style: TextStyle(color: text, height: 3),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: TextFormField(
                initialValue: user.email,
                cursorColor: text,
                style: TextStyle(color: text, fontWeight: FontWeight.w600),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  fillColor: backgroundWidget,
                  filled: true,
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
                onChanged: (val) {
                  setState(() {
                    user.email = val;
                    validateEmail(val);
                  });
                },
              ),
            ),
            Text(
              "      " + _emailErrorMessage,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Color.fromARGB(255, 151, 9, 9),
                  height: 1),
            ),
            Text(
              '    password',
              style: TextStyle(color: text, height: 3),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: PasswordField(
                backgroundColor: backgroundWidget,
                passwordConstraint:
                    r'(?=.*?[A-Z])(?=.*?[a-z])(?=.*[0-9]).{8,}$',
                controller: passController,
                inputDecoration: PasswordDecoration(
                    errorStyle: const TextStyle(
                      color: Color.fromARGB(255, 151, 9, 9),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      height: 1,
                    ),
                    inputStyle: TextStyle(
                      color: text,
                      fontWeight: FontWeight.w600,
                    ),
                    hintStyle: TextStyle(
                      color: text,
                      fontWeight: FontWeight.w300,
                    )),
                hintText: 'new password',
                border: PasswordBorder(
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
                errorMessage: 'small & capital letters, number,at least 8 c',
              ),
            ),
            Container(
              alignment: AlignmentDirectional.center,
              padding: const EdgeInsets.fromLTRB(100, 5, 100, 5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
                  alignment: Alignment.center,
                  primary: backgroundWidget,
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(color: text),
                ),
                onPressed: () {
                  setState(() {
                    print("object");
                    print(emailIsChecked);
                    print(_emailErrorMessage);
                    print(usernameIsChecked);
                    if (emailIsChecked && usernameIsChecked) {
                      editProfileRequest(
                          user.email, user.userName, user.password, user.bio);
                    }
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> editProfileRequest(
      String email, String userName, String password, String bio) async {
    String number = user.number;
    String request =
        "editProfile\nemail:$email,,username:$userName,,password:$password,,bio: ,,number:1\u0000";
    await Socket.connect("10.0.2.2", 8000).then((clientSocket) {
      clientSocket.write(request);
      print("request sended");
      clientSocket.flush();
      clientSocket.listen((response) {
        print("response received");
        if (String.fromCharCodes(response) == "accepted") {
          print("accepted");
          user.userName = userName;
          user.email = email;
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Profile()));
        } else if (String.fromCharCodes(response) ==
            "this username is already taken") {
          print("not accepted chon user");
        } else if (String.fromCharCodes(response) ==
            "this email is already have an account") {
          print("not accepted chon email");
        } else {
          print("not accepted");
        }
      });
    });
  }
}
