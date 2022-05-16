import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/fonts.dart';
import 'package:audioplayers/audioplayers.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final audio_player = AudioPlayer();
  bool isPlaying = false;

  @override
  void initState() {
    // TODO: implement initState
    // setAudio('images/emotions_pic/conversation/audion/me.mp3');
    super.initState();
  }

  Future setAudio(String path) async {
    audio_player.setReleaseMode(ReleaseMode.LOOP);

    final player =
        AudioCache(prefix: 'images/emotions_pic/conversation/audion/');
    final url = await player.load('me.mp3');
    audio_player.setUrl(url.path, isLocal: true);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    audio_player.dispose();
    super.dispose();
  }

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
    // Map<String, dynamic> args = {
    //   'color': 'E6E6E6',
    //   'title': 'hello',
    //   'assetImage': '',
    // };

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
              (index) => getWidgetbyData(commands[index]),
            ),
          ),
        ),
      ),
    );
  }

  Widget getWidgetbyData(Map<String, dynamic> data) {
    String title = data['title'];
    String image = data['assetImage'];
    List phrases = data['phrases'];
    String url = data['audio_url'] ?? '';
    setAudio(url);
    String color = 'E6E6E6';
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        )),
        // padding: MaterialStateProperty.all(
        //     const EdgeInsets.symmetric(vertical: 22, horizontal: 45)),
        backgroundColor: MaterialStateProperty.all(HexColor.fromHex(color)),
      ),
      onPressed: () async {
        if (isPlaying) {
          await audio_player.pause();
        } else {
          var res = await audio_player.play(url);
          // ignore: avoid_print
          print(res);
          if (res == 1) {
            setState(() {
              isPlaying = true;
            });
          }
        }
      },
      child: Column(
        children: [
          Image(
            image: AssetImage(image),
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
}
