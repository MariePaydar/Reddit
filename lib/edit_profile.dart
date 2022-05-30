import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:email_validator/email_validator.dart';
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
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  String _errorMessage = '';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Center(
          child: Text(
            'Edit Profile',
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Center(
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: TextField(
                cursorColor: const Color.fromARGB(255, 255, 255, 255),
                style: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w600),
                controller: nameController,
                decoration: const InputDecoration(
                    fillColor: Color.fromARGB(255, 151, 9, 9),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(6, 5))),
                    labelText: 'new user name',
                    labelStyle: TextStyle(
                        color: Color.fromARGB(255, 255, 254, 254),
                        fontWeight: FontWeight.w300)),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: TextField(
                cursorColor: const Color.fromARGB(255, 255, 255, 255),
                style: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w600),
                controller: nameController,
                decoration: const InputDecoration(
                    fillColor: Color.fromARGB(255, 151, 9, 9),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(6, 5))),
                    labelText: 'bio',
                    labelStyle: TextStyle(
                        color: Color.fromARGB(255, 255, 254, 254),
                        fontWeight: FontWeight.w300)),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
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
                      borderRadius: BorderRadius.all(Radius.elliptical(6, 5))),
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
            Container(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: PasswordField(
                backgroundColor: const Color.fromARGB(255, 151, 9, 9),
                passwordConstraint:
                    r'(?=.*?[A-Z])(?=.*?[a-z])(?=.*[0-9]).{8,}$',
                controller: passController,
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
                hintText: 'new password',
                border: PasswordBorder(
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.elliptical(6, 5))),
                ),
                errorMessage: 'small & capital letters, number,at least 8 c',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
