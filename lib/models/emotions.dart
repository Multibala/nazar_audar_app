import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nazar_audar_app/constants/colors.dart';
import 'package:nazar_audar_app/constants/routes.dart';
import 'package:nazar_audar_app/models/categories.dart';

import '../constants/fonts.dart';

class Emotions {
  late String title;
  late String image;
  late String color;
  late List<dynamic> commands;

  Emotions(
      {required this.color,
      required this.title,
      required this.image,
      required this.commands});

  Widget widgetOfCategory(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        )),
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 22, horizontal: 45)),
        backgroundColor: MaterialStateProperty.all(HexColor.fromHex(color)),
      ),
      onPressed: () {
        Navigator.pushNamed(context, categoryPageRoute, arguments: {
          'commands': commands,
          'title': title,
          'color': color,
        });
      },
      child: Column(
        children: [
          Image(
            image: AssetImage(image),
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.width * 0.3,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: const TextStyle(
              fontFamily: loginPageFont,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  factory Emotions.fromJson(Map<String, dynamic> data) {
    final title = data['title'];
    final color = data['color'];
    final image = data['assetImage'];
    final commands = data['commands'];
    return Emotions(
      color: color as String,
      title: title as String,
      image: image as String,
      commands: commands as List<dynamic>,
    );
  }
}
