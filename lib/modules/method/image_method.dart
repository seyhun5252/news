import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageMethod {
  ImageMethod._();

  static Widget newMethod({String data}) {
    if (data == 'null') {
      return Image.asset(
        'assets/images/indir.png',
      );
    } else {
      try {
        return CachedNetworkImage(
          imageUrl: data,
          placeholder: (context, url) {
            return const CircularProgressIndicator();
          },
          errorWidget: (context, url, error) => const Icon(Icons.error),
        );
      } catch (e) {
        return Image.asset(
          'assets/images/indir.png',
        );
      }
    }
  }
}
