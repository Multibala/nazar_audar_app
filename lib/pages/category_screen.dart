import 'package:flutter/material.dart';
import 'package:nazar_audar_app/pages/audio_emotions.dart';

import '../constants/colors.dart';
import '../constants/fonts.dart';
import 'package:audioplayers/audioplayers.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    // print(args);
    List<dynamic> commands = [];
    setState(() {
      commands = args['commands'];
    });

    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Scaffold(
        backgroundColor: HexColor.fromHex(args['color']),
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
          backgroundColor: HexColor.fromHex(args['color']),
          flexibleSpace: Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(
              args['title'],
              style: const TextStyle(
                fontFamily: loginPageFont,
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: HexColor.fromHex('#FBF5F2'),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
          ),
          height: double.infinity,
          width: double.infinity,
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            children: List.generate(
              commands.length,
              (index) => AudioEmotionsButton(data: commands[index]),
            ),
          ),
        ),
      ),
    );
  }
}
