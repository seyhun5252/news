import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/news_controller.dart';

class SearchButton extends StatelessWidget {
  final NewsController upcomingController = Get.put(NewsController());

  SearchButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 9.0, left: 9.0, top: 15),
      child: TextField(
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
          hintText: 'Type a Text',
          prefix: Icon(Icons.search),
          suffix: Icon(Icons.home),
          border: OutlineInputBorder(),
        ),
        onSubmitted: (String deger) {
          upcomingController.isDeger.value = deger;
          upcomingController.fetcData(data: deger);
        },
      ),
    );
  }
}
