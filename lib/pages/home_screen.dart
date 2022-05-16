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
      body: Column(children: [
        Container(
          // padding: EdgeInsets.only(top: 50),
          height: 175,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome,',
                      style: TextStyle(
                        fontFamily: loginPageFont,
                        fontWeight: FontWeight.w400,
                        fontSize: 28,
                      ),
                    ),
                    Text(
                      getCapitalize(username as String),
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
        ),
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
          width: double.infinity,
          height: 560,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Column(
              children: [
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
                  'images/braile_icon.png',
                  Colors.black,
                  brailePageRoute,
                ),
                const SizedBox(
                  height: 11,
                ),
                build_rectangle(
                  'Gesture',
                  'Learn to talk with sign language',
                  '',
                  const Color(0xFFFDB34E),
                  handGestureRoute,
                ),
                const SizedBox(
                  height: 11,
                ),
                build_rectangle(
                  'Emotions',
                  'Express your emotions with pictures',
                  'images/emotions_icon.png',
                  const Color(0xFF1C7BB1),
                  emotionsPageRoute,
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }

  Widget build_rectangle(String title, String content, String data, Color color,
      String routeName) {
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
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SizedBox(
              width: 175,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontFamily: loginPageFont,
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
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
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            data != ''
                ? Image(
                    image: AssetImage(data),
                    width: 60,
                    height: 60,
                  )
                : Container()
          ]),
        ));
  }

  void openPagebyRoute(String routeName) {
    Navigator.pushNamed(context, routeName);
  }
}
