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
            const Text(
              '    user name',
              style: TextStyle(
                  //backgroundColor: Color.fromARGB(255, 18, 145, 96),
                  color: Color.fromARGB(255, 255, 255, 255),
                  height: 3),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: TextFormField(
                initialValue: user.userName,
                cursorColor: const Color.fromARGB(255, 255, 255, 255),
                style: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w600),
                decoration: const InputDecoration(
                  fillColor: Color.fromARGB(255, 151, 9, 9),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.elliptical(6, 5))),
                ),
                onChanged: (value) => setState(() {
                  user.userName = value;
                }),
              ),
            ),
            const Text(
              '    bio',
              style: TextStyle(
                  //backgroundColor: Color.fromARGB(255, 18, 145, 96),
                  color: Color.fromARGB(255, 255, 255, 255),
                  height: 3),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: TextFormField(
                initialValue: user.bio,
                cursorColor: const Color.fromARGB(255, 255, 255, 255),
                style: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w600),
                decoration: const InputDecoration(
                  fillColor: Color.fromARGB(255, 151, 9, 9),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.elliptical(6, 5))),
                ),
                onChanged: (value) => setState(() {
                  user.bio = value;
                }),
              ),
            ),
            const Text(
              '    email address',
              style: TextStyle(
                  //backgroundColor: Color.fromARGB(255, 18, 145, 96),
                  color: Color.fromARGB(255, 255, 255, 255),
                  height: 3),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: TextFormField(
                initialValue: user.email,
                cursorColor: const Color.fromARGB(255, 255, 255, 255),
                style: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w600),
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  fillColor: Color.fromARGB(255, 151, 9, 9),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.elliptical(6, 5))),
                ),
                onChanged: (val) {
                  validateEmail(val);
                  if (_errorMessage == "") {
                    user.email = val;
                  }
                },
              ),
            ),
            Text(
              "      " + _errorMessage,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Color.fromARGB(255, 151, 9, 9),
                  height: 1),
            ),
            const Text(
              '    password',
              style: TextStyle(
                  //backgroundColor: Color.fromARGB(255, 18, 145, 96),
                  color: Color.fromARGB(255, 255, 255, 255),
                  height: 3),
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
                      height: 1,
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
            Container(
              alignment: AlignmentDirectional.center,
              padding: const EdgeInsets.fromLTRB(100, 5, 100, 5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
                  alignment: Alignment.center,
                  primary: Color.fromARGB(255, 255, 255, 255),
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                onPressed: () => {
                  user.password = passController.text,
                  print(user.userName),
                  print(user.bio),
                  print(user.email),
                  print(user.password),
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Profile()))
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
