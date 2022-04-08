import 'package:flutter/material.dart';
import 'package:nazar_audar_app/constants/colors.dart';
import 'package:nazar_audar_app/constants/fonts.dart';
import 'package:nazar_audar_app/constants/routes.dart';

class HandGestureScreen extends StatefulWidget {
  const HandGestureScreen({Key? key}) : super(key: key);

  @override
  State<HandGestureScreen> createState() => _HandGestureScreenState();
}

class _HandGestureScreenState extends State<HandGestureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: buttonRegistrColor,
      appBar: AppBar(
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.only(top: 0, left: 10),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            iconSize: 40,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        toolbarHeight: 190,
        flexibleSpace: Container(
          padding: const EdgeInsets.only(top: 130, left: 25),
          child: const Text(
            'Hand Gestures',
            style: TextStyle(
              color: txtMainColor,
              fontFamily: loginPageFont,
              fontWeight: FontWeight.w700,
              fontSize: 30,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
        backgroundColor: buttonRegistrColor,
      ),
      body: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                buildRectanle(
                    'Learn Alphabet',
                    const Image(
                      image: AssetImage('images/female_metis_t_shirt_pose.png'),
                      width: 117,
                      height: 101,
                    ),
                    const Color(0xFF53B29C),
                    learnAplhabetPageRoute),
                const SizedBox(
                  height: 16,
                ),
                buildRectanle(
                    'Learn Words',
                    const Image(
                      image: AssetImage(
                          'images/Woman_works_on_laptop_sitting_on_the_floor.png'),
                      width: 152,
                      height: 113,
                    ),
                    const Color(0xFFF8A497),
                    learnWordPageRoute),
                const SizedBox(
                  height: 16,
                ),
                buildRectanle(
                    'Learn Numbers',
                    const Image(
                      image: AssetImage('images/yellow_rocket_flying_up.png'),
                    ),
                    const Color(0xFF7879F1),
                    learnAplhabetPageRoute),
                const SizedBox(
                  height: 16,
                )
              ],
            )),
      ),
    );
  }

  Widget buildRectanle(String title, Image image, Color color, String route) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        padding: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(30))),
        width: double.infinity,
        height: 125,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          SizedBox(
            width: 127,
            child: Text(
              title,
              softWrap: true,
              style: const TextStyle(
                  fontFamily: loginPageFont,
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                  color: txtMainColor),
            ),
          ),
          image,
        ]),
      ),
    );
  }
}
