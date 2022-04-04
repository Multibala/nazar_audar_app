import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nazar_audar_app/constants/colors.dart';
import 'package:nazar_audar_app/models/emotions.dart';

import '../constants/fonts.dart';
import '../models/categories.dart';

class EmotionsPage extends StatefulWidget {
  const EmotionsPage({Key? key}) : super(key: key);

  @override
  State<EmotionsPage> createState() => _EmotionsPageState();
}

class _EmotionsPageState extends State<EmotionsPage> {
  List<Emotions> emotions = [];
  bool isLoading = false;
  bool isLoaded = false;

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/emotions.json');
    final data = await json.decode(response);
    emotions.clear();

    setState(() {
      for (var item in data['emotions']) {
        emotions.add(Emotions.fromJson(item));
      }
      isLoaded = true;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoaded) {
      readJson();
    }

    if (isLoaded) {
      return Scaffold(
        backgroundColor: loginBackgroundColor,
        appBar: AppBar(
          toolbarHeight: 170,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 40,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          elevation: 0.0,
          backgroundColor: loginBackgroundColor,
          flexibleSpace: Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 15),
            child: const Text(
              'Express your emotions',
              style: TextStyle(
                fontFamily: loginPageFont,
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
        ),
        body: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            children: List.generate(emotions.length,
                (index) => emotions[index].widgetOfCategory(context))),
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
