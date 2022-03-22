import 'package:flutter/material.dart';
import 'package:nazar_audar_app/constants/fonts.dart';

class Category {
  late String title;
  late AssetImage image;
  late Color color;

  Category({
    required this.color,
    required this.title,
    required this.image,
  });
}
