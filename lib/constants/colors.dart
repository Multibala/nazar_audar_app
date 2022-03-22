import 'package:flutter/material.dart';

Color loginBackgroundColor = HexColor.fromHex("#fbf5f2");

const registrTextColor = Colors.black;
Color textFieldTextColor = HexColor.fromHex("#909090");
Color buttonRegistrColor = HexColor.fromHex("#EB9F4A");
const txtMainColor = Colors.white;

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
