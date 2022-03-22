import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nazar_audar_app/constants/fonts.dart';
import 'package:nazar_audar_app/constants/routes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, String> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    const marginTxt = SizedBox(
      height: 29,
    );
    String name = args['username'] ?? '';
    String surname = args['surname'] ?? '';
    String password = args['password'] ?? '';
    String email = args['email'] ?? '';
    return Scaffold(
      backgroundColor: Color(0xFFFBF5F2),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 31, vertical: 62),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontFamily: loginPageFont,
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      surname,
                      style: const TextStyle(
                        fontFamily: loginPageFont,
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    color: Color(0xffDCDCDC),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Divider(
              color: Color(0xFF53B29C),
              height: 3,
              thickness: 3,
            ),
            const SizedBox(
              height: 44,
            ),
            buildButton('Messages'),
            marginTxt,
            buildButton('Settings'),
            marginTxt,
            buildButton('Change password'),
            const SizedBox(
              height: 180,
            ),
            buildLogout(context)
          ],
        ),
      ),
    );
  }

  Widget buildLogout(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 230,
      height: 55,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xFFF97D6A),
      ),
      child: TextButton(
        onPressed: () {
          while (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          }

          Navigator.popAndPushNamed(context, loginPageRoute);
        },
        child: const Text(
          'Log out',
          style: TextStyle(
            color: Colors.white,
            fontFamily: loginPageFont,
            fontSize: 20,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget buildButton(String content) {
    return Container(
      width: double.infinity,
      height: 55,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: TextButton(
        onPressed: () {},
        child: Text(
          content,
          style: const TextStyle(
            fontFamily: loginPageFont,
            fontSize: 20,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            color: Color(0xFF555555),
          ),
        ),
      ),
    );
  }
}
