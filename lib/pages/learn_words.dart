import 'package:flutter/material.dart';
import 'package:nazar_audar_app/constants/colors.dart';
import 'package:nazar_audar_app/constants/fonts.dart';

class LearnWordsPage extends StatefulWidget {
  const LearnWordsPage({Key? key}) : super(key: key);

  @override
  State<LearnWordsPage> createState() => _LearnWordsPageState();
}

class _LearnWordsPageState extends State<LearnWordsPage> {
  int size_word = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: HexColor.fromHex("#FEECE3"),
      ),
      backgroundColor: HexColor.fromHex("#FEECE3"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
              child: Row(),
            ),
          ),
        ]),
      ),
    );
  }
}
