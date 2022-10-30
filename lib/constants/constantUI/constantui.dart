// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ContastanUIHelper {
  ContastanUIHelper._();

  static TextStyle getTitleTextStyle() {
    return const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    );
  }

  static Divider getDivider() {
    return const Divider(
      color: Colors.grey,
      height: 2,
      thickness: 2,
    );
  }
}
