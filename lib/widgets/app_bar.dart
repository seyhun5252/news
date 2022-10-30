import 'package:flutter/material.dart';

import '../constants/constantUI/constantui.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: ContastanUIHelper.getTitleTextStyle(),
      ),
    );
  }
}
