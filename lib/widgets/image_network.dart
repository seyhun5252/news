import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageNetwork extends StatelessWidget {
  final String path;
  const ImageNetwork({key, this.path});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: path,
      placeholder: (context, url) {
        return const CircularProgressIndicator();
      },
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
