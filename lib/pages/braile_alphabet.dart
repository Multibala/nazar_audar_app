import 'package:flutter/material.dart';
import 'package:nazar_audar_app/constants/colors.dart';

import '../constants/fonts.dart';

class LearnBraileAlphabet extends StatelessWidget {
  var alphabet = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];
  LearnBraileAlphabet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor.fromHex("#FFECBB"),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: HexColor.fromHex("#FFECBB"),
        leading: Container(
          margin: const EdgeInsets.only(top: 0, left: 10),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: HexColor.fromHex('#777777')),
            iconSize: 40,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        toolbarHeight: 190,
        flexibleSpace: Container(
          padding: const EdgeInsets.only(top: 150),
          child: const Text(
            'Alphabet',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontFamily: loginPageFont,
              fontWeight: FontWeight.w700,
              fontSize: 30,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.60,
        padding: const EdgeInsets.symmetric(horizontal: 33),
        children: List.generate(26, getWordWidgetCanvas),
      ),
    );
  }

  Widget getWordWidgetCanvas(index) {
    return Container(
        // width: 156,

        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(37),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(37),
              ),
              border: Border.all(
                width: 3,
                color: HexColor.fromHex('#FFECBB'),
              )),
          // width: 145,
          // height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(
                    'images/braille_letters/${alphabet[index].toUpperCase()}.png'),
                // height: 101,
                // width: 71,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                alphabet[index] + alphabet[index].toLowerCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: loginPageFont,
                  fontWeight: FontWeight.w700,
                  fontSize: 50,
                ),
              )
            ],
          ),
        ));
  }
}
