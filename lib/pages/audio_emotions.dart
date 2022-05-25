import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import '../constants/colors.dart';
import '../constants/fonts.dart';

class AudioEmotionsButton extends StatelessWidget {
  late Map<String, dynamic> data;
  // ignore: non_constant_identifier_names
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  AudioEmotionsButton({Key? key, required this.data}) : super(key: key);

  Future setAudio(String path, String prefix) async {
    audioPlayer.setReleaseMode(ReleaseMode.STOP);

    final player = AudioCache(prefix: prefix);
    final url = await player.load(path);
    audioPlayer.setUrl(url.path, isLocal: true);
  }

  @override
  Widget build(BuildContext context) {
    String title = data['title'];
    String image = data['assetImage'];
    List phrases = data['phrases'];
    String url = data['audio_url'] ?? '';
    String prefix = data['prefix'] ?? '';

    setAudio(url, prefix);

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
          await audioPlayer.pause();
        } else {
          await audioPlayer.resume();
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
