import 'package:flutter/material.dart';
import 'package:nazar_audar_app/constants/colors.dart';
import 'package:nazar_audar_app/constants/fonts.dart';
import 'package:nazar_audar_app/constants/routes.dart';
import 'package:nazar_audar_app/models/user_authetication.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Map<String, String> varArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    String? surname = varArgs['surname'];
    String? username = varArgs['username'];
    String? email = varArgs['email'];

    return Scaffold(
      backgroundColor: loginBackgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 62, horizontal: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text(
                    'Welcome,',
                    style: TextStyle(
                      fontFamily: loginPageFont,
                      fontWeight: FontWeight.w400,
                      fontSize: 28,
                    ),
                  ),
                  Text(
                    username as String,
                    style: const TextStyle(
                      fontFamily: loginPageFont,
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                    ),
                  ),
                ]),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, profilePageRoute,
                        arguments: varArgs);
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffc4c4c4),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 36),
            const Text(
              'Available Lessons:',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 28,
                fontFamily: loginPageFont,
              ),
            ),
            const SizedBox(height: 18),
            build_rectangle(
              'Braille',
              'Get started to learn Braille Alphabet',
              Icons.abc_outlined,
              Colors.black,
              brailePageRoute,
            ),
            const SizedBox(
              height: 11,
            ),
            build_rectangle(
              'Gesture',
              'Learn to talk with sign language',
              Icons.abc_outlined,
              const Color(0xFFFDB34E),
              handGestureRoute,
            ),
            const SizedBox(
              height: 11,
            ),
            build_rectangle(
              'Emotions',
              'Express your emotions with pictures',
              Icons.abc_outlined,
              const Color(0xFF1C7BB1),
              emotionsPageRoute,
            ),
          ],
        ),
      ),
    );
  }

  Widget build_rectangle(String title, String content, IconData icon,
      Color color, String routeName) {
    return TextButton(
        onPressed: () {
          openPagebyRoute(routeName);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 25),
          height: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color,
          ),
          child: Row(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontFamily: loginPageFont,
                    fontWeight: FontWeight.w700,
                    fontSize: 36,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    content,
                    softWrap: true,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontFamily: loginPageFont,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            Icon(icon),
          ]),
        ));
  }

  void openPagebyRoute(String routeName) {
    Navigator.pushNamed(context, routeName);
  }
}
