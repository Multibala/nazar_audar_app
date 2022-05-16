import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nazar_audar_app/constants/colors.dart';
import 'package:nazar_audar_app/constants/fonts.dart';
import 'package:toast/toast.dart';

class LearnWordsBraileScreen extends StatefulWidget {
  const LearnWordsBraileScreen({Key? key}) : super(key: key);

  @override
  State<LearnWordsBraileScreen> createState() => _LearnWordsBraileScreenState();
}

class _LearnWordsBraileScreenState extends State<LearnWordsBraileScreen> {
  int current = 0;
  int typing_current = 0;
  var example_words = [
    ['S', 'D', 'U'],
    ['C', 'A', 'T'],
    ['D', 'O', 'G']
  ];
  var guessing_word = [' ', ' ', ' '];
  var example_letters = [
    ['A', 'S', 'M', 'D', 'Q', 'P', 'U', 'N'],
    ['A', 'C', 'M', 'D', 'Q', 'P', 'T', 'N'],
    ['O', 'C', 'M', 'D', 'Q', 'P', 'T', 'G'],
  ];
  var temp_word = ['S', 'D', 'U'];
  var temp_letter = ['A', 'S', 'M', 'D', 'Q', 'P', 'U', 'N'];

  Map is_active = {};

  @override
  void initState() {
    // TODO: implement initState
    ToastContext().init(context);
    for (String item in temp_letter) {
      is_active[item] = false;
    }
    print(is_active);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: HexColor.fromHex("#FFECBB"),
      ),
      backgroundColor: HexColor.fromHex("#FFECBB"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Guess the word',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                    fontFamily: loginPageFont,
                    color: HexColor.fromHex('#555555')),
              ),
              const SizedBox(
                height: 13,
              ),
              Container(
                padding: const EdgeInsets.all(4),
                width: double.infinity,
                height: 218,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(43),
                    border: Border.all(
                      color: Colors.white,
                    )),
                child: Container(
                  width: double.infinity,
                  height: 210,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(43),
                      border: Border.all(
                        color: HexColor.fromHex('#F7D3BC'),
                        width: 3,
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: temp_word
                        .map((e) => getImage_widgetform(e.toLowerCase()))
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(
                height: 33,
              ),
              Container(
                width: temp_word.length * 80,
                height: 64,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: guessing_word
                      .map((e) => enterWordBuilder(context, e))
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 57,
              ),
              SizedBox(
                height: 200,
                child: GridView.count(
                  crossAxisSpacing: 22,
                  mainAxisSpacing: 22,
                  crossAxisCount: 4,
                  children: temp_letter.map((e) => shuffle_chars(e)).toList(),
                ),
              ),
              SizedBox(
                height: 54,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: HexColor.fromHex('53B29C'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onPressed: () {
                    if (temp_word.toString() == guessing_word.toString()) {
                      goNext();
                    } else {
                      Toast.show('word is incorrect)');
                    }
                  },
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: loginPageFont,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            ]),
      ),
    );
  }

  Widget enterWordBuilder(BuildContext context, String char) {
    return ButtonTheme(
      height: 64,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: HexColor.fromHex("#FEECE3"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(
              color: HexColor.fromHex('53B29C'),
              width: 4.0,
            ),
          ),
        ),
        onPressed: () => {
          Future.delayed(const Duration(milliseconds: 100), () {}),
          setState(
            () {
              is_active[char] = false;
              typing_current--;
              if (typing_current < 0) {
                typing_current = 0;
              }

              guessing_word[typing_current] = ' ';
            },
          ),
        },
        child: Text(
          char,
          style: TextStyle(
            color: HexColor.fromHex('FFB550'),
            fontWeight: FontWeight.w800,
            fontSize: 45,
            fontFamily: loginPageFont,
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget shuffle_chars(String char) {
    return ButtonTheme(
      height: 64,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(
              color: is_active[char]
                  ? HexColor.fromHex('53B29C')
                  : HexColor.fromHex('EAC8B7'),
              width: is_active[char] ? 4.0 : 2.0,
            ),
          ),
        ),
        onPressed: () => {
          guessing_word[typing_current] = char,
          typing_current++,
          setState(() {
            is_active[char] = true;
            if (typing_current >= 3) {
              typing_current = 3;
            }
          })
        },
        child: Text(
          char,
          style: TextStyle(
            color: HexColor.fromHex('565656'),
            fontWeight: FontWeight.w800,
            fontSize: 40,
            fontFamily: loginPageFont,
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget getImage_widgetform(String char) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 60,
      ),
      child: Image(
        image: AssetImage(
          "images/braille_letters/${char.toUpperCase()}.png",
        ),
      ),
    );
  }

  goNext() {
    setState(() {
      current++;
      temp_word = example_words[current % 3];
      temp_letter = example_letters[current % 3];
      typing_current = 0;
      guessing_word.clear();
      for (var i = 0; i < temp_word.length; i++) {
        guessing_word.add(' ');
      }
      is_active = {};
      for (String item in temp_letter) {
        is_active[item] = false;
      }
      temp_letter.shuffle();
    });
  }
}
