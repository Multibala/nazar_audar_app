import 'package:flutter/material.dart';
import 'package:nazar_audar_app/constants/colors.dart';
import 'package:nazar_audar_app/constants/fonts.dart';
import 'package:nazar_audar_app/constants/routes.dart';
import 'package:nazar_audar_app/db/user_database.dart';
import 'package:nazar_audar_app/models/user_authetication.dart';
import 'package:toast/toast.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // print(DefaultTextStyle.of(context).style.fontFamily);

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
              "Welcome!",
              style: TextStyle(
                color: registrTextColor,
                fontSize: 40,
                fontWeight: FontWeight.w700,
                fontFamily: loginPageFont,
                fontStyle: FontStyle.normal,
              ),
            ),
            const Text(
              "Please, sign in to continue",
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
            buildUsername(),
            const SizedBox(
              height: 19,
            ),
            buildPassword(),
            const SizedBox(height: 21),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: textFieldTextColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: loginPageFont,
                  ),
                ),
              ),
            ]),
            buildButtonGo(),
            const SizedBox(
              height: 67,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don’t have account yet?",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                    fontFamily: loginPageFont,
                  ),
                ),
                TextButton(
                    onPressed: routeToSignUp,
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        color: HexColor.fromHex("#259F82"),
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 20,
                        fontFamily: loginPageFont,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildUsername() {
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
            controller: _username,
            keyboardType: TextInputType.name,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 30),
                hintText: "Username",
                hintStyle: TextStyle(
                    color: textFieldTextColor, fontFamily: loginPageFont)),
          ),
        )
      ],
    );
  }

  Widget buildPassword() {
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
            controller: _password,
            obscureText: true,
            style: const TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 30),
                hintText: "Password",
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
          onPressed: singIn,
          child: const Text(
            "GO",
            style: TextStyle(
              color: Colors.white,
              fontFamily: loginPageFont,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ));
  }

  routeToSignUp() {
    Navigator.pushNamed(context, singupPageRoute);
  }

  singIn() async {
    String username = _username.text.toLowerCase();
    String password = _password.text;
    Map<String, Object?>? mp =
        await UserDatabase.instance.getByUsername(username);
    if (mp != null) {
      String psw = mp[UserField.password] as String;
      String email = mp[UserField.email] as String;
      String surname = mp[UserField.surname] as String;
      if (psw == password) {
        Navigator.pushNamed(context, homePageRoute, arguments: {
          'username': username,
          'surname': surname,
          'email': email,
        });
      } else {
        Toast.show('Plese enter correct password or username', context);
      }
    }
  }
}
