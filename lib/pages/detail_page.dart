import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:news/controller/favoritedao.dart';
import 'package:news/modules/extensions/sized_extensions.dart';

import '../controller/news_controller.dart';
import '../models/news_model.dart';
import '../modules/method/image_method.dart';
import '../widgets/web_view.dart';

class DetailPage extends StatelessWidget {
  final NewsController controller = Get.put(NewsController());

  DetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsModel news = Get.arguments;

    final now = news.publishedAt;
    var time = DateFormat('dd-MM-yyyy').format(now);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Share.share('check out  website ${news.url}', subject: 'Good');
              controller.view(title: news.title);
            },
            icon: const Icon(Icons.upload_file),
          ),
          IconButton(
            onPressed: () async {
              await FavoriteDAO().addFavorite(
                news.title,
                news.description.toString(),
                news.publishedAt.toString(),
                news.author,
                news.urlToImage.toString(),
                news.url.toString(),
              );
            },
            icon: const Icon(Icons.favorite),
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 1.0.h,
          ),
          ImageMethod.newMethod(
            data: news.urlToImage.toString(),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          Text(
            news.title.toString(),
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 2.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  const Icon(Icons.audio_file),
                  Text(news.author ?? 'N/A'),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.calendar_month),
                  Text(time.toString()),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 10, right: 10),
                child: Text(news.description.toString()),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 60.0, right: 60.0, bottom: 10),
        child: SizedBox(
          height: 8.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              side: BorderSide(
                width: 0.5.w,
                color: Colors.black,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              Get.to(const WebViewApp(), arguments: news.url);
            },
            child: Text(
              'News Source',
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: Colors.black,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
