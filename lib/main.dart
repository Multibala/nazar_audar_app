import 'package:flutter/material.dart';
import 'package:nazar_audar_app/pages/category_screen.dart';
import 'package:nazar_audar_app/pages/emotions_screen.dart';
import 'package:nazar_audar_app/pages/hand_gesture.dart';
import 'package:nazar_audar_app/pages/home_screen.dart';
import 'package:nazar_audar_app/pages/learn_alphabet_page.dart';
import 'package:nazar_audar_app/pages/learn_words.dart';
import 'package:nazar_audar_app/pages/login_page.dart';
import 'package:nazar_audar_app/pages/profile_page.dart';
import 'package:nazar_audar_app/pages/signup_page.dart';
import 'constants/routes.dart';
import 'models/emotions.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    routes: {
      loginPageRoute: (context) => LoginPage(),
      singupPageRoute: (context) => SignUpScreen(),
      homePageRoute: (context) => HomeScreen(),
      handGestureRoute: (context) => HandGestureScreen(),
      profilePageRoute: (context) => ProfilePage(),
      emotionsPageRoute: (context) => EmotionsPage(),
      categoryPageRoute: (context) => CategoryPage(),
      learnAplhabetPageRoute: (context) => LearnAlphabetPage(),
      learnWordPageRoute: (context) => LearnWordsPage(),
    },
    initialRoute: loginPageRoute,
  ));
}
