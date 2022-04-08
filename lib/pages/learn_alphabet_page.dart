import 'package:flutter/material.dart';
import 'package:nazar_audar_app/constants/colors.dart';

import '../constants/fonts.dart';

class LearnAlphabetPage extends StatelessWidget {
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
  LearnAlphabetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var urlTemp = 'images/Aa.png';

    return Scaffold(
      backgroundColor: HexColor.fromHex("#FEECE3"),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: HexColor.fromHex("#FEECE3"),
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
          padding: const EdgeInsets.only(top: 150, left: 33),
          child: const Text(
            'Alphabet',
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
        width: 156,
        // height: 400,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
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
                color: HexColor.fromHex('#FFF7D3BC'),
              )),
          // width: 145,
          height: 234,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('images/Aa.png'),
                // height: 101,
                // width: 71,
              ),
              Text(
                alphabet[index] + alphabet[index].toLowerCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
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
