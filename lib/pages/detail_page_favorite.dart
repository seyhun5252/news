import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/modules/favorite.dart';

import '../controller/favoritedao.dart';
import '../controller/news_controller.dart';
import '../modules/method/image_method.dart';
import '../widgets/web_view.dart';

class DetailPageFavorite extends StatelessWidget {
  final NewsController controller = Get.put(NewsController());

  DetailPageFavorite({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Favorite favorite = Get.arguments;

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
              // controller.view(title: news.title);
            },
            icon: const Icon(Icons.upload_file),
          ),
          IconButton(
            onPressed: () async {
              await FavoriteDAO().kisiSil(
                favorite.title,
              );
            },
            icon: const Icon(Icons.favorite),
          ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 5,
          ),
          ImageMethod.newMethod(
            data: favorite.url.toString(),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            favorite.title.toString(),
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  const Icon(Icons.audio_file),
                  Text(favorite.author ?? 'N/A'),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.calendar_month),
                  Text(favorite.toString()),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 10, right: 10),
                child: Text(favorite.explanation.toString()),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 60.0, right: 60.0, bottom: 10),
        child: SizedBox(
          height: 55,
          width: 10,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              side: const BorderSide(
                width: 2,
                color: Colors.black,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              Get.to(const WebViewApp(), arguments: favorite.urlToImage);
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
