// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constantUI/constantui.dart';
import '../models/news_model.dart';
import '../modules/method/image_method.dart';
import '../pages/detail_page.dart';

class NewsListItem extends StatelessWidget {
  final NewsModel news;
  const NewsListItem({key, this.news});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(DetailPage(), arguments: news);
      },
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Text(
                news.title.toString(),
                maxLines: 5,
              ),
              subtitle: Text(news.content.toString(), maxLines: 5),
              trailing:
                  ImageMethod.newMethod(data: '${news.urlToImage.toString()}'),
              // trailing: newMethod(data: '${news.urlToImage.toString()}'),
            ),
            ContastanUIHelper.getDivider(),
          ],
        ),
      ),
    );
  }
}
