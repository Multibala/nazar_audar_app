import 'package:flutter/material.dart';
import 'package:nazar_audar_app/constants/colors.dart';
import 'package:nazar_audar_app/constants/fonts.dart';
import 'package:nazar_audar_app/constants/routes.dart';
import 'package:nazar_audar_app/db/user_database.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:toast/toast.dart';

import '../models/user_authetication.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _username = TextEditingController();
  TextEditingController _surname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    ToastContext().init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: loginBackgroundColor,
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 35,
          vertical: 130,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Create Account",
              style: TextStyle(
                color: registrTextColor,
                fontSize: 40,
                fontWeight: FontWeight.w700,
                fontFamily: loginPageFont,
                fontStyle: FontStyle.normal,
              ),
            ),
            const Text(
              "Please, sign up to get started",
              style: TextStyle(
                color: registrTextColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: loginPageFont,
              ),
            ),
            const SizedBox(
              height: 90,
            ),
            buildTextField('Username'),
            const SizedBox(
              height: 19,
            ),
            buildTextField('Surname'),
            const SizedBox(
              height: 19,
            ),
            buildTextField('Password'),
            const SizedBox(
              height: 19,
            ),
            buildTextField('Email'),
            const SizedBox(
              height: 19,
            ),
            const SizedBox(height: 21),
            buildButtonGo(),
            const SizedBox(
              height: 65,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String name) {
    final controllers = {
      'username': _username,
      'surname': _surname,
      'email': _email,
      'password': _password,
    };
    final controller = controllers[name.toLowerCase()];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          height: 60,
          child: TextField(
            obscureText: name == 'Password',
            controller: controller,
            keyboardType: TextInputType.name,
            style: const TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 30),
                hintText: name,
                hintStyle: TextStyle(
                    color: textFieldTextColor, fontFamily: loginPageFont)),
          ),
        )
      ],
    );
  }

  Widget buildButtonGo() {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(buttonRegistrColor),
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 15)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ))),
          onPressed: signUp,
          child: const Text(
            "Sign Up",
            style: TextStyle(
              color: Colors.white,
              fontFamily: loginPageFont,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ));
  }

  signUp() async {
    String username = _username.text.toLowerCase();
    String surname = _surname.text;
    String email = _email.text;
    String password = _password.text;
    int count = 0;

    if (username.isEmpty) {
      Toast.show('Please Enter Username');
    } else {
      count++;
    }
    if (surname.isEmpty) {
      Toast.show('Please Enter surname');
    } else {
      count++;
    }
    if (email.isEmpty) {
      Toast.show('Please Enter email');
    } else {
      count++;
    }
    if (password.isEmpty) {
      Toast.show('Please Enter password');
    } else {
      count++;
    }
    if (count == 4) {
      User user = User(
          // id: 2,
          username: username,
          email: email,
          password: password,
          surname: surname);
      final a = await UserDatabase.instance.create(user);

      Navigator.of(context).pushNamed(homePageRoute, arguments: {
        'username': username,
        'surname': surname,
        'email': email,
      });
    }
  }
}
